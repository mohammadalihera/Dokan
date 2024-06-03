import 'package:flutter/material.dart';

import 'package:product_show_case/ui/pages/home/home_page.dart';
import 'package:product_show_case/ui/pages/login/login_page.dart';
import 'package:product_show_case/ui/pages/registration/registration_page.dart';

class RouteTo {
  static const String loginPage = '/loginPage';
  static const String registrationPage = '/registrationPage';
  static const String homePage = '/homePage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case registrationPage:
        return MaterialPageRoute(builder: (_) => const RegistrationPage());
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
