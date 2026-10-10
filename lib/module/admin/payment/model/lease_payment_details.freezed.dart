// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lease_payment_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeasePaymentDetails {

 String get id; UnitPaymentDetails? get unit; ResidentPaymentDetails? get resident;
/// Create a copy of LeasePaymentDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeasePaymentDetailsCopyWith<LeasePaymentDetails> get copyWith => _$LeasePaymentDetailsCopyWithImpl<LeasePaymentDetails>(this as LeasePaymentDetails, _$identity);

  /// Serializes this LeasePaymentDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeasePaymentDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.resident, resident) || other.resident == resident));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,unit,resident);

@override
String toString() {
  return 'LeasePaymentDetails(id: $id, unit: $unit, resident: $resident)';
}


}

/// @nodoc
abstract mixin class $LeasePaymentDetailsCopyWith<$Res>  {
  factory $LeasePaymentDetailsCopyWith(LeasePaymentDetails value, $Res Function(LeasePaymentDetails) _then) = _$LeasePaymentDetailsCopyWithImpl;
@useResult
$Res call({
 String id, UnitPaymentDetails? unit, ResidentPaymentDetails? resident
});


$UnitPaymentDetailsCopyWith<$Res>? get unit;$ResidentPaymentDetailsCopyWith<$Res>? get resident;

}
/// @nodoc
class _$LeasePaymentDetailsCopyWithImpl<$Res>
    implements $LeasePaymentDetailsCopyWith<$Res> {
  _$LeasePaymentDetailsCopyWithImpl(this._self, this._then);

  final LeasePaymentDetails _self;
  final $Res Function(LeasePaymentDetails) _then;

/// Create a copy of LeasePaymentDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? unit = freezed,Object? resident = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitPaymentDetails?,resident: freezed == resident ? _self.resident : resident // ignore: cast_nullable_to_non_nullable
as ResidentPaymentDetails?,
  ));
}
/// Create a copy of LeasePaymentDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitPaymentDetailsCopyWith<$Res>? get unit {
    if (_self.unit == null) {
    return null;
  }

  return $UnitPaymentDetailsCopyWith<$Res>(_self.unit!, (value) {
    return _then(_self.copyWith(unit: value));
  });
}/// Create a copy of LeasePaymentDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResidentPaymentDetailsCopyWith<$Res>? get resident {
    if (_self.resident == null) {
    return null;
  }

  return $ResidentPaymentDetailsCopyWith<$Res>(_self.resident!, (value) {
    return _then(_self.copyWith(resident: value));
  });
}
}


