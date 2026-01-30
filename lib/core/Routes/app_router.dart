import 'package:eventapp/Authentication/forget_password/Forget_Password_Screen.dart';
import 'package:eventapp/Authentication/login/Login_Screen.dart';
import 'package:eventapp/Authentication/register/Register_Screen.dart';
import 'package:eventapp/Onboarding/OnbourdingScreen.dart';
import 'package:eventapp/SplashView/SplashScreen.dart';
import 'package:eventapp/core/Routes/pages_route_names.dart';
import 'package:flutter/material.dart';

import '../../Onboarding/onBoarding_pages.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.splash:
        return MaterialPageRoute(
          builder: (context) => const Splashscreen(),
          settings: settings,
        );
      case PageRouteName.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const Onbourdingscreen(),
          settings: settings,
        );
      case PageRouteName.onBoardingPages:
        return MaterialPageRoute(
          builder: (context) => OnboardingPages(),
          settings: settings,
        );
      case PageRouteName.loginScreen:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
          settings: settings,
        );
      case PageRouteName.registerScreen:
        return MaterialPageRoute(
          builder: (context) => RegisterScreen(),
          settings: settings,
        );
      case PageRouteName.forgerPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => ForgetPasswordScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Splashscreen(),
          settings: settings,
        );
    }
  }
}
