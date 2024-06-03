part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

final class AuthInitial extends AuthState {}

final class RegistrationSuccessState extends AuthState {
  String message;
  RegistrationSuccessState({required this.message});
  @override
  List<Object?> get props => [message];
}

final class RegistrationFailedState extends AuthState {
  String message;
  RegistrationFailedState({required this.message});
  @override
  List<Object?> get props => [message];
}
