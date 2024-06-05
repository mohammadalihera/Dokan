// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Product> _$productSerializer = new _$ProductSerializer();

class _$ProductSerializer implements StructuredSerializer<Product> {
  @override
  final Iterable<Type> types = const [Product, _$Product];
  @override
  final String wireName = 'Product';

  @override
  Iterable<Object?> serialize(Serializers serializers, Product object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'price',
      serializers.serialize(object.price,
          specifiedType: const FullType(String)),
      'regular_price',
      serializers.serialize(object.regular_price,
          specifiedType: const FullType(String)),
      'in_stock',
      serializers.serialize(object.in_stock,
          specifiedType: const FullType(bool)),
      'rating_count',
      serializers.serialize(object.rating_count,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.sale_price;
    if (value != null) {
      result
        ..add('sale_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.total_sales;
    if (value != null) {
      result
        ..add('total_sales')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.average_rating;
    if (value != null) {
      result
        ..add('average_rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.images;
    if (value != null) {
      result
        ..add('images')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ProductImage)])));
    }
    return result;
  }

  @override
  Product deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'regular_price':
          result.regular_price = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'sale_price':
          result.sale_price = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'total_sales':
          result.total_sales = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'in_stock':
          result.in_stock = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'average_rating':
          result.average_rating = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rating_count':
          result.rating_count = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ProductImage)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$Product extends Product {
  @override
  final int id;
  @override
  final String name;
  @override
  final String type;
  @override
  final String price;
  @override
  final String regular_price;
  @override
  final String? sale_price;
  @override
  final int? total_sales;
  @override
  final bool in_stock;
  @override
  final String? average_rating;
  @override
  final int rating_count;
  @override
  final BuiltList<ProductImage>? images;

  factory _$Product([void Function(ProductBuilder)? updates]) =>
      (new ProductBuilder()..update(updates))._build();

  _$Product._(
      {required this.id,
      required this.name,
      required this.type,
      required this.price,
      required this.regular_price,
      this.sale_price,
      this.total_sales,
      required this.in_stock,
      this.average_rating,
      required this.rating_count,
      this.images})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Product', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'Product', 'name');
    BuiltValueNullFieldError.checkNotNull(type, r'Product', 'type');
    BuiltValueNullFieldError.checkNotNull(price, r'Product', 'price');
    BuiltValueNullFieldError.checkNotNull(
        regular_price, r'Product', 'regular_price');
    BuiltValueNullFieldError.checkNotNull(in_stock, r'Product', 'in_stock');
    BuiltValueNullFieldError.checkNotNull(
        rating_count, r'Product', 'rating_count');
  }

  @override
  Product rebuild(void Function(ProductBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductBuilder toBuilder() => new ProductBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Product &&
        id == other.id &&
        name == other.name &&
        type == other.type &&
        price == other.price &&
        regular_price == other.regular_price &&
        sale_price == other.sale_price &&
        total_sales == other.total_sales &&
        in_stock == other.in_stock &&
        average_rating == other.average_rating &&
        rating_count == other.rating_count &&
        images == other.images;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, regular_price.hashCode);
    _$hash = $jc(_$hash, sale_price.hashCode);
    _$hash = $jc(_$hash, total_sales.hashCode);
    _$hash = $jc(_$hash, in_stock.hashCode);
    _$hash = $jc(_$hash, average_rating.hashCode);
    _$hash = $jc(_$hash, rating_count.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Product')
          ..add('id', id)
          ..add('name', name)
          ..add('type', type)
          ..add('price', price)
          ..add('regular_price', regular_price)
          ..add('sale_price', sale_price)
          ..add('total_sales', total_sales)
          ..add('in_stock', in_stock)
          ..add('average_rating', average_rating)
          ..add('rating_count', rating_count)
          ..add('images', images))
        .toString();
  }
}

class ProductBuilder implements Builder<Product, ProductBuilder> {
  _$Product? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _price;
  String? get price => _$this._price;
  set price(String? price) => _$this._price = price;

  String? _regular_price;
  String? get regular_price => _$this._regular_price;
  set regular_price(String? regular_price) =>
      _$this._regular_price = regular_price;

  String? _sale_price;
  String? get sale_price => _$this._sale_price;
  set sale_price(String? sale_price) => _$this._sale_price = sale_price;

  int? _total_sales;
  int? get total_sales => _$this._total_sales;
  set total_sales(int? total_sales) => _$this._total_sales = total_sales;

  bool? _in_stock;
  bool? get in_stock => _$this._in_stock;
  set in_stock(bool? in_stock) => _$this._in_stock = in_stock;

  String? _average_rating;
  String? get average_rating => _$this._average_rating;
  set average_rating(String? average_rating) =>
      _$this._average_rating = average_rating;

  int? _rating_count;
  int? get rating_count => _$this._rating_count;
  set rating_count(int? rating_count) => _$this._rating_count = rating_count;

  ListBuilder<ProductImage>? _images;
  ListBuilder<ProductImage> get images =>
      _$this._images ??= new ListBuilder<ProductImage>();
  set images(ListBuilder<ProductImage>? images) => _$this._images = images;

  ProductBuilder();

  ProductBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _type = $v.type;
      _price = $v.price;
      _regular_price = $v.regular_price;
      _sale_price = $v.sale_price;
      _total_sales = $v.total_sales;
      _in_stock = $v.in_stock;
      _average_rating = $v.average_rating;
      _rating_count = $v.rating_count;
      _images = $v.images?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Product other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Product;
  }

  @override
  void update(void Function(ProductBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Product build() => _build();

  _$Product _build() {
    _$Product _$result;
    try {
      _$result = _$v ??
          new _$Product._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'Product', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'Product', 'name'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'Product', 'type'),
              price: BuiltValueNullFieldError.checkNotNull(
                  price, r'Product', 'price'),
              regular_price: BuiltValueNullFieldError.checkNotNull(
                  regular_price, r'Product', 'regular_price'),
              sale_price: sale_price,
              total_sales: total_sales,
              in_stock: BuiltValueNullFieldError.checkNotNull(
                  in_stock, r'Product', 'in_stock'),
              average_rating: average_rating,
              rating_count: BuiltValueNullFieldError.checkNotNull(
                  rating_count, r'Product', 'rating_count'),
              images: _images?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Product', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
