import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../networks/end_points.dart';
import '../../networks/local/cache_helper.dart';

part 'login_state.dart';

class LoginAuthCubit extends Cubit<LoginAuthState> {
  LoginAuthCubit() : super(LoginAuthInitialState());
  static LoginAuthCubit get(context) => BlocProvider.of(context);

  void userLogin({required String username, required String password}) async {
    emit(LoginAuthLoadingState());
    try {
      final response = await http.post(
        Uri.parse(baseUrl + loginRoute),
        body: {
          "userName": username,
          "password": password,
          "userType": "pharmacy",
        },
      );

      debugPrint('Response status code: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        if (data != null && data['accessToken'] != null && data['refreshToken'] != null) {
          debugPrint('User login success and his data is: $data');
          CacheHelper.insertToCache(key: 'token', value: data['accessToken']);
          CacheHelper.insertToCache(key: 'refreshToken', value: data['refreshToken']);

          // Decode the access token to get the expiry time
          final accessToken = data['accessToken'];
          final expirationDate = JwtDecoder.getExpirationDate(accessToken);
          _scheduleTokenRefresh(expirationDate);

          emit(LoginAuthSuccessState());
        } else {
          debugPrint('Error: Access token or refresh token is missing in the response.');
          emit(LoginAuthErrorState(message: 'Access token or refresh token is missing.'));
        }
      } else if (response.statusCode == 401) {
        final data = jsonDecode(response.body);
        final errorMessage = data != null && data['message'] != null ? data['message'] : 'Unauthorized';
        debugPrint('User login failed: $errorMessage');
        emit(LoginAuthErrorState(message: errorMessage));
      } else {
        final data = jsonDecode(response.body);
        final errorMessage = data != null && data['message'] != null ? data['message'] : 'Unexpected error';
        debugPrint('Unexpected error: $errorMessage');
        emit(LoginAuthErrorState(message: errorMessage));
      }
    } catch (e) {
      debugPrint('Exception: $e');
      emit(LoginAuthErrorState(message: e.toString()));
    }
  }

  Future<void> refreshToken() async {
    final refreshToken = CacheHelper.getFromCache(key: 'refreshToken');
    if (refreshToken == null) {
      emit(LoginAuthErrorState(message: 'Refresh token not found.'));
      _handleLogout();
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(baseUrl + loginRoute),
        body: {
          'refreshToken': refreshToken,
        },
      );

      debugPrint('Refresh token response status code: ${response.statusCode}');
      debugPrint('Refresh token response body: ${response.body}');

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        if (data != null && data['accessToken'] != null) {
          CacheHelper.insertToCache(key: 'token', value: data['accessToken']);

          // Decode the new access token to get the new expiry time
          final accessToken = data['accessToken'];
          final expirationDate = JwtDecoder.getExpirationDate(accessToken);
          _scheduleTokenRefresh(expirationDate);

          debugPrint('Token refreshed successfully.');
          emit(LoginAuthSuccessState());
        } else {
          debugPrint('Error: Access token is missing in the refresh response.');
          emit(LoginAuthErrorState(message: 'Access token is missing in the refresh response.'));
        }
      } else {
        final data = jsonDecode(response.body);
        final errorMessage = data != null && data['message'] != null ? data['message'] : 'Unexpected error';
        debugPrint('Refresh token error: $errorMessage');
        emit(LoginAuthErrorState(message: errorMessage));
        _handleLogout();
      }
    } catch (e) {
      debugPrint('Exception during token refresh: $e');
      emit(LoginAuthErrorState(message: e.toString()));
      _handleLogout();
    }
  }

  void _scheduleTokenRefresh(DateTime expirationDate) {
    final refreshTime = expirationDate.subtract(const Duration(minutes: 5)); // Refresh 5 minutes before expiry

    final durationUntilRefresh = refreshTime.difference(DateTime.now());
    if (durationUntilRefresh.isNegative) {
      // If the duration is negative, refresh the token immediately
      refreshToken();
    } else {
      Future.delayed(durationUntilRefresh, () {
        refreshToken();
      });
    }
  }

  void _handleLogout() {
    // Clear cached tokens
    CacheHelper.removeFromCache(key: 'token');
    CacheHelper.removeFromCache(key: 'refreshToken');

    // Navigate to login screen or show a logout message
    // This depends on your app's navigation setup
    // For example:
    emit(LoginAuthLoggedOutState());
  }
}
