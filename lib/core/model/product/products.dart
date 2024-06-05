import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:product_show_case/core/model/product/product.dart';
import 'package:product_show_case/core/model/serializers.dart';

part 'products.g.dart';

abstract class Products implements Built<Products, ProductsBuilder> {
  BuiltList<Product>? get products;

  Products._();
  factory Products([void Function(ProductsBuilder)? updates]) = _$Products;

  static Serializer<Products> get serializer => _$productsSerializer;

  static Products fromJson(String jsonStr) {
    return serializers.deserializeWith<Products>(Products.serializer, json.decode(jsonStr))!;
  }

  static Products fromJsonMap(Map<String, dynamic> jsonMap) {
    return serializers.deserializeWith<Products>(Products.serializer, jsonMap)!;
  }

  String toJson() {
    return json.encode(serializers.serializeWith(Products.serializer, this));
  }

  Map<String, dynamic> toJsonMap() {
    return serializers.serializeWith(Products.serializer, this) as Map<String, dynamic>;
  }
}
