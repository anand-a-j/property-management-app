// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Store {

@HiveField(0) String get id;@JsonKey(name: 'user_id')@HiveField(1) String get userId;@HiveField(2) String get name;@JsonKey(name: 'store_slug')@HiveField(3) String get storeSlug;@JsonKey(name: 'logo_url')@HiveField(4) String? get logoUrl;@JsonKey(name: 'logo_path')@HiveField(5) String? get logoPath;@HiveField(6) String? get description;@JsonKey(name: 'whatsapp_number')@HiveField(7) String get whatsappNumber;@JsonKey(name: 'primary_color')@HiveField(8) String get primaryColor;@JsonKey(name: 'created_at')@HiveField(9) DateTime get createdAt;@JsonKey(name: 'delivery_type')@HiveField(10) String get deliveryType;@JsonKey(name: 'delivery_charge')@HiveField(11) num get deliveryCharge;@JsonKey(name: 'free_delivery_above')@HiveField(12) num? get freeDeliveryAbove;
/// Create a copy of Store
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreCopyWith<Store> get copyWith => _$StoreCopyWithImpl<Store>(this as Store, _$identity);

  /// Serializes this Store to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Store&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.storeSlug, storeSlug) || other.storeSlug == storeSlug)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.logoPath, logoPath) || other.logoPath == logoPath)&&(identical(other.description, description) || other.description == description)&&(identical(other.whatsappNumber, whatsappNumber) || other.whatsappNumber == whatsappNumber)&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.deliveryCharge, deliveryCharge) || other.deliveryCharge == deliveryCharge)&&(identical(other.freeDeliveryAbove, freeDeliveryAbove) || other.freeDeliveryAbove == freeDeliveryAbove));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,storeSlug,logoUrl,logoPath,description,whatsappNumber,primaryColor,createdAt,deliveryType,deliveryCharge,freeDeliveryAbove);

@override
String toString() {
  return 'Store(id: $id, userId: $userId, name: $name, storeSlug: $storeSlug, logoUrl: $logoUrl, logoPath: $logoPath, description: $description, whatsappNumber: $whatsappNumber, primaryColor: $primaryColor, createdAt: $createdAt, deliveryType: $deliveryType, deliveryCharge: $deliveryCharge, freeDeliveryAbove: $freeDeliveryAbove)';
}


}

/// @nodoc
abstract mixin class $StoreCopyWith<$Res>  {
  factory $StoreCopyWith(Store value, $Res Function(Store) _then) = _$StoreCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String id,@JsonKey(name: 'user_id')@HiveField(1) String userId,@HiveField(2) String name,@JsonKey(name: 'store_slug')@HiveField(3) String storeSlug,@JsonKey(name: 'logo_url')@HiveField(4) String? logoUrl,@JsonKey(name: 'logo_path')@HiveField(5) String? logoPath,@HiveField(6) String? description,@JsonKey(name: 'whatsapp_number')@HiveField(7) String whatsappNumber,@JsonKey(name: 'primary_color')@HiveField(8) String primaryColor,@JsonKey(name: 'created_at')@HiveField(9) DateTime createdAt,@JsonKey(name: 'delivery_type')@HiveField(10) String deliveryType,@JsonKey(name: 'delivery_charge')@HiveField(11) num deliveryCharge,@JsonKey(name: 'free_delivery_above')@HiveField(12) num? freeDeliveryAbove
});




}
/// @nodoc
class _$StoreCopyWithImpl<$Res>
    implements $StoreCopyWith<$Res> {
  _$StoreCopyWithImpl(this._self, this._then);

  final Store _self;
  final $Res Function(Store) _then;

/// Create a copy of Store
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? storeSlug = null,Object? logoUrl = freezed,Object? logoPath = freezed,Object? description = freezed,Object? whatsappNumber = null,Object? primaryColor = null,Object? createdAt = null,Object? deliveryType = null,Object? deliveryCharge = null,Object? freeDeliveryAbove = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,storeSlug: null == storeSlug ? _self.storeSlug : storeSlug // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,logoPath: freezed == logoPath ? _self.logoPath : logoPath // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,whatsappNumber: null == whatsappNumber ? _self.whatsappNumber : whatsappNumber // ignore: cast_nullable_to_non_nullable
as String,primaryColor: null == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,deliveryType: null == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as String,deliveryCharge: null == deliveryCharge ? _self.deliveryCharge : deliveryCharge // ignore: cast_nullable_to_non_nullable
as num,freeDeliveryAbove: freezed == freeDeliveryAbove ? _self.freeDeliveryAbove : freeDeliveryAbove // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}

}


