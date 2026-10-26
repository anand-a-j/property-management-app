// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_visitor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateVisitor {

@JsonKey(name: 'org_id') String get orgId; String get name; String? get phone;// Visit schedule
@JsonKey(name: 'visit_start_at') DateTime? get visitStartAt;@JsonKey(name: 'visit_end_at') DateTime? get visitEndAt;// Visit classification
@JsonKey(name: 'visit_type') String get visitType; String? get purpose;// Associations
@JsonKey(name: 'unit_id') String? get unitId;@JsonKey(name: 'resident_id') String? get residentId;@JsonKey(name: 'lease_id') String? get leaseId;// Parking and optional document
@JsonKey(name: 'parking_required') bool get parkingRequired;@JsonKey(name: 'document_id') String? get documentId;// Creator
@JsonKey(name: 'created_by') String get createdBy;
/// Create a copy of CreateVisitor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateVisitorCopyWith<CreateVisitor> get copyWith => _$CreateVisitorCopyWithImpl<CreateVisitor>(this as CreateVisitor, _$identity);

  /// Serializes this CreateVisitor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateVisitor&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.visitStartAt, visitStartAt) || other.visitStartAt == visitStartAt)&&(identical(other.visitEndAt, visitEndAt) || other.visitEndAt == visitEndAt)&&(identical(other.visitType, visitType) || other.visitType == visitType)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.leaseId, leaseId) || other.leaseId == leaseId)&&(identical(other.parkingRequired, parkingRequired) || other.parkingRequired == parkingRequired)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orgId,name,phone,visitStartAt,visitEndAt,visitType,purpose,unitId,residentId,leaseId,parkingRequired,documentId,createdBy);

@override
String toString() {
  return 'CreateVisitor(orgId: $orgId, name: $name, phone: $phone, visitStartAt: $visitStartAt, visitEndAt: $visitEndAt, visitType: $visitType, purpose: $purpose, unitId: $unitId, residentId: $residentId, leaseId: $leaseId, parkingRequired: $parkingRequired, documentId: $documentId, createdBy: $createdBy)';
}


}

