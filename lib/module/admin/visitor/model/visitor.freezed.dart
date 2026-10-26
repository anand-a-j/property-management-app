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

 String get id;@JsonKey(name: 'org_id') String get orgId; String get name; String? get phone;@JsonKey(name: 'visitor_code') String? get visitorCode;// Visit schedule
@JsonKey(name: 'visit_start_at') DateTime? get visitStartAt;@JsonKey(name: 'visit_end_at') DateTime? get visitEndAt;// Legacy field
@JsonKey(name: 'visit_at') DateTime? get visitAt;// Visit classification
@JsonKey(unknownEnumValue: VisitType.other) VisitType get visitType; String? get purpose;// Unit, resident and lease associations
@JsonKey(name: 'unit_id') String? get unitId;@JsonKey(name: 'resident_id') String? get residentId;@JsonKey(name: 'lease_id') String? get leaseId;// Parking and document
@JsonKey(name: 'parking_required') bool? get parkingRequired;@JsonKey(name: 'document_id') String? get documentId;// Visitor workflow
@JsonKey(unknownEnumValue: VisitorStatus.pending) VisitorStatus get status;// Audit and approval
@JsonKey(name: 'created_by') String get createdBy;@JsonKey(name: 'approved_by') String? get approvedBy;@JsonKey(name: 'checked_in_at') DateTime? get checkedInAt;@JsonKey(name: 'checked_out_at') DateTime? get checkedOutAt;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of Visitor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VisitorCopyWith<Visitor> get copyWith => _$VisitorCopyWithImpl<Visitor>(this as Visitor, _$identity);

  /// Serializes this Visitor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Visitor&&(identical(other.id, id) || other.id == id)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.visitorCode, visitorCode) || other.visitorCode == visitorCode)&&(identical(other.visitStartAt, visitStartAt) || other.visitStartAt == visitStartAt)&&(identical(other.visitEndAt, visitEndAt) || other.visitEndAt == visitEndAt)&&(identical(other.visitAt, visitAt) || other.visitAt == visitAt)&&(identical(other.visitType, visitType) || other.visitType == visitType)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.leaseId, leaseId) || other.leaseId == leaseId)&&(identical(other.parkingRequired, parkingRequired) || other.parkingRequired == parkingRequired)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy)&&(identical(other.checkedInAt, checkedInAt) || other.checkedInAt == checkedInAt)&&(identical(other.checkedOutAt, checkedOutAt) || other.checkedOutAt == checkedOutAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,orgId,name,phone,visitorCode,visitStartAt,visitEndAt,visitAt,visitType,purpose,unitId,residentId,leaseId,parkingRequired,documentId,status,createdBy,approvedBy,checkedInAt,checkedOutAt,createdAt,updatedAt]);

@override
String toString() {
  return 'Visitor(id: $id, orgId: $orgId, name: $name, phone: $phone, visitorCode: $visitorCode, visitStartAt: $visitStartAt, visitEndAt: $visitEndAt, visitAt: $visitAt, visitType: $visitType, purpose: $purpose, unitId: $unitId, residentId: $residentId, leaseId: $leaseId, parkingRequired: $parkingRequired, documentId: $documentId, status: $status, createdBy: $createdBy, approvedBy: $approvedBy, checkedInAt: $checkedInAt, checkedOutAt: $checkedOutAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $VisitorCopyWith<$Res>  {
  factory $VisitorCopyWith(Visitor value, $Res Function(Visitor) _then) = _$VisitorCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'org_id') String orgId, String name, String? phone,@JsonKey(name: 'visitor_code') String? visitorCode,@JsonKey(name: 'visit_start_at') DateTime? visitStartAt,@JsonKey(name: 'visit_end_at') DateTime? visitEndAt,@JsonKey(name: 'visit_at') DateTime? visitAt,@JsonKey(unknownEnumValue: VisitType.other) VisitType visitType, String? purpose,@JsonKey(name: 'unit_id') String? unitId,@JsonKey(name: 'resident_id') String? residentId,@JsonKey(name: 'lease_id') String? leaseId,@JsonKey(name: 'parking_required') bool? parkingRequired,@JsonKey(name: 'document_id') String? documentId,@JsonKey(unknownEnumValue: VisitorStatus.pending) VisitorStatus status,@JsonKey(name: 'created_by') String createdBy,@JsonKey(name: 'approved_by') String? approvedBy,@JsonKey(name: 'checked_in_at') DateTime? checkedInAt,@JsonKey(name: 'checked_out_at') DateTime? checkedOutAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orgId = null,Object? name = null,Object? phone = freezed,Object? visitorCode = freezed,Object? visitStartAt = freezed,Object? visitEndAt = freezed,Object? visitAt = freezed,Object? visitType = null,Object? purpose = freezed,Object? unitId = freezed,Object? residentId = freezed,Object? leaseId = freezed,Object? parkingRequired = freezed,Object? documentId = freezed,Object? status = null,Object? createdBy = null,Object? approvedBy = freezed,Object? checkedInAt = freezed,Object? checkedOutAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,visitorCode: freezed == visitorCode ? _self.visitorCode : visitorCode // ignore: cast_nullable_to_non_nullable