/// Adds pattern-matching-related methods to [LeasePaymentDetails].
extension LeasePaymentDetailsPatterns on LeasePaymentDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeasePaymentDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeasePaymentDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeasePaymentDetails value)  $default,){
final _that = this;
switch (_that) {
case _LeasePaymentDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeasePaymentDetails value)?  $default,){
final _that = this;
switch (_that) {
case _LeasePaymentDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  UnitPaymentDetails? unit,  ResidentPaymentDetails? resident)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeasePaymentDetails() when $default != null:
return $default(_that.id,_that.unit,_that.resident);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  UnitPaymentDetails? unit,  ResidentPaymentDetails? resident)  $default,) {final _that = this;
switch (_that) {
case _LeasePaymentDetails():
return $default(_that.id,_that.unit,_that.resident);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  UnitPaymentDetails? unit,  ResidentPaymentDetails? resident)?  $default,) {final _that = this;
switch (_that) {
case _LeasePaymentDetails() when $default != null:
return $default(_that.id,_that.unit,_that.resident);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeasePaymentDetails implements LeasePaymentDetails {
  const _LeasePaymentDetails({required this.id, this.unit, this.resident});
  factory _LeasePaymentDetails.fromJson(Map<String, dynamic> json) => _$LeasePaymentDetailsFromJson(json);

@override final  String id;
@override final  UnitPaymentDetails? unit;
@override final  ResidentPaymentDetails? resident;

/// Create a copy of LeasePaymentDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeasePaymentDetailsCopyWith<_LeasePaymentDetails> get copyWith => __$LeasePaymentDetailsCopyWithImpl<_LeasePaymentDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeasePaymentDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeasePaymentDetails&&(identical(other.id, id) || other.id == id)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.resident, resident) || other.resident == resident));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,unit,resident);

@override
String toString() {
  return 'LeasePaymentDetails(id: $id, unit: $unit, resident: $resident)';
}


}

/// @nodoc
abstract mixin class _$LeasePaymentDetailsCopyWith<$Res> implements $LeasePaymentDetailsCopyWith<$Res> {
  factory _$LeasePaymentDetailsCopyWith(_LeasePaymentDetails value, $Res Function(_LeasePaymentDetails) _then) = __$LeasePaymentDetailsCopyWithImpl;
@override @useResult
$Res call({
 String id, UnitPaymentDetails? unit, ResidentPaymentDetails? resident
});


@override $UnitPaymentDetailsCopyWith<$Res>? get unit;@override $ResidentPaymentDetailsCopyWith<$Res>? get resident;

}
/// @nodoc
class __$LeasePaymentDetailsCopyWithImpl<$Res>
    implements _$LeasePaymentDetailsCopyWith<$Res> {
  __$LeasePaymentDetailsCopyWithImpl(this._self, this._then);

  final _LeasePaymentDetails _self;
  final $Res Function(_LeasePaymentDetails) _then;

/// Create a copy of LeasePaymentDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? unit = freezed,Object? resident = freezed,}) {
  return _then(_LeasePaymentDetails(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitPaymentDetails?,resident: freezed == resident ? _self.resident : resident // ignore: cast_nullable_to_non_nullable
as ResidentPaymentDetails?,
  ));
}

/// Create a copy of LeasePaymentDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitPaymentDetailsCopyWith<$Res>? get unit {
    if (_self.unit == null) {
    return null;
  }

  return $UnitPaymentDetailsCopyWith<$Res>(_self.unit!, (value) {
    return _then(_self.copyWith(unit: value));
  });
}/// Create a copy of LeasePaymentDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResidentPaymentDetailsCopyWith<$Res>? get resident {
    if (_self.resident == null) {
    return null;
  }

  return $ResidentPaymentDetailsCopyWith<$Res>(_self.resident!, (value) {
    return _then(_self.copyWith(resident: value));
  });
}
}


/// @nodoc
mixin _$UnitPaymentDetails {

 String get name;
/// Create a copy of UnitPaymentDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnitPaymentDetailsCopyWith<UnitPaymentDetails> get copyWith => _$UnitPaymentDetailsCopyWithImpl<UnitPaymentDetails>(this as UnitPaymentDetails, _$identity);

  /// Serializes this UnitPaymentDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitPaymentDetails&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'UnitPaymentDetails(name: $name)';
}


}

