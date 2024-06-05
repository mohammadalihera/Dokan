part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedState extends HomeState {
  List<Product> productList;
  HomeLoadedState({required this.productList});

  HomeLoadedState copyWith({List<Product>? productList}) {
    return HomeLoadedState(productList: productList ?? this.productList);
  }

  @override
  List<Object?> get props => [productList];
}
