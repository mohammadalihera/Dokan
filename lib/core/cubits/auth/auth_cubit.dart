import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_show_case/core/cubits/app/app_cubit.dart';
import 'package:product_show_case/core/model/user/user_data.dart';
import 'package:product_show_case/core/model/registration/registration_data.dart';
import 'package:product_show_case/core/model/registration/registration_response.dart';

import 'package:product_show_case/core/repository/auth_repository.dart';
import 'package:product_show_case/core/services/navigation_service.dart';
import 'package:product_show_case/core/services/service_locator.dart';
import 'package:product_show_case/core/utils/db/shared_preference_helper.dart';
import 'package:product_show_case/core/utils/network_connections.dart';
import 'package:product_show_case/ui/router.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepository authRepository = AuthRepository();
  final _navigationService = serviceLocator<NavigationService>();

  final AppCubit appCubit;

  AuthCubit({required this.appCubit}) : super(AuthInitial());

  Future<void> registration({
    required String name,
    required String email,
    required String password,
    required String confirmPass,
  }) async {
    if (password != confirmPass) {
      emit(RegistrationFailedState(message: 'Password And Confirm Password Mismatched!'));
      return;
    }
    try {
      bool hasConnection = await NetworkConnection.checkConnection();
      if (hasConnection == false) {
        emit(RegistrationFailedState(message: 'You Have No Internet Connection!'));
        return;
      }

      RegistrationData? registrationResponse = await authRepository.registration(
        password: password,
        name: name,
        email: email,
      );

      if (registrationResponse != null && registrationResponse.code == 200) {
        emit(RegistrationSuccessState(message: registrationResponse.message ?? 'Registration Success'));
      } else {
        emit(RegistrationFailedState(message: registrationResponse?.message ?? 'Registration Failed'));
      }
    } catch (e) {
      emit(RegistrationFailedState(message: 'Registration Failed'));
    }
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      bool hasConnection = await NetworkConnection.checkConnection();
      if (hasConnection == false) {
        emit(RegistrationFailedState(message: 'You Have No Internet Connection!'));
        return;
      }

      UserData? loginData = await authRepository.login(
        password: password,
        username: username,
      );

      if (loginData != null && loginData.token != null) {
        await SharedPreferenceHelper.setUserToken(loginData.token);
        await SharedPreferenceHelper.setCurrentUser(loginData);

        appCubit.loadApp();

        emit(LoginSuccessState(message: 'Login Success'));
      } else {
        emit(LoginFailedState(message: 'Login Failed'));
      }
    } catch (e) {
      emit(LoginFailedState(message: 'Login Failed'));
    }
  }

  void logout() async {
    await SharedPreferenceHelper.setUserToken(null);
    await SharedPreferenceHelper.setCurrentUser(null);

    _navigationService.navigateToAndClearAll(RouteTo.loginPage);
  }

  Future<void> updateUser({
    required String name,
  }) async {
    try {
      bool hasConnection = await NetworkConnection.checkConnection();
      if (hasConnection == false) {
        emit(RegistrationFailedState(message: 'You Have No Internet Connection!'));
        return;
      }

      UserData? updateResponse = await authRepository.updateUser(
        name: name,
      );

      if (updateResponse != null) {
        UserData? userData = await SharedPreferenceHelper.getCurrentUser();
        UserData updatedUserData = UserData();
        updatedUserData = UserData.copyFrom(updateResponse);
        print(updatedUserData);
        updatedUserData.user_display_name = '${updateResponse.first_name} ${updateResponse.last_name}';
        updatedUserData.user_nicename = updateResponse.first_name;
        updatedUserData.user_email = updateResponse.email;
        updatedUserData.token = userData?.token;

        await SharedPreferenceHelper.setCurrentUser(updatedUserData);
        appCubit.loadApp();
        emit(UpdateUserSuccessState(message: 'Update Success'));
      } else {
        emit(UpdateUserFailedState(message: 'Update Failed'));
      }
    } catch (e) {
      emit(UpdateUserFailedState(message: 'Update Failed'));
    }
  }
}
