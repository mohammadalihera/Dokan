import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:product_show_case/core/model/product/product_image.dart';
import 'package:product_show_case/core/model/serializers.dart';

part 'product.g.dart';

abstract class Product implements Built<Product, ProductBuilder> {
  int get id;
  String get name;
  String get type;
  String get price;
  String get regular_price;
  String? get sale_price;
  int? get total_sales;
  bool get in_stock;
  bool? get is_new;
  String? get average_rating;
  int get rating_count;
  BuiltList<ProductImage>? get images;

  Product._();
  factory Product([void Function(ProductBuilder)? updates]) = _$Product;

  static Serializer<Product> get serializer => _$productSerializer;

  static Product fromJson(String jsonStr) {
    return serializers.deserializeWith<Product>(Product.serializer, json.decode(jsonStr))!;
  }

  static Product fromJsonMap(Map<String, dynamic> jsonMap) {
    return serializers.deserializeWith<Product>(Product.serializer, jsonMap)!;
  }

  String toJson() {
    return json.encode(serializers.serializeWith(Product.serializer, this));
  }

  Map<String, dynamic> toJsonMap() {
    return serializers.serializeWith(Product.serializer, this) as Map<String, dynamic>;
  }
}
