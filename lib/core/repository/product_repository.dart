import 'package:product_show_case/core/dao/product_dao.dart';
import 'package:product_show_case/core/model/product/products.dart';

class ProductRepository {
  final ProductDAO _productDAO = ProductDAO();

  Future<Products?> getProductList() async {
    return await _productDAO.getProducts();
  }
}
