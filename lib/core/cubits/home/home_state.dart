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
  bool newProduct;
  bool oldProduct;
  bool bestSale;
  bool highLow;
  bool lowHigh;
  HomeLoadedState({
    required this.productList,
    this.bestSale = false,
    this.newProduct = false,
    this.oldProduct = false,
    this.highLow = false,
    this.lowHigh = false,
  });

  HomeLoadedState copyWith({
    List<Product>? productList,
    bool? newProduct,
    bool? oldProduct,
    bool? bestSale,
    bool? highLow,
    bool? lowHigh,
  }) {
    return HomeLoadedState(
      productList: productList ?? this.productList,
      newProduct: newProduct ?? this.newProduct,
      oldProduct: oldProduct ?? this.oldProduct,
      bestSale: bestSale ?? this.bestSale,
      highLow: highLow ?? this.highLow,
      lowHigh: lowHigh ?? this.lowHigh,
    );
  }

  @override
  List<Object?> get props => [productList];
}
