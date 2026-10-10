// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visitor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Visitor {

 String get id;@JsonKey(name: 'org_id') String get orgId; String get name; String? get phone;@JsonKey(name: 'visit_at') DateTime get visitAt;@JsonKey(unknownEnumValue: VisitType.other) VisitType get visitType; String? get purpose;@JsonKey(name: 'unit_id') String? get unitId;@JsonKey(unknownEnumValue: VisitorStatus.pending) VisitorStatus get status;@JsonKey(name: 'created_by') String get createdBy;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of Visitor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VisitorCopyWith<Visitor> get copyWith => _$VisitorCopyWithImpl<Visitor>(this as Visitor, _$identity);

  /// Serializes this Visitor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Visitor&&(identical(other.id, id) || other.id == id)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.visitAt, visitAt) || other.visitAt == visitAt)&&(identical(other.visitType, visitType) || other.visitType == visitType)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orgId,name,phone,visitAt,visitType,purpose,unitId,status,createdBy,createdAt,updatedAt);

@override
String toString() {
  return 'Visitor(id: $id, orgId: $orgId, name: $name, phone: $phone, visitAt: $visitAt, visitType: $visitType, purpose: $purpose, unitId: $unitId, status: $status, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $VisitorCopyWith<$Res>  {
  factory $VisitorCopyWith(Visitor value, $Res Function(Visitor) _then) = _$VisitorCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'org_id') String orgId, String name, String? phone,@JsonKey(name: 'visit_at') DateTime visitAt,@JsonKey(unknownEnumValue: VisitType.other) VisitType visitType, String? purpose,@JsonKey(name: 'unit_id') String? unitId,@JsonKey(unknownEnumValue: VisitorStatus.pending) VisitorStatus status,@JsonKey(name: 'created_by') String createdBy,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$VisitorCopyWithImpl<$Res>
    implements $VisitorCopyWith<$Res> {
  _$VisitorCopyWithImpl(this._self, this._then);

  final Visitor _self;
  final $Res Function(Visitor) _then;

/// Create a copy of Visitor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orgId = null,Object? name = null,Object? phone = freezed,Object? visitAt = null,Object? visitType = null,Object? purpose = freezed,Object? unitId = freezed,Object? status = null,Object? createdBy = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,visitAt: null == visitAt ? _self.visitAt : visitAt // ignore: cast_nullable_to_non_nullable
as DateTime,visitType: null == visitType ? _self.visitType : visitType // ignore: cast_nullable_to_non_nullable
as VisitType,purpose: freezed == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String?,unitId: freezed == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VisitorStatus,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Visitor].
extension VisitorPatterns on Visitor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Visitor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Visitor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Visitor value)  $default,){
final _that = this;
switch (_that) {
case _Visitor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Visitor value)?  $default,){
final _that = this;
switch (_that) {
case _Visitor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'org_id')  String orgId,  String name,  String? phone, @JsonKey(name: 'visit_at')  DateTime visitAt, @JsonKey(unknownEnumValue: VisitType.other)  VisitType visitType,  String? purpose, @JsonKey(name: 'unit_id')  String? unitId, @JsonKey(unknownEnumValue: VisitorStatus.pending)  VisitorStatus status, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Visitor() when $default != null:
return $default(_that.id,_that.orgId,_that.name,_that.phone,_that.visitAt,_that.visitType,_that.purpose,_that.unitId,_that.status,_that.createdBy,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'org_id')  String orgId,  String name,  String? phone, @JsonKey(name: 'visit_at')  DateTime visitAt, @JsonKey(unknownEnumValue: VisitType.other)  VisitType visitType,  String? purpose, @JsonKey(name: 'unit_id')  String? unitId, @JsonKey(unknownEnumValue: VisitorStatus.pending)  VisitorStatus status, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Visitor():
return $default(_that.id,_that.orgId,_that.name,_that.phone,_that.visitAt,_that.visitType,_that.purpose,_that.unitId,_that.status,_that.createdBy,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'org_id')  String orgId,  String name,  String? phone, @JsonKey(name: 'visit_at')  DateTime visitAt, @JsonKey(unknownEnumValue: VisitType.other)  VisitType visitType,  String? purpose, @JsonKey(name: 'unit_id')  String? unitId, @JsonKey(unknownEnumValue: VisitorStatus.pending)  VisitorStatus status, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Visitor() when $default != null:
return $default(_that.id,_that.orgId,_that.name,_that.phone,_that.visitAt,_that.visitType,_that.purpose,_that.unitId,_that.status,_that.createdBy,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Visitor implements Visitor {
  const _Visitor({required this.id, @JsonKey(name: 'org_id') required this.orgId, required this.name, this.phone, @JsonKey(name: 'visit_at') required this.visitAt, @JsonKey(unknownEnumValue: VisitType.other) this.visitType = VisitType.other, this.purpose, @JsonKey(name: 'unit_id') this.unitId, @JsonKey(unknownEnumValue: VisitorStatus.pending) this.status = VisitorStatus.pending, @JsonKey(name: 'created_by') required this.createdBy, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _Visitor.fromJson(Map<String, dynamic> json) => _$VisitorFromJson(json);

@override final  String id;
@override@JsonKey(name: 'org_id') final  String orgId;
@override final  String name;
@override final  String? phone;
@override@JsonKey(name: 'visit_at') final  DateTime visitAt;
@override@JsonKey(unknownEnumValue: VisitType.other) final  VisitType visitType;
@override final  String? purpose;
@override@JsonKey(name: 'unit_id') final  String? unitId;
@override@JsonKey(unknownEnumValue: VisitorStatus.pending) final  VisitorStatus status;
@override@JsonKey(name: 'created_by') final  String createdBy;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of Visitor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VisitorCopyWith<_Visitor> get copyWith => __$VisitorCopyWithImpl<_Visitor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VisitorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Visitor&&(identical(other.id, id) || other.id == id)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.visitAt, visitAt) || other.visitAt == visitAt)&&(identical(other.visitType, visitType) || other.visitType == visitType)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orgId,name,phone,visitAt,visitType,purpose,unitId,status,createdBy,createdAt,updatedAt);

@override
String toString() {
  return 'Visitor(id: $id, orgId: $orgId, name: $name, phone: $phone, visitAt: $visitAt, visitType: $visitType, purpose: $purpose, unitId: $unitId, status: $status, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$VisitorCopyWith<$Res> implements $VisitorCopyWith<$Res> {
  factory _$VisitorCopyWith(_Visitor value, $Res Function(_Visitor) _then) = __$VisitorCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'org_id') String orgId, String name, String? phone,@JsonKey(name: 'visit_at') DateTime visitAt,@JsonKey(unknownEnumValue: VisitType.other) VisitType visitType, String? purpose,@JsonKey(name: 'unit_id') String? unitId,@JsonKey(unknownEnumValue: VisitorStatus.pending) VisitorStatus status,@JsonKey(name: 'created_by') String createdBy,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$VisitorCopyWithImpl<$Res>
    implements _$VisitorCopyWith<$Res> {
  __$VisitorCopyWithImpl(this._self, this._then);

  final _Visitor _self;
  final $Res Function(_Visitor) _then;

/// Create a copy of Visitor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orgId = null,Object? name = null,Object? phone = freezed,Object? visitAt = null,Object? visitType = null,Object? purpose = freezed,Object? unitId = freezed,Object? status = null,Object? createdBy = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Visitor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,visitAt: null == visitAt ? _self.visitAt : visitAt // ignore: cast_nullable_to_non_nullable
as DateTime,visitType: null == visitType ? _self.visitType : visitType // ignore: cast_nullable_to_non_nullable
as VisitType,purpose: freezed == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String?,unitId: freezed == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VisitorStatus,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
