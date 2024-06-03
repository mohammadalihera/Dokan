import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import 'package:product_show_case/core/services/service_locator.dart';
import 'package:product_show_case/core/utils/db/shared_preference_helper.dart';
import 'package:product_show_case/core/utils/network_connections.dart';
import 'package:product_show_case/dokan_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.getInstance();
  setupServiceLocator();
  NetworkConnection.instance;
  FlavorConfig(
    name: "PROD",
    variables: {
      "baseUrl": "http://apptest.dokandemo.com/",
    },
  );
  runApp(const DokanApp());
}
