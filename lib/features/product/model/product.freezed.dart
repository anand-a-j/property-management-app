// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Product {

@HiveField(0) String? get id;@HiveField(1)@JsonKey(name: 'store_id') String? get storeId;@HiveField(2) String? get name;@HiveField(3) String? get description;@HiveField(4) double? get price;@HiveField(5)@JsonKey(name: 'sale_price') double? get salePrice;@HiveField(6)@JsonKey(name: 'image_url') String? get imageUrl;@HiveField(7)@JsonKey(name: 'image_path') String? get imagePath;@HiveField(8)@JsonKey(name: 'sort_order') int get sortOrder;@HiveField(9)@JsonKey(name: 'created_at') DateTime? get createdAt;@HiveField(10) DateTime? get updatedAt;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.id, id) || other.id == id)&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.salePrice, salePrice) || other.salePrice == salePrice)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,storeId,name,description,price,salePrice,imageUrl,imagePath,sortOrder,createdAt,updatedAt);

@override
String toString() {
  return 'Product(id: $id, storeId: $storeId, name: $name, description: $description, price: $price, salePrice: $salePrice, imageUrl: $imageUrl, imagePath: $imagePath, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String? id,@HiveField(1)@JsonKey(name: 'store_id') String? storeId,@HiveField(2) String? name,@HiveField(3) String? description,@HiveField(4) double? price,@HiveField(5)@JsonKey(name: 'sale_price') double? salePrice,@HiveField(6)@JsonKey(name: 'image_url') String? imageUrl,@HiveField(7)@JsonKey(name: 'image_path') String? imagePath,@HiveField(8)@JsonKey(name: 'sort_order') int sortOrder,@HiveField(9)@JsonKey(name: 'created_at') DateTime? createdAt,@HiveField(10) DateTime? updatedAt
});




}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? storeId = freezed,Object? name = freezed,Object? description = freezed,Object? price = freezed,Object? salePrice = freezed,Object? imageUrl = freezed,Object? imagePath = freezed,Object? sortOrder = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,storeId: freezed == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,salePrice: freezed == salePrice ? _self.salePrice : salePrice // ignore: cast_nullable_to_non_nullable
as double?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Product value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value)  $default,){
final _that = this;
switch (_that) {
case _Product():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)?  $default,){
final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String? id, @HiveField(1)@JsonKey(name: 'store_id')  String? storeId, @HiveField(2)  String? name, @HiveField(3)  String? description, @HiveField(4)  double? price, @HiveField(5)@JsonKey(name: 'sale_price')  double? salePrice, @HiveField(6)@JsonKey(name: 'image_url')  String? imageUrl, @HiveField(7)@JsonKey(name: 'image_path')  String? imagePath, @HiveField(8)@JsonKey(name: 'sort_order')  int sortOrder, @HiveField(9)@JsonKey(name: 'created_at')  DateTime? createdAt, @HiveField(10)  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.storeId,_that.name,_that.description,_that.price,_that.salePrice,_that.imageUrl,_that.imagePath,_that.sortOrder,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String? id, @HiveField(1)@JsonKey(name: 'store_id')  String? storeId, @HiveField(2)  String? name, @HiveField(3)  String? description, @HiveField(4)  double? price, @HiveField(5)@JsonKey(name: 'sale_price')  double? salePrice, @HiveField(6)@JsonKey(name: 'image_url')  String? imageUrl, @HiveField(7)@JsonKey(name: 'image_path')  String? imagePath, @HiveField(8)@JsonKey(name: 'sort_order')  int sortOrder, @HiveField(9)@JsonKey(name: 'created_at')  DateTime? createdAt, @HiveField(10)  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.id,_that.storeId,_that.name,_that.description,_that.price,_that.salePrice,_that.imageUrl,_that.imagePath,_that.sortOrder,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String? id, @HiveField(1)@JsonKey(name: 'store_id')  String? storeId, @HiveField(2)  String? name, @HiveField(3)  String? description, @HiveField(4)  double? price, @HiveField(5)@JsonKey(name: 'sale_price')  double? salePrice, @HiveField(6)@JsonKey(name: 'image_url')  String? imageUrl, @HiveField(7)@JsonKey(name: 'image_path')  String? imagePath, @HiveField(8)@JsonKey(name: 'sort_order')  int sortOrder, @HiveField(9)@JsonKey(name: 'created_at')  DateTime? createdAt, @HiveField(10)  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.storeId,_that.name,_that.description,_that.price,_that.salePrice,_that.imageUrl,_that.imagePath,_that.sortOrder,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Product extends Product {
  const _Product({@HiveField(0) this.id, @HiveField(1)@JsonKey(name: 'store_id') this.storeId, @HiveField(2) this.name, @HiveField(3) this.description, @HiveField(4) this.price, @HiveField(5)@JsonKey(name: 'sale_price') this.salePrice, @HiveField(6)@JsonKey(name: 'image_url') this.imageUrl, @HiveField(7)@JsonKey(name: 'image_path') this.imagePath, @HiveField(8)@JsonKey(name: 'sort_order') this.sortOrder = 0, @HiveField(9)@JsonKey(name: 'created_at') this.createdAt, @HiveField(10) this.updatedAt}): super._();
  factory _Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

@override@HiveField(0) final  String? id;
@override@HiveField(1)@JsonKey(name: 'store_id') final  String? storeId;
@override@HiveField(2) final  String? name;
@override@HiveField(3) final  String? description;
@override@HiveField(4) final  double? price;
@override@HiveField(5)@JsonKey(name: 'sale_price') final  double? salePrice;
@override@HiveField(6)@JsonKey(name: 'image_url') final  String? imageUrl;
@override@HiveField(7)@JsonKey(name: 'image_path') final  String? imagePath;
@override@HiveField(8)@JsonKey(name: 'sort_order') final  int sortOrder;
@override@HiveField(9)@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@HiveField(10) final  DateTime? updatedAt;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.id, id) || other.id == id)&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.salePrice, salePrice) || other.salePrice == salePrice)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,storeId,name,description,price,salePrice,imageUrl,imagePath,sortOrder,createdAt,updatedAt);

@override
String toString() {
  return 'Product(id: $id, storeId: $storeId, name: $name, description: $description, price: $price, salePrice: $salePrice, imageUrl: $imageUrl, imagePath: $imagePath, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String? id,@HiveField(1)@JsonKey(name: 'store_id') String? storeId,@HiveField(2) String? name,@HiveField(3) String? description,@HiveField(4) double? price,@HiveField(5)@JsonKey(name: 'sale_price') double? salePrice,@HiveField(6)@JsonKey(name: 'image_url') String? imageUrl,@HiveField(7)@JsonKey(name: 'image_path') String? imagePath,@HiveField(8)@JsonKey(name: 'sort_order') int sortOrder,@HiveField(9)@JsonKey(name: 'created_at') DateTime? createdAt,@HiveField(10) DateTime? updatedAt
});




}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? storeId = freezed,Object? name = freezed,Object? description = freezed,Object? price = freezed,Object? salePrice = freezed,Object? imageUrl = freezed,Object? imagePath = freezed,Object? sortOrder = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Product(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,storeId: freezed == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,salePrice: freezed == salePrice ? _self.salePrice : salePrice // ignore: cast_nullable_to_non_nullable
as double?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