/// @nodoc
abstract mixin class $UnitPaymentDetailsCopyWith<$Res>  {
  factory $UnitPaymentDetailsCopyWith(UnitPaymentDetails value, $Res Function(UnitPaymentDetails) _then) = _$UnitPaymentDetailsCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$UnitPaymentDetailsCopyWithImpl<$Res>
    implements $UnitPaymentDetailsCopyWith<$Res> {
  _$UnitPaymentDetailsCopyWithImpl(this._self, this._then);

  final UnitPaymentDetails _self;
  final $Res Function(UnitPaymentDetails) _then;

/// Create a copy of UnitPaymentDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UnitPaymentDetails].
extension UnitPaymentDetailsPatterns on UnitPaymentDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnitPaymentDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnitPaymentDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnitPaymentDetails value)  $default,){
final _that = this;
switch (_that) {
case _UnitPaymentDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnitPaymentDetails value)?  $default,){
final _that = this;
switch (_that) {
case _UnitPaymentDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnitPaymentDetails() when $default != null:
return $default(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case _UnitPaymentDetails():
return $default(_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case _UnitPaymentDetails() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UnitPaymentDetails implements UnitPaymentDetails {
  const _UnitPaymentDetails({required this.name});
  factory _UnitPaymentDetails.fromJson(Map<String, dynamic> json) => _$UnitPaymentDetailsFromJson(json);

@override final  String name;

/// Create a copy of UnitPaymentDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnitPaymentDetailsCopyWith<_UnitPaymentDetails> get copyWith => __$UnitPaymentDetailsCopyWithImpl<_UnitPaymentDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UnitPaymentDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnitPaymentDetails&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'UnitPaymentDetails(name: $name)';
}


}

/// @nodoc
abstract mixin class _$UnitPaymentDetailsCopyWith<$Res> implements $UnitPaymentDetailsCopyWith<$Res> {
  factory _$UnitPaymentDetailsCopyWith(_UnitPaymentDetails value, $Res Function(_UnitPaymentDetails) _then) = __$UnitPaymentDetailsCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$UnitPaymentDetailsCopyWithImpl<$Res>
    implements _$UnitPaymentDetailsCopyWith<$Res> {
  __$UnitPaymentDetailsCopyWithImpl(this._self, this._then);

  final _UnitPaymentDetails _self;
  final $Res Function(_UnitPaymentDetails) _then;

/// Create a copy of UnitPaymentDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_UnitPaymentDetails(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ResidentPaymentDetails {

 String get name;
/// Create a copy of ResidentPaymentDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResidentPaymentDetailsCopyWith<ResidentPaymentDetails> get copyWith => _$ResidentPaymentDetailsCopyWithImpl<ResidentPaymentDetails>(this as ResidentPaymentDetails, _$identity);

  /// Serializes this ResidentPaymentDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResidentPaymentDetails&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'ResidentPaymentDetails(name: $name)';
}


}

/// @nodoc
abstract mixin class $ResidentPaymentDetailsCopyWith<$Res>  {
  factory $ResidentPaymentDetailsCopyWith(ResidentPaymentDetails value, $Res Function(ResidentPaymentDetails) _then) = _$ResidentPaymentDetailsCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$ResidentPaymentDetailsCopyWithImpl<$Res>
    implements $ResidentPaymentDetailsCopyWith<$Res> {
  _$ResidentPaymentDetailsCopyWithImpl(this._self, this._then);

  final ResidentPaymentDetails _self;
  final $Res Function(ResidentPaymentDetails) _then;

/// Create a copy of ResidentPaymentDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ResidentPaymentDetails].
extension ResidentPaymentDetailsPatterns on ResidentPaymentDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResidentPaymentDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResidentPaymentDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResidentPaymentDetails value)  $default,){
final _that = this;
switch (_that) {
case _ResidentPaymentDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResidentPaymentDetails value)?  $default,){
final _that = this;
switch (_that) {
case _ResidentPaymentDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResidentPaymentDetails() when $default != null:
return $default(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case _ResidentPaymentDetails():
return $default(_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case _ResidentPaymentDetails() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResidentPaymentDetails implements ResidentPaymentDetails {
  const _ResidentPaymentDetails({required this.name});
  factory _ResidentPaymentDetails.fromJson(Map<String, dynamic> json) => _$ResidentPaymentDetailsFromJson(json);

@override final  String name;

/// Create a copy of ResidentPaymentDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResidentPaymentDetailsCopyWith<_ResidentPaymentDetails> get copyWith => __$ResidentPaymentDetailsCopyWithImpl<_ResidentPaymentDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResidentPaymentDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResidentPaymentDetails&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'ResidentPaymentDetails(name: $name)';
}


}

/// @nodoc
abstract mixin class _$ResidentPaymentDetailsCopyWith<$Res> implements $ResidentPaymentDetailsCopyWith<$Res> {
  factory _$ResidentPaymentDetailsCopyWith(_ResidentPaymentDetails value, $Res Function(_ResidentPaymentDetails) _then) = __$ResidentPaymentDetailsCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$ResidentPaymentDetailsCopyWithImpl<$Res>
    implements _$ResidentPaymentDetailsCopyWith<$Res> {
  __$ResidentPaymentDetailsCopyWithImpl(this._self, this._then);

  final _ResidentPaymentDetails _self;
  final $Res Function(_ResidentPaymentDetails) _then;

/// Create a copy of ResidentPaymentDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_ResidentPaymentDetails(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
