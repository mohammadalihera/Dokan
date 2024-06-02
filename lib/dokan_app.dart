import 'package:flutter/material.dart';
import 'package:product_show_case/core/services/navigation_service.dart';
import 'package:product_show_case/core/services/service_locator.dart';
import 'package:product_show_case/ui/router.dart';

import 'ui/pages/login/login_page.dart';
import 'ui/theme/thems.dart';

class DokanApp extends StatelessWidget {
  const DokanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: serviceLocator<NavigationService>().navigatorKey,
      title: 'Dokan',
      theme: Themes.jhLight,
      onGenerateRoute: RouteTo.generateRoute,
      home: const LoginPage(),
    );
  }
}
