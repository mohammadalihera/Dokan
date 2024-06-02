import 'package:get_it/get_it.dart';

import 'package:product_show_case/core/services/navigation_service.dart';

GetIt serviceLocator = GetIt.instance;
void setupServiceLocator() {
  serviceLocator.registerLazySingleton(() => NavigationService());
}
