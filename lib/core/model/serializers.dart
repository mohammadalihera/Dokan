import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:product_show_case/core/model/product/product.dart';
import 'package:product_show_case/core/model/product/product_image.dart';
import 'package:product_show_case/core/model/product/products.dart';

part 'serializers.g.dart';

@SerializersFor([
  Products,
  Product,
  ProductImage,
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

T? deserialize<T>(dynamic value) =>
    serializers.deserializeWith<T?>(serializers.serializerForType(T) as Serializer<T?>, value);

BuiltList<T> deserializeListOf<T>(dynamic value) =>
    BuiltList.from(value.map((value) => deserialize<T>(value)).toList(growable: false));
