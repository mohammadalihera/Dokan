// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Products> _$productsSerializer = new _$ProductsSerializer();

class _$ProductsSerializer implements StructuredSerializer<Products> {
  @override
  final Iterable<Type> types = const [Products, _$Products];
  @override
  final String wireName = 'Products';

  @override
  Iterable<Object?> serialize(Serializers serializers, Products object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.products;
    if (value != null) {
      result
        ..add('products')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Product)])));
    }
    return result;
  }

  @override
  Products deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'products':
          result.products.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Product)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$Products extends Products {
  @override
  final BuiltList<Product>? products;

  factory _$Products([void Function(ProductsBuilder)? updates]) =>
      (new ProductsBuilder()..update(updates))._build();

  _$Products._({this.products}) : super._();

  @override
  Products rebuild(void Function(ProductsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductsBuilder toBuilder() => new ProductsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Products && products == other.products;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, products.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Products')..add('products', products))
        .toString();
  }
}

class ProductsBuilder implements Builder<Products, ProductsBuilder> {
  _$Products? _$v;

  ListBuilder<Product>? _products;
  ListBuilder<Product> get products =>
      _$this._products ??= new ListBuilder<Product>();
  set products(ListBuilder<Product>? products) => _$this._products = products;

  ProductsBuilder();

  ProductsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _products = $v.products?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Products other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Products;
  }

  @override
  void update(void Function(ProductsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Products build() => _build();

  _$Products _build() {
    _$Products _$result;
    try {
      _$result = _$v ?? new _$Products._(products: _products?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'products';
        _products?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Products', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
