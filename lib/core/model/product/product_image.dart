import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:product_show_case/core/model/serializers.dart';

part 'product_image.g.dart';

abstract class ProductImage implements Built<ProductImage, ProductImageBuilder> {
  int get id;
  String get src;

  ProductImage._();
  factory ProductImage([void Function(ProductImageBuilder)? updates]) = _$ProductImage;

  static Serializer<ProductImage> get serializer => _$productImageSerializer;

  static ProductImage fromJson(String jsonStr) {
    return serializers.deserializeWith<ProductImage>(ProductImage.serializer, json.decode(jsonStr))!;
  }

  static ProductImage fromJsonMap(Map<String, dynamic> jsonMap) {
    return serializers.deserializeWith<ProductImage>(ProductImage.serializer, jsonMap)!;
  }

  String toJson() {
    return json.encode(serializers.serializeWith(ProductImage.serializer, this));
  }

  Map<String, dynamic> toJsonMap() {
    return serializers.serializeWith(ProductImage.serializer, this) as Map<String, dynamic>;
  }
}
