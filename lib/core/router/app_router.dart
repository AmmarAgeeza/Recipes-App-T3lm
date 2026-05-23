import 'package:flutter/material.dart';
import '../constants/app_routes.dart';
import '../constants/app_strings.dart';
import '../../features/auth/presentation/screens/login_screen.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case AppRoutes.signUp:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(AppStrings.signUpScreenComingSoon),
            ),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(AppStrings.routeNotFound),
            ),
          ),
        );
    }
  }
}