/// Adds pattern-matching-related methods to [Store].
extension StorePatterns on Store {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Store value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Store() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Store value)  $default,){
final _that = this;
switch (_that) {
case _Store():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Store value)?  $default,){
final _that = this;
switch (_that) {
case _Store() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @JsonKey(name: 'user_id')@HiveField(1)  String userId, @HiveField(2)  String name, @JsonKey(name: 'store_slug')@HiveField(3)  String storeSlug, @JsonKey(name: 'logo_url')@HiveField(4)  String? logoUrl, @JsonKey(name: 'logo_path')@HiveField(5)  String? logoPath, @HiveField(6)  String? description, @JsonKey(name: 'whatsapp_number')@HiveField(7)  String whatsappNumber, @JsonKey(name: 'primary_color')@HiveField(8)  String primaryColor, @JsonKey(name: 'created_at')@HiveField(9)  DateTime createdAt, @JsonKey(name: 'delivery_type')@HiveField(10)  String deliveryType, @JsonKey(name: 'delivery_charge')@HiveField(11)  num deliveryCharge, @JsonKey(name: 'free_delivery_above')@HiveField(12)  num? freeDeliveryAbove)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Store() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.storeSlug,_that.logoUrl,_that.logoPath,_that.description,_that.whatsappNumber,_that.primaryColor,_that.createdAt,_that.deliveryType,_that.deliveryCharge,_that.freeDeliveryAbove);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @JsonKey(name: 'user_id')@HiveField(1)  String userId, @HiveField(2)  String name, @JsonKey(name: 'store_slug')@HiveField(3)  String storeSlug, @JsonKey(name: 'logo_url')@HiveField(4)  String? logoUrl, @JsonKey(name: 'logo_path')@HiveField(5)  String? logoPath, @HiveField(6)  String? description, @JsonKey(name: 'whatsapp_number')@HiveField(7)  String whatsappNumber, @JsonKey(name: 'primary_color')@HiveField(8)  String primaryColor, @JsonKey(name: 'created_at')@HiveField(9)  DateTime createdAt, @JsonKey(name: 'delivery_type')@HiveField(10)  String deliveryType, @JsonKey(name: 'delivery_charge')@HiveField(11)  num deliveryCharge, @JsonKey(name: 'free_delivery_above')@HiveField(12)  num? freeDeliveryAbove)  $default,) {final _that = this;
switch (_that) {
case _Store():
return $default(_that.id,_that.userId,_that.name,_that.storeSlug,_that.logoUrl,_that.logoPath,_that.description,_that.whatsappNumber,_that.primaryColor,_that.createdAt,_that.deliveryType,_that.deliveryCharge,_that.freeDeliveryAbove);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String id, @JsonKey(name: 'user_id')@HiveField(1)  String userId, @HiveField(2)  String name, @JsonKey(name: 'store_slug')@HiveField(3)  String storeSlug, @JsonKey(name: 'logo_url')@HiveField(4)  String? logoUrl, @JsonKey(name: 'logo_path')@HiveField(5)  String? logoPath, @HiveField(6)  String? description, @JsonKey(name: 'whatsapp_number')@HiveField(7)  String whatsappNumber, @JsonKey(name: 'primary_color')@HiveField(8)  String primaryColor, @JsonKey(name: 'created_at')@HiveField(9)  DateTime createdAt, @JsonKey(name: 'delivery_type')@HiveField(10)  String deliveryType, @JsonKey(name: 'delivery_charge')@HiveField(11)  num deliveryCharge, @JsonKey(name: 'free_delivery_above')@HiveField(12)  num? freeDeliveryAbove)?  $default,) {final _that = this;
switch (_that) {
case _Store() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.storeSlug,_that.logoUrl,_that.logoPath,_that.description,_that.whatsappNumber,_that.primaryColor,_that.createdAt,_that.deliveryType,_that.deliveryCharge,_that.freeDeliveryAbove);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Store implements Store {
  const _Store({@HiveField(0) required this.id, @JsonKey(name: 'user_id')@HiveField(1) required this.userId, @HiveField(2) required this.name, @JsonKey(name: 'store_slug')@HiveField(3) required this.storeSlug, @JsonKey(name: 'logo_url')@HiveField(4) this.logoUrl, @JsonKey(name: 'logo_path')@HiveField(5) this.logoPath, @HiveField(6) this.description, @JsonKey(name: 'whatsapp_number')@HiveField(7) required this.whatsappNumber, @JsonKey(name: 'primary_color')@HiveField(8) this.primaryColor = "f2f3dd", @JsonKey(name: 'created_at')@HiveField(9) required this.createdAt, @JsonKey(name: 'delivery_type')@HiveField(10) this.deliveryType = 'fixed', @JsonKey(name: 'delivery_charge')@HiveField(11) this.deliveryCharge = 0, @JsonKey(name: 'free_delivery_above')@HiveField(12) this.freeDeliveryAbove});
  factory _Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

@override@HiveField(0) final  String id;
@override@JsonKey(name: 'user_id')@HiveField(1) final  String userId;
@override@HiveField(2) final  String name;
@override@JsonKey(name: 'store_slug')@HiveField(3) final  String storeSlug;
@override@JsonKey(name: 'logo_url')@HiveField(4) final  String? logoUrl;
@override@JsonKey(name: 'logo_path')@HiveField(5) final  String? logoPath;
@override@HiveField(6) final  String? description;
@override@JsonKey(name: 'whatsapp_number')@HiveField(7) final  String whatsappNumber;
@override@JsonKey(name: 'primary_color')@HiveField(8) final  String primaryColor;
@override@JsonKey(name: 'created_at')@HiveField(9) final  DateTime createdAt;
@override@JsonKey(name: 'delivery_type')@HiveField(10) final  String deliveryType;
@override@JsonKey(name: 'delivery_charge')@HiveField(11) final  num deliveryCharge;
@override@JsonKey(name: 'free_delivery_above')@HiveField(12) final  num? freeDeliveryAbove;

/// Create a copy of Store
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreCopyWith<_Store> get copyWith => __$StoreCopyWithImpl<_Store>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoreToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Store&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.storeSlug, storeSlug) || other.storeSlug == storeSlug)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.logoPath, logoPath) || other.logoPath == logoPath)&&(identical(other.description, description) || other.description == description)&&(identical(other.whatsappNumber, whatsappNumber) || other.whatsappNumber == whatsappNumber)&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.deliveryCharge, deliveryCharge) || other.deliveryCharge == deliveryCharge)&&(identical(other.freeDeliveryAbove, freeDeliveryAbove) || other.freeDeliveryAbove == freeDeliveryAbove));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,storeSlug,logoUrl,logoPath,description,whatsappNumber,primaryColor,createdAt,deliveryType,deliveryCharge,freeDeliveryAbove);

