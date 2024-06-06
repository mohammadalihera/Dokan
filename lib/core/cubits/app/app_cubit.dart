import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:product_show_case/core/model/user/user_data.dart';
import 'package:product_show_case/core/utils/db/shared_preference_helper.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial()) {
    loadApp();
  }

  void loadApp() async {
    emit(AppInitial());
    String? userToken = SharedPreferenceHelper.getUserToken();
    UserData? user = SharedPreferenceHelper.getCurrentUser();

    bool isLoggedIn = false;
    if (userToken != null && userToken.isNotEmpty && user != null) {
      print(userToken);
      isLoggedIn = true;
      emit(LoadedAppState(
        isLoggedIn: isLoggedIn,
        user: user,
      ));
      return;
    } else {
      emit(LoadedAppState(isLoggedIn: isLoggedIn));
    }
  }
}
