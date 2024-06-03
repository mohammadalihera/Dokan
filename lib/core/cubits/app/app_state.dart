part of 'app_cubit.dart';

sealed class AppState extends Equatable {
  const AppState();

  @override
  List<Object?> get props => [];
}

final class AppInitial extends AppState {}

final class LoadedAppState extends AppState {
  bool isLoggedIn = false;
  UserData? user;

  LoadedAppState({required this.isLoggedIn, this.user});

  LoadedAppState copyWith({bool? isLoggedIn, UserData? user}) {
    return LoadedAppState(isLoggedIn: isLoggedIn ?? this.isLoggedIn, user: user ?? this.user);
  }

  @override
  List<Object?> get props => [isLoggedIn];
}
