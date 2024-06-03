import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_show_case/core/cubits/app/app_cubit.dart';
import 'package:product_show_case/core/model/registration/registration_response.dart';

import 'package:product_show_case/core/repository/auth_repository.dart';
import 'package:product_show_case/core/services/navigation_service.dart';
import 'package:product_show_case/core/services/service_locator.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepository authRepository = AuthRepository();
  final _navigationService = serviceLocator<NavigationService>();

  final AppCubit appCubit;

  AuthCubit({required this.appCubit}) : super(AuthInitial());

  void registration({required String name, required String email, required String password}) async {
    RegistrationResponse? registrationResponse = await authRepository.registration(
      password: password,
      name: name,
      email: email,
    );
    if (registrationResponse != null && registrationResponse.status == true) {
      emit(RegistrationSuccessState());
    } else {
      emit(RegistrationFailedState());
    }
  }
}
