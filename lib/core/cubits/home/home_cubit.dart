import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:product_show_case/core/dao/product_dao.dart';
import 'package:product_show_case/core/model/product/product.dart';
import 'package:product_show_case/core/model/product/products.dart';
import 'package:product_show_case/core/repository/product_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  ProductRepository productRepository = ProductRepository();
  HomeCubit() : super(HomeInitial());

  void getProductList() async {
    try {
      emit(HomeLoadingState());
      Products? products = await productRepository.getProductList();
      List<Product>? productList = products?.products?.toList();
      emit(HomeLoadedState(productList: productList ?? []));
    } catch (e) {
      emit(HomeLoadedState(productList: const []));
    }
  }

  void getFilterProducts({
    bool newProduct = false,
    bool oldProduct = false,
    bool bestSale = false,
    bool highLow = false,
    bool lowHigh = false,
  }) async {
    try {
      final currentState = state;
      ProductDAO productDAO = ProductDAO();
      emit(HomeLoadingState());
      if (currentState is HomeLoadedState) {
        List<Product> products = productDAO.filter(
          products: currentState.productList,
          newProduct: newProduct,
          oldProduct: oldProduct,
          bestSale: bestSale,
          lowHigh: lowHigh,
          highLow: highLow,
        );
        currentState.copyWith(
          productList: products,
          newProduct: newProduct,
          oldProduct: oldProduct,
          bestSale: bestSale,
          lowHigh: lowHigh,
          highLow: highLow,
        );
      } else {}
      Products? products = await productRepository.getProductList();
      List<Product>? productList = products?.products?.toList();
      productList = productDAO.filter(
        products: productList ?? [],
        newProduct: newProduct,
        oldProduct: oldProduct,
        bestSale: bestSale,
        lowHigh: lowHigh,
        highLow: highLow,
      );
      emit(HomeLoadedState(
        productList: productList ?? [],
        newProduct: newProduct,
        oldProduct: oldProduct,
        bestSale: bestSale,
        lowHigh: lowHigh,
        highLow: highLow,
      ));
    } catch (e) {
      emit(HomeLoadedState(
        productList: const [],
        newProduct: newProduct,
        oldProduct: oldProduct,
        bestSale: bestSale,
        lowHigh: lowHigh,
        highLow: highLow,
      ));
    }
  }

  void getSortedProduct({
    bool highLow = false,
    bool lowHigh = false,
  }) async {
    try {
      final currentState = state;
      ProductDAO productDAO = ProductDAO();
      emit(HomeLoadingState());
      if (currentState is HomeLoadedState) {
        List<Product> products = productDAO.filter(
          products: currentState.productList,
          lowHigh: lowHigh,
          highLow: highLow,
        );
        currentState.copyWith(productList: products, lowHigh: lowHigh, highLow: highLow);
      } else {}
      Products? products = await productRepository.getProductList();
      List<Product>? productList = products?.products?.toList();
      productList = productDAO.filter(
        products: productList ?? [],
        lowHigh: lowHigh,
        highLow: highLow,
      );
      emit(HomeLoadedState(productList: productList ?? [], lowHigh: lowHigh, highLow: highLow));
    } catch (e) {
      emit(HomeLoadedState(productList: const [], lowHigh: lowHigh, highLow: highLow));
    }
  }
}