as String?,visitStartAt: freezed == visitStartAt ? _self.visitStartAt : visitStartAt // ignore: cast_nullable_to_non_nullable
as DateTime?,visitEndAt: freezed == visitEndAt ? _self.visitEndAt : visitEndAt // ignore: cast_nullable_to_non_nullable
as DateTime?,visitAt: freezed == visitAt ? _self.visitAt : visitAt // ignore: cast_nullable_to_non_nullable
as DateTime?,visitType: null == visitType ? _self.visitType : visitType // ignore: cast_nullable_to_non_nullable
as VisitType,purpose: freezed == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String?,unitId: freezed == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String?,residentId: freezed == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String?,leaseId: freezed == leaseId ? _self.leaseId : leaseId // ignore: cast_nullable_to_non_nullable
as String?,parkingRequired: freezed == parkingRequired ? _self.parkingRequired : parkingRequired // ignore: cast_nullable_to_non_nullable
as bool?,documentId: freezed == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VisitorStatus,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,checkedInAt: freezed == checkedInAt ? _self.checkedInAt : checkedInAt // ignore: cast_nullable_to_non_nullable
as DateTime?,checkedOutAt: freezed == checkedOutAt ? _self.checkedOutAt : checkedOutAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'org_id')  String orgId,  String name,  String? phone, @JsonKey(name: 'visitor_code')  String? visitorCode, @JsonKey(name: 'visit_start_at')  DateTime? visitStartAt, @JsonKey(name: 'visit_end_at')  DateTime? visitEndAt, @JsonKey(name: 'visit_at')  DateTime? visitAt, @JsonKey(unknownEnumValue: VisitType.other)  VisitType visitType,  String? purpose, @JsonKey(name: 'unit_id')  String? unitId, @JsonKey(name: 'resident_id')  String? residentId, @JsonKey(name: 'lease_id')  String? leaseId, @JsonKey(name: 'parking_required')  bool? parkingRequired, @JsonKey(name: 'document_id')  String? documentId, @JsonKey(unknownEnumValue: VisitorStatus.pending)  VisitorStatus status, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'approved_by')  String? approvedBy, @JsonKey(name: 'checked_in_at')  DateTime? checkedInAt, @JsonKey(name: 'checked_out_at')  DateTime? checkedOutAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Visitor() when $default != null:
return $default(_that.id,_that.orgId,_that.name,_that.phone,_that.visitorCode,_that.visitStartAt,_that.visitEndAt,_that.visitAt,_that.visitType,_that.purpose,_that.unitId,_that.residentId,_that.leaseId,_that.parkingRequired,_that.documentId,_that.status,_that.createdBy,_that.approvedBy,_that.checkedInAt,_that.checkedOutAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'org_id')  String orgId,  String name,  String? phone, @JsonKey(name: 'visitor_code')  String? visitorCode, @JsonKey(name: 'visit_start_at')  DateTime? visitStartAt, @JsonKey(name: 'visit_end_at')  DateTime? visitEndAt, @JsonKey(name: 'visit_at')  DateTime? visitAt, @JsonKey(unknownEnumValue: VisitType.other)  VisitType visitType,  String? purpose, @JsonKey(name: 'unit_id')  String? unitId, @JsonKey(name: 'resident_id')  String? residentId, @JsonKey(name: 'lease_id')  String? leaseId, @JsonKey(name: 'parking_required')  bool? parkingRequired, @JsonKey(name: 'document_id')  String? documentId, @JsonKey(unknownEnumValue: VisitorStatus.pending)  VisitorStatus status, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'approved_by')  String? approvedBy, @JsonKey(name: 'checked_in_at')  DateTime? checkedInAt, @JsonKey(name: 'checked_out_at')  DateTime? checkedOutAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Visitor():
return $default(_that.id,_that.orgId,_that.name,_that.phone,_that.visitorCode,_that.visitStartAt,_that.visitEndAt,_that.visitAt,_that.visitType,_that.purpose,_that.unitId,_that.residentId,_that.leaseId,_that.parkingRequired,_that.documentId,_that.status,_that.createdBy,_that.approvedBy,_that.checkedInAt,_that.checkedOutAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'org_id')  String orgId,  String name,  String? phone, @JsonKey(name: 'visitor_code')  String? visitorCode, @JsonKey(name: 'visit_start_at')  DateTime? visitStartAt, @JsonKey(name: 'visit_end_at')  DateTime? visitEndAt, @JsonKey(name: 'visit_at')  DateTime? visitAt, @JsonKey(unknownEnumValue: VisitType.other)  VisitType visitType,  String? purpose, @JsonKey(name: 'unit_id')  String? unitId, @JsonKey(name: 'resident_id')  String? residentId, @JsonKey(name: 'lease_id')  String? leaseId, @JsonKey(name: 'parking_required')  bool? parkingRequired, @JsonKey(name: 'document_id')  String? documentId, @JsonKey(unknownEnumValue: VisitorStatus.pending)  VisitorStatus status, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'approved_by')  String? approvedBy, @JsonKey(name: 'checked_in_at')  DateTime? checkedInAt, @JsonKey(name: 'checked_out_at')  DateTime? checkedOutAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Visitor() when $default != null:
return $default(_that.id,_that.orgId,_that.name,_that.phone,_that.visitorCode,_that.visitStartAt,_that.visitEndAt,_that.visitAt,_that.visitType,_that.purpose,_that.unitId,_that.residentId,_that.leaseId,_that.parkingRequired,_that.documentId,_that.status,_that.createdBy,_that.approvedBy,_that.checkedInAt,_that.checkedOutAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Visitor implements Visitor {
  const _Visitor({required this.id, @JsonKey(name: 'org_id') required this.orgId, required this.name, this.phone, @JsonKey(name: 'visitor_code') this.visitorCode, @JsonKey(name: 'visit_start_at') this.visitStartAt, @JsonKey(name: 'visit_end_at') this.visitEndAt, @JsonKey(name: 'visit_at') this.visitAt, @JsonKey(unknownEnumValue: VisitType.other) this.visitType = VisitType.other, this.purpose, @JsonKey(name: 'unit_id') this.unitId, @JsonKey(name: 'resident_id') this.residentId, @JsonKey(name: 'lease_id') this.leaseId, @JsonKey(name: 'parking_required') this.parkingRequired, @JsonKey(name: 'document_id') this.documentId, @JsonKey(unknownEnumValue: VisitorStatus.pending) this.status = VisitorStatus.pending, @JsonKey(name: 'created_by') required this.createdBy, @JsonKey(name: 'approved_by') this.approvedBy, @JsonKey(name: 'checked_in_at') this.checkedInAt, @JsonKey(name: 'checked_out_at') this.checkedOutAt, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _Visitor.fromJson(Map<String, dynamic> json) => _$VisitorFromJson(json);

@override final  String id;
@override@JsonKey(name: 'org_id') final  String orgId;
@override final  String name;
@override final  String? phone;
@override@JsonKey(name: 'visitor_code') final  String? visitorCode;
// Visit schedule
@override@JsonKey(name: 'visit_start_at') final  DateTime? visitStartAt;
@override@JsonKey(name: 'visit_end_at') final  DateTime? visitEndAt;
// Legacy field
@override@JsonKey(name: 'visit_at') final  DateTime? visitAt;
// Visit classification
@override@JsonKey(unknownEnumValue: VisitType.other) final  VisitType visitType;
@override final  String? purpose;
// Unit, resident and lease associations
@override@JsonKey(name: 'unit_id') final  String? unitId;
@override@JsonKey(name: 'resident_id') final  String? residentId;
@override@JsonKey(name: 'lease_id') final  String? leaseId;
// Parking and document
@override@JsonKey(name: 'parking_required') final  bool? parkingRequired;
@override@JsonKey(name: 'document_id') final  String? documentId;
// Visitor workflow
@override@JsonKey(unknownEnumValue: VisitorStatus.pending) final  VisitorStatus status;
// Audit and approval
@override@JsonKey(name: 'created_by') final  String createdBy;
@override@JsonKey(name: 'approved_by') final  String? approvedBy;
@override@JsonKey(name: 'checked_in_at') final  DateTime? checkedInAt;
@override@JsonKey(name: 'checked_out_at') final  DateTime? checkedOutAt;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Visitor&&(identical(other.id, id) || other.id == id)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.visitorCode, visitorCode) || other.visitorCode == visitorCode)&&(identical(other.visitStartAt, visitStartAt) || other.visitStartAt == visitStartAt)&&(identical(other.visitEndAt, visitEndAt) || other.visitEndAt == visitEndAt)&&(identical(other.visitAt, visitAt) || other.visitAt == visitAt)&&(identical(other.visitType, visitType) || other.visitType == visitType)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.leaseId, leaseId) || other.leaseId == leaseId)&&(identical(other.parkingRequired, parkingRequired) || other.parkingRequired == parkingRequired)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy)&&(identical(other.checkedInAt, checkedInAt) || other.checkedInAt == checkedInAt)&&(identical(other.checkedOutAt, checkedOutAt) || other.checkedOutAt == checkedOutAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,orgId,name,phone,visitorCode,visitStartAt,visitEndAt,visitAt,visitType,purpose,unitId,residentId,leaseId,parkingRequired,documentId,status,createdBy,approvedBy,checkedInAt,checkedOutAt,createdAt,updatedAt]);

