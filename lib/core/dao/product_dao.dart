import 'package:flutter/services.dart';
import 'package:product_show_case/core/model/product/products.dart';
import 'package:product_show_case/core/model/registration/registration_data.dart';

class ProductDAO {
  Future<Products?> getProducts() async {
    try {
      String productDataPath = 'assets/data/product.json';
      String jsonData = await rootBundle.loadString(productDataPath);
      Products? products = Products.fromJson(jsonData);
      return products;
    } catch (error) {
      return null;
    }
  }
}
