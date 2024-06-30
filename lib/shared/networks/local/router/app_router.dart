import 'package:flutter/material.dart';
import 'package:pharma_store/layout/home_layout/home_layout.dart';

import '../../../../module/1-splash_module/splash_screen.dart';
import '../../../../module/2-choose_language_module/choose_language_screen.dart';
import '../../../../module/3-onboarding_module/onboarding_screen.dart';
import '../../../../module/4-getstarted_module/getstarted_screen.dart';
import '../../../../module/5-login_module/login_screen.dart';
import '../../../../module/6-forgot_password_module/forgot_password_screen.dart';
import '../../../../module/6-forgot_password_module/new_password_screen.dart';
import '../../../../module/6-forgot_password_module/password_changed_screen.dart';
import '../../../../module/6-forgot_password_module/reset_via_email_screen.dart';
import '../../../../module/6-forgot_password_module/reset_via_sms_screen.dart';
import '../../../../module/6-forgot_password_module/verify_email_screen.dart';
import '../../../../module/6-forgot_password_module/verify_phone_number_screen.dart';
import '../../../../module/7-create_account_module/create_account_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'HomeLayoutRoute':
        return HomeLayout.route();
      case 'SplashScreenRoute':
        return SplashScreen.route();
      case 'LanguageScreenRoute':
        return ChooseLanguageScreen.route();
      case 'OnBoardingRoute':
        return OnBoardingScreen.route();
      case 'GetStartedRoute':
        return GetStartedScreen.route();
      case 'LoginScreenRoute':
        return LoginScreen.route();
      case 'ForgotPasswordScreenRoute':
        return ForgotPasswordScreen.route();
      case 'ResetViaSmsScreenRoute':
        return ResetViaSmsScreen.route();
      case 'ResetViaEmailScreenRoute':
        return ResetViaEmailScreen.route();
      case 'VerifyPhoneNumberScreenRoute':
        return VerifyPhoneNumber.route();
      case 'VerifyEmailScreenRoute':
        return VerifyEmailScreen.route();
      case 'NewPasswordScreenRoute':
        return NewPasswordScreen.route();
      case 'PasswordChangedScreenRoute':
        return PasswordChangedScreen.route();
      case 'CreateAccountScreenRoute':
        return CreateAccountScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
    );
  }
}
