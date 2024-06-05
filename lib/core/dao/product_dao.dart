import 'package:flutter/services.dart';
import 'package:product_show_case/core/model/product/product.dart';
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

  List<Product> filter({
    bool newProduct = false,
    bool oldProduct = false,
    bool bestSale = false,
    bool highLow = false,
    bool lowHigh = false,
    required List<Product> products,
  }) {
    if (bestSale) {
      products.sort((a, b) => a.total_sales!.compareTo(b.total_sales!));
    }
    if (highLow) {
      products.sort((a, b) => double.parse(b.price).compareTo(double.parse(a.price)));
    }
    if (lowHigh) {
      products.sort((a, b) => double.parse(a.price).compareTo(double.parse(b.price)));
    }

    if (newProduct) {
      products = products.where((product) => product.is_new != null && product.is_new == true).toList();
    }
    if (oldProduct) {
      products = products.where((product) => product.is_new == null).toList();
    }

    return products;
  }
}
