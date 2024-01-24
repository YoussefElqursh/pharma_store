import 'package:flutter/material.dart';

import '../../../../module/1-splash_module/splash_screen.dart';
import '../../../../module/2-choose_language_module/choose_language_screen.dart';
import '../../../../module/3-onboarding_module/onboarding_screen.dart';
import '../../../../module/4-getstarted_module/getstarted_screen.dart';
import '../../../../module/5-login_module/login_screen.dart';
import '../../../../module/6-forgot_password_module/forgot_password_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
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