@override
String toString() {
  return 'Visitor(id: $id, orgId: $orgId, name: $name, phone: $phone, visitorCode: $visitorCode, visitStartAt: $visitStartAt, visitEndAt: $visitEndAt, visitAt: $visitAt, visitType: $visitType, purpose: $purpose, unitId: $unitId, residentId: $residentId, leaseId: $leaseId, parkingRequired: $parkingRequired, documentId: $documentId, status: $status, createdBy: $createdBy, approvedBy: $approvedBy, checkedInAt: $checkedInAt, checkedOutAt: $checkedOutAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$VisitorCopyWith<$Res> implements $VisitorCopyWith<$Res> {
  factory _$VisitorCopyWith(_Visitor value, $Res Function(_Visitor) _then) = __$VisitorCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'org_id') String orgId, String name, String? phone,@JsonKey(name: 'visitor_code') String? visitorCode,@JsonKey(name: 'visit_start_at') DateTime? visitStartAt,@JsonKey(name: 'visit_end_at') DateTime? visitEndAt,@JsonKey(name: 'visit_at') DateTime? visitAt,@JsonKey(unknownEnumValue: VisitType.other) VisitType visitType, String? purpose,@JsonKey(name: 'unit_id') String? unitId,@JsonKey(name: 'resident_id') String? residentId,@JsonKey(name: 'lease_id') String? leaseId,@JsonKey(name: 'parking_required') bool? parkingRequired,@JsonKey(name: 'document_id') String? documentId,@JsonKey(unknownEnumValue: VisitorStatus.pending) VisitorStatus status,@JsonKey(name: 'created_by') String createdBy,@JsonKey(name: 'approved_by') String? approvedBy,@JsonKey(name: 'checked_in_at') DateTime? checkedInAt,@JsonKey(name: 'checked_out_at') DateTime? checkedOutAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orgId = null,Object? name = null,Object? phone = freezed,Object? visitorCode = freezed,Object? visitStartAt = freezed,Object? visitEndAt = freezed,Object? visitAt = freezed,Object? visitType = null,Object? purpose = freezed,Object? unitId = freezed,Object? residentId = freezed,Object? leaseId = freezed,Object? parkingRequired = freezed,Object? documentId = freezed,Object? status = null,Object? createdBy = null,Object? approvedBy = freezed,Object? checkedInAt = freezed,Object? checkedOutAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Visitor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,visitorCode: freezed == visitorCode ? _self.visitorCode : visitorCode // ignore: cast_nullable_to_non_nullable
as String?,visitStartAt: freezed == visitStartAt ? _self.visitStartAt : visitStartAt // ignore: cast_nullable_to_non_nullable
as DateTime?,visitEndAt: freezed == visitEndAt ? _self.visitEndAt : visitEndAt // ignore: cast_nullable_to_non_nullable
as DateTime?,visitAt: freezed == visitAt ? _self.visitAt : visitAt // ignore: cast_nullable_to_non_nullable
as DateTime?,visitType: null == visitType ? _self.visitType : visitType // ignore: cast_nullable_to_non_nullable
as VisitType,purpose: freezed == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String?,unitId: freezed == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String?,residentId: freezed == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String?,leaseId: freezed == leaseId ? _self.leaseId : leaseId // ignore: cast_nullable_to_non_nullable
as String?,parkingRequired: freezed == parkingRequired ? _self.parkingRequired : parkingRequired // ignore: cast_nullable_to_non_nullable
as bool?,documentId: freezed == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VisitorStatus,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,checkedInAt: freezed == checkedInAt ? _self.checkedInAt : checkedInAt // ignore: cast_nullable_to_non_nullable
as DateTime?,checkedOutAt: freezed == checkedOutAt ? _self.checkedOutAt : checkedOutAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
