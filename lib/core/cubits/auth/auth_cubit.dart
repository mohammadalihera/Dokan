import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_show_case/core/cubits/app/app_cubit.dart';
import 'package:product_show_case/core/model/registration/registration_data.dart';
import 'package:product_show_case/core/model/registration/registration_response.dart';

import 'package:product_show_case/core/repository/auth_repository.dart';
import 'package:product_show_case/core/services/navigation_service.dart';
import 'package:product_show_case/core/services/service_locator.dart';
import 'package:product_show_case/core/utils/network_connections.dart';

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
}
