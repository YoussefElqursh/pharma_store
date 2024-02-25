import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_store/shared/networks/end_points.dart';
import 'package:pharma_store/shared/networks/remote/helper/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin ({required String email, required String password})
  {
    emit(LoginLoadingState());

    DioHelper.postData(
        url: login,
        data:
        {
          'email':email,
          'password':password
        }
    ).then((value){
      if (kDebugMode) {
        print(value?.data);
      }
      emit(LoginSuccessState());
    }).catchError((error){
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;
  void changeSuffixIcon(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(LoginShowPasswordState());
  }
}