@override
String toString() {
  return 'Store(id: $id, userId: $userId, name: $name, storeSlug: $storeSlug, logoUrl: $logoUrl, logoPath: $logoPath, description: $description, whatsappNumber: $whatsappNumber, primaryColor: $primaryColor, createdAt: $createdAt, deliveryType: $deliveryType, deliveryCharge: $deliveryCharge, freeDeliveryAbove: $freeDeliveryAbove)';
}


}

/// @nodoc
abstract mixin class _$StoreCopyWith<$Res> implements $StoreCopyWith<$Res> {
  factory _$StoreCopyWith(_Store value, $Res Function(_Store) _then) = __$StoreCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String id,@JsonKey(name: 'user_id')@HiveField(1) String userId,@HiveField(2) String name,@JsonKey(name: 'store_slug')@HiveField(3) String storeSlug,@JsonKey(name: 'logo_url')@HiveField(4) String? logoUrl,@JsonKey(name: 'logo_path')@HiveField(5) String? logoPath,@HiveField(6) String? description,@JsonKey(name: 'whatsapp_number')@HiveField(7) String whatsappNumber,@JsonKey(name: 'primary_color')@HiveField(8) String primaryColor,@JsonKey(name: 'created_at')@HiveField(9) DateTime createdAt,@JsonKey(name: 'delivery_type')@HiveField(10) String deliveryType,@JsonKey(name: 'delivery_charge')@HiveField(11) num deliveryCharge,@JsonKey(name: 'free_delivery_above')@HiveField(12) num? freeDeliveryAbove
});




}
/// @nodoc
class __$StoreCopyWithImpl<$Res>
    implements _$StoreCopyWith<$Res> {
  __$StoreCopyWithImpl(this._self, this._then);

  final _Store _self;
  final $Res Function(_Store) _then;

/// Create a copy of Store
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? storeSlug = null,Object? logoUrl = freezed,Object? logoPath = freezed,Object? description = freezed,Object? whatsappNumber = null,Object? primaryColor = null,Object? createdAt = null,Object? deliveryType = null,Object? deliveryCharge = null,Object? freeDeliveryAbove = freezed,}) {
  return _then(_Store(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,storeSlug: null == storeSlug ? _self.storeSlug : storeSlug // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,logoPath: freezed == logoPath ? _self.logoPath : logoPath // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,whatsappNumber: null == whatsappNumber ? _self.whatsappNumber : whatsappNumber // ignore: cast_nullable_to_non_nullable
as String,primaryColor: null == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,deliveryType: null == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as String,deliveryCharge: null == deliveryCharge ? _self.deliveryCharge : deliveryCharge // ignore: cast_nullable_to_non_nullable
as num,freeDeliveryAbove: freezed == freeDeliveryAbove ? _self.freeDeliveryAbove : freeDeliveryAbove // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}


}

// dart format on