/// @nodoc
abstract mixin class $CreateVisitorCopyWith<$Res>  {
  factory $CreateVisitorCopyWith(CreateVisitor value, $Res Function(CreateVisitor) _then) = _$CreateVisitorCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'org_id') String orgId, String name, String? phone,@JsonKey(name: 'visit_start_at') DateTime? visitStartAt,@JsonKey(name: 'visit_end_at') DateTime? visitEndAt,@JsonKey(name: 'visit_type') String visitType, String? purpose,@JsonKey(name: 'unit_id') String? unitId,@JsonKey(name: 'resident_id') String? residentId,@JsonKey(name: 'lease_id') String? leaseId,@JsonKey(name: 'parking_required') bool parkingRequired,@JsonKey(name: 'document_id') String? documentId,@JsonKey(name: 'created_by') String createdBy
});




}
/// @nodoc
class _$CreateVisitorCopyWithImpl<$Res>
    implements $CreateVisitorCopyWith<$Res> {
  _$CreateVisitorCopyWithImpl(this._self, this._then);

  final CreateVisitor _self;
  final $Res Function(CreateVisitor) _then;

/// Create a copy of CreateVisitor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orgId = null,Object? name = null,Object? phone = freezed,Object? visitStartAt = freezed,Object? visitEndAt = freezed,Object? visitType = null,Object? purpose = freezed,Object? unitId = freezed,Object? residentId = freezed,Object? leaseId = freezed,Object? parkingRequired = null,Object? documentId = freezed,Object? createdBy = null,}) {
  return _then(_self.copyWith(
orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,visitStartAt: freezed == visitStartAt ? _self.visitStartAt : visitStartAt // ignore: cast_nullable_to_non_nullable
as DateTime?,visitEndAt: freezed == visitEndAt ? _self.visitEndAt : visitEndAt // ignore: cast_nullable_to_non_nullable
as DateTime?,visitType: null == visitType ? _self.visitType : visitType // ignore: cast_nullable_to_non_nullable
as String,purpose: freezed == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String?,unitId: freezed == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String?,residentId: freezed == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String?,leaseId: freezed == leaseId ? _self.leaseId : leaseId // ignore: cast_nullable_to_non_nullable
as String?,parkingRequired: null == parkingRequired ? _self.parkingRequired : parkingRequired // ignore: cast_nullable_to_non_nullable
as bool,documentId: freezed == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String?,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateVisitor].
extension CreateVisitorPatterns on CreateVisitor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateVisitor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateVisitor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateVisitor value)  $default,){
final _that = this;
switch (_that) {
case _CreateVisitor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateVisitor value)?  $default,){
final _that = this;
switch (_that) {
case _CreateVisitor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'org_id')  String orgId,  String name,  String? phone, @JsonKey(name: 'visit_start_at')  DateTime? visitStartAt, @JsonKey(name: 'visit_end_at')  DateTime? visitEndAt, @JsonKey(name: 'visit_type')  String visitType,  String? purpose, @JsonKey(name: 'unit_id')  String? unitId, @JsonKey(name: 'resident_id')  String? residentId, @JsonKey(name: 'lease_id')  String? leaseId, @JsonKey(name: 'parking_required')  bool parkingRequired, @JsonKey(name: 'document_id')  String? documentId, @JsonKey(name: 'created_by')  String createdBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateVisitor() when $default != null:
return $default(_that.orgId,_that.name,_that.phone,_that.visitStartAt,_that.visitEndAt,_that.visitType,_that.purpose,_that.unitId,_that.residentId,_that.leaseId,_that.parkingRequired,_that.documentId,_that.createdBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'org_id')  String orgId,  String name,  String? phone, @JsonKey(name: 'visit_start_at')  DateTime? visitStartAt, @JsonKey(name: 'visit_end_at')  DateTime? visitEndAt, @JsonKey(name: 'visit_type')  String visitType,  String? purpose, @JsonKey(name: 'unit_id')  String? unitId, @JsonKey(name: 'resident_id')  String? residentId, @JsonKey(name: 'lease_id')  String? leaseId, @JsonKey(name: 'parking_required')  bool parkingRequired, @JsonKey(name: 'document_id')  String? documentId, @JsonKey(name: 'created_by')  String createdBy)  $default,) {final _that = this;
switch (_that) {
case _CreateVisitor():
return $default(_that.orgId,_that.name,_that.phone,_that.visitStartAt,_that.visitEndAt,_that.visitType,_that.purpose,_that.unitId,_that.residentId,_that.leaseId,_that.parkingRequired,_that.documentId,_that.createdBy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'org_id')  String orgId,  String name,  String? phone, @JsonKey(name: 'visit_start_at')  DateTime? visitStartAt, @JsonKey(name: 'visit_end_at')  DateTime? visitEndAt, @JsonKey(name: 'visit_type')  String visitType,  String? purpose, @JsonKey(name: 'unit_id')  String? unitId, @JsonKey(name: 'resident_id')  String? residentId, @JsonKey(name: 'lease_id')  String? leaseId, @JsonKey(name: 'parking_required')  bool parkingRequired, @JsonKey(name: 'document_id')  String? documentId, @JsonKey(name: 'created_by')  String createdBy)?  $default,) {final _that = this;
switch (_that) {
case _CreateVisitor() when $default != null:
return $default(_that.orgId,_that.name,_that.phone,_that.visitStartAt,_that.visitEndAt,_that.visitType,_that.purpose,_that.unitId,_that.residentId,_that.leaseId,_that.parkingRequired,_that.documentId,_that.createdBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateVisitor implements CreateVisitor {
  const _CreateVisitor({@JsonKey(name: 'org_id') required this.orgId, required this.name, this.phone, @JsonKey(name: 'visit_start_at') this.visitStartAt, @JsonKey(name: 'visit_end_at') this.visitEndAt, @JsonKey(name: 'visit_type') required this.visitType, this.purpose, @JsonKey(name: 'unit_id') this.unitId, @JsonKey(name: 'resident_id') this.residentId, @JsonKey(name: 'lease_id') this.leaseId, @JsonKey(name: 'parking_required') this.parkingRequired = false, @JsonKey(name: 'document_id') this.documentId, @JsonKey(name: 'created_by') required this.createdBy});
  factory _CreateVisitor.fromJson(Map<String, dynamic> json) => _$CreateVisitorFromJson(json);

@override@JsonKey(name: 'org_id') final  String orgId;
@override final  String name;
@override final  String? phone;
// Visit schedule
@override@JsonKey(name: 'visit_start_at') final  DateTime? visitStartAt;
@override@JsonKey(name: 'visit_end_at') final  DateTime? visitEndAt;
// Visit classification
@override@JsonKey(name: 'visit_type') final  String visitType;
@override final  String? purpose;
// Associations
@override@JsonKey(name: 'unit_id') final  String? unitId;
@override@JsonKey(name: 'resident_id') final  String? residentId;
@override@JsonKey(name: 'lease_id') final  String? leaseId;
// Parking and optional document
@override@JsonKey(name: 'parking_required') final  bool parkingRequired;
@override@JsonKey(name: 'document_id') final  String? documentId;
// Creator
@override@JsonKey(name: 'created_by') final  String createdBy;

/// Create a copy of CreateVisitor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateVisitorCopyWith<_CreateVisitor> get copyWith => __$CreateVisitorCopyWithImpl<_CreateVisitor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateVisitorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateVisitor&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.visitStartAt, visitStartAt) || other.visitStartAt == visitStartAt)&&(identical(other.visitEndAt, visitEndAt) || other.visitEndAt == visitEndAt)&&(identical(other.visitType, visitType) || other.visitType == visitType)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.leaseId, leaseId) || other.leaseId == leaseId)&&(identical(other.parkingRequired, parkingRequired) || other.parkingRequired == parkingRequired)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orgId,name,phone,visitStartAt,visitEndAt,visitType,purpose,unitId,residentId,leaseId,parkingRequired,documentId,createdBy);

@override
String toString() {
  return 'CreateVisitor(orgId: $orgId, name: $name, phone: $phone, visitStartAt: $visitStartAt, visitEndAt: $visitEndAt, visitType: $visitType, purpose: $purpose, unitId: $unitId, residentId: $residentId, leaseId: $leaseId, parkingRequired: $parkingRequired, documentId: $documentId, createdBy: $createdBy)';
}


}

/// @nodoc
abstract mixin class _$CreateVisitorCopyWith<$Res> implements $CreateVisitorCopyWith<$Res> {
  factory _$CreateVisitorCopyWith(_CreateVisitor value, $Res Function(_CreateVisitor) _then) = __$CreateVisitorCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'org_id') String orgId, String name, String? phone,@JsonKey(name: 'visit_start_at') DateTime? visitStartAt,@JsonKey(name: 'visit_end_at') DateTime? visitEndAt,@JsonKey(name: 'visit_type') String visitType, String? purpose,@JsonKey(name: 'unit_id') String? unitId,@JsonKey(name: 'resident_id') String? residentId,@JsonKey(name: 'lease_id') String? leaseId,@JsonKey(name: 'parking_required') bool parkingRequired,@JsonKey(name: 'document_id') String? documentId,@JsonKey(name: 'created_by') String createdBy
});




}
/// @nodoc
class __$CreateVisitorCopyWithImpl<$Res>
    implements _$CreateVisitorCopyWith<$Res> {
  __$CreateVisitorCopyWithImpl(this._self, this._then);

  final _CreateVisitor _self;
  final $Res Function(_CreateVisitor) _then;

/// Create a copy of CreateVisitor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orgId = null,Object? name = null,Object? phone = freezed,Object? visitStartAt = freezed,Object? visitEndAt = freezed,Object? visitType = null,Object? purpose = freezed,Object? unitId = freezed,Object? residentId = freezed,Object? leaseId = freezed,Object? parkingRequired = null,Object? documentId = freezed,Object? createdBy = null,}) {
  return _then(_CreateVisitor(
orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,visitStartAt: freezed == visitStartAt ? _self.visitStartAt : visitStartAt // ignore: cast_nullable_to_non_nullable
as DateTime?,visitEndAt: freezed == visitEndAt ? _self.visitEndAt : visitEndAt // ignore: cast_nullable_to_non_nullable
as DateTime?,visitType: null == visitType ? _self.visitType : visitType // ignore: cast_nullable_to_non_nullable
as String,purpose: freezed == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String?,unitId: freezed == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String?,residentId: freezed == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String?,leaseId: freezed == leaseId ? _self.leaseId : leaseId // ignore: cast_nullable_to_non_nullable
as String?,parkingRequired: null == parkingRequired ? _self.parkingRequired : parkingRequired // ignore: cast_nullable_to_non_nullable
as bool,documentId: freezed == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String?,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
