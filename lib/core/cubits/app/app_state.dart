part of 'app_cubit.dart';

sealed class AppState extends Equatable {
  const AppState();

  @override
  List<Object?> get props => [];
}

final class AppInitial extends AppState {}

final class LoadedAppState extends AppState {
  bool isLoggedIn = false;

  LoadedAppState({required this.isLoggedIn});

  LoadedAppState copyWith({bool? isLoggedIn}) {
    return LoadedAppState(isLoggedIn: isLoggedIn ?? this.isLoggedIn);
  }

  @override
  List<Object?> get props => [isLoggedIn];
}
