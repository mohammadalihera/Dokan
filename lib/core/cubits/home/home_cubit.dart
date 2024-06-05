import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
      emit(HomeLoadedState(productList: []));
    }
  }
}
