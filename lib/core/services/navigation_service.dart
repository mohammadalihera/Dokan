import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToAndBack(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToAndClearAll(String routeTo, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeTo, (Route<dynamic> route) => false, arguments: arguments);
  }

  goBack() {
    return navigatorKey.currentState!.pop();
  }
}
