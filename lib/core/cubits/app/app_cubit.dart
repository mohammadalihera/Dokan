import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_show_case/core/services/navigation_service.dart';
import 'package:product_show_case/core/services/service_locator.dart';
import 'package:product_show_case/core/utils/db/shared_preference_helper.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final _navigationService = serviceLocator<NavigationService>();
  AppCubit() : super(AppInitial());

  void loadApp() async {
    emit(AppInitial());
    String? userToken = SharedPreferenceHelper.getUserToken();
    // User? user =  SharedPreferenceHelper.getCurrentUser();

    bool isLoggedIn = false;
    if (userToken != null && userToken.isNotEmpty /* && user != null */) {
      isLoggedIn = true;
      emit(LoadedAppState(
        isLoggedIn: isLoggedIn,
      ));
    } else {
      emit(LoadedAppState(isLoggedIn: isLoggedIn));
    }
  }
}
