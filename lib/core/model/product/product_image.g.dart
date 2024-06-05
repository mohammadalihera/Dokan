// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_image.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductImage> _$productImageSerializer =
    new _$ProductImageSerializer();

class _$ProductImageSerializer implements StructuredSerializer<ProductImage> {
  @override
  final Iterable<Type> types = const [ProductImage, _$ProductImage];
  @override
  final String wireName = 'ProductImage';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProductImage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'src',
      serializers.serialize(object.src, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ProductImage deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductImageBuilder();

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
        case 'src':
          result.src = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ProductImage extends ProductImage {
  @override
  final int id;
  @override
  final String src;

  factory _$ProductImage([void Function(ProductImageBuilder)? updates]) =>
      (new ProductImageBuilder()..update(updates))._build();

  _$ProductImage._({required this.id, required this.src}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'ProductImage', 'id');
    BuiltValueNullFieldError.checkNotNull(src, r'ProductImage', 'src');
  }

  @override
  ProductImage rebuild(void Function(ProductImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductImageBuilder toBuilder() => new ProductImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductImage && id == other.id && src == other.src;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, src.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductImage')
          ..add('id', id)
          ..add('src', src))
        .toString();
  }
}

class ProductImageBuilder
    implements Builder<ProductImage, ProductImageBuilder> {
  _$ProductImage? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _src;
  String? get src => _$this._src;
  set src(String? src) => _$this._src = src;

  ProductImageBuilder();

  ProductImageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _src = $v.src;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductImage;
  }

  @override
  void update(void Function(ProductImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductImage build() => _build();

  _$ProductImage _build() {
    final _$result = _$v ??
        new _$ProductImage._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ProductImage', 'id'),
            src: BuiltValueNullFieldError.checkNotNull(
                src, r'ProductImage', 'src'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
