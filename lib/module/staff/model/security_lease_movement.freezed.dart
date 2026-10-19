// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'security_lease_movement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SecurityLeaseMovement {

@JsonKey(name: 'org_id') String? get orgId;@JsonKey(name: 'movement_id') String get movementId;@JsonKey(name: 'lease_id') String? get leaseId;@JsonKey(name: 'movement_type') String? get movementType; String get status;@JsonKey(name: 'requested_by') String? get requestedBy;@JsonKey(name: 'requested_at') DateTime? get requestedAt;@JsonKey(name: 'manager_reviewed_by') String? get managerReviewedBy;@JsonKey(name: 'manager_reviewed_at') DateTime? get managerReviewedAt;@JsonKey(name: 'manager_rejection_reason') String? get managerRejectionReason;@JsonKey(name: 'security_reviewed_by') String? get securityReviewedBy;@JsonKey(name: 'security_reviewed_at') DateTime? get securityReviewedAt;@JsonKey(name: 'security_rejection_reason') String? get securityRejectionReason;@JsonKey(name: 'completed_at') DateTime? get completedAt;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;@JsonKey(name: 'lease_number') String? get leaseNumber;@JsonKey(name: 'start_date') DateTime? get startDate;@JsonKey(name: 'end_date') DateTime? get endDate;@JsonKey(name: 'lease_status') String? get leaseStatus;@JsonKey(name: 'unit_id') String? get unitId;@JsonKey(name: 'unit_name') String? get unitName;@JsonKey(name: 'resident_id') String? get residentId;@JsonKey(name: 'resident_name') String? get residentName;@JsonKey(name: 'requested_by_name') String? get requestedByName;
/// Create a copy of SecurityLeaseMovement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SecurityLeaseMovementCopyWith<SecurityLeaseMovement> get copyWith => _$SecurityLeaseMovementCopyWithImpl<SecurityLeaseMovement>(this as SecurityLeaseMovement, _$identity);

  /// Serializes this SecurityLeaseMovement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SecurityLeaseMovement&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.movementId, movementId) || other.movementId == movementId)&&(identical(other.leaseId, leaseId) || other.leaseId == leaseId)&&(identical(other.movementType, movementType) || other.movementType == movementType)&&(identical(other.status, status) || other.status == status)&&(identical(other.requestedBy, requestedBy) || other.requestedBy == requestedBy)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.managerReviewedBy, managerReviewedBy) || other.managerReviewedBy == managerReviewedBy)&&(identical(other.managerReviewedAt, managerReviewedAt) || other.managerReviewedAt == managerReviewedAt)&&(identical(other.managerRejectionReason, managerRejectionReason) || other.managerRejectionReason == managerRejectionReason)&&(identical(other.securityReviewedBy, securityReviewedBy) || other.securityReviewedBy == securityReviewedBy)&&(identical(other.securityReviewedAt, securityReviewedAt) || other.securityReviewedAt == securityReviewedAt)&&(identical(other.securityRejectionReason, securityRejectionReason) || other.securityRejectionReason == securityRejectionReason)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.leaseNumber, leaseNumber) || other.leaseNumber == leaseNumber)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.leaseStatus, leaseStatus) || other.leaseStatus == leaseStatus)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.unitName, unitName) || other.unitName == unitName)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.residentName, residentName) || other.residentName == residentName)&&(identical(other.requestedByName, requestedByName) || other.requestedByName == requestedByName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,orgId,movementId,leaseId,movementType,status,requestedBy,requestedAt,managerReviewedBy,managerReviewedAt,managerRejectionReason,securityReviewedBy,securityReviewedAt,securityRejectionReason,completedAt,createdAt,updatedAt,leaseNumber,startDate,endDate,leaseStatus,unitId,unitName,residentId,residentName,requestedByName]);

@override
String toString() {
  return 'SecurityLeaseMovement(orgId: $orgId, movementId: $movementId, leaseId: $leaseId, movementType: $movementType, status: $status, requestedBy: $requestedBy, requestedAt: $requestedAt, managerReviewedBy: $managerReviewedBy, managerReviewedAt: $managerReviewedAt, managerRejectionReason: $managerRejectionReason, securityReviewedBy: $securityReviewedBy, securityReviewedAt: $securityReviewedAt, securityRejectionReason: $securityRejectionReason, completedAt: $completedAt, createdAt: $createdAt, updatedAt: $updatedAt, leaseNumber: $leaseNumber, startDate: $startDate, endDate: $endDate, leaseStatus: $leaseStatus, unitId: $unitId, unitName: $unitName, residentId: $residentId, residentName: $residentName, requestedByName: $requestedByName)';
}


}

/// @nodoc
abstract mixin class $SecurityLeaseMovementCopyWith<$Res>  {
  factory $SecurityLeaseMovementCopyWith(SecurityLeaseMovement value, $Res Function(SecurityLeaseMovement) _then) = _$SecurityLeaseMovementCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'org_id') String? orgId,@JsonKey(name: 'movement_id') String movementId,@JsonKey(name: 'lease_id') String? leaseId,@JsonKey(name: 'movement_type') String? movementType, String status,@JsonKey(name: 'requested_by') String? requestedBy,@JsonKey(name: 'requested_at') DateTime? requestedAt,@JsonKey(name: 'manager_reviewed_by') String? managerReviewedBy,@JsonKey(name: 'manager_reviewed_at') DateTime? managerReviewedAt,@JsonKey(name: 'manager_rejection_reason') String? managerRejectionReason,@JsonKey(name: 'security_reviewed_by') String? securityReviewedBy,@JsonKey(name: 'security_reviewed_at') DateTime? securityReviewedAt,@JsonKey(name: 'security_rejection_reason') String? securityRejectionReason,@JsonKey(name: 'completed_at') DateTime? completedAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'lease_number') String? leaseNumber,@JsonKey(name: 'start_date') DateTime? startDate,@JsonKey(name: 'end_date') DateTime? endDate,@JsonKey(name: 'lease_status') String? leaseStatus,@JsonKey(name: 'unit_id') String? unitId,@JsonKey(name: 'unit_name') String? unitName,@JsonKey(name: 'resident_id') String? residentId,@JsonKey(name: 'resident_name') String? residentName,@JsonKey(name: 'requested_by_name') String? requestedByName
});




}
/// @nodoc
class _$SecurityLeaseMovementCopyWithImpl<$Res>
    implements $SecurityLeaseMovementCopyWith<$Res> {
  _$SecurityLeaseMovementCopyWithImpl(this._self, this._then);

  final SecurityLeaseMovement _self;
  final $Res Function(SecurityLeaseMovement) _then;

/// Create a copy of SecurityLeaseMovement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orgId = freezed,Object? movementId = null,Object? leaseId = freezed,Object? movementType = freezed,Object? status = null,Object? requestedBy = freezed,Object? requestedAt = freezed,Object? managerReviewedBy = freezed,Object? managerReviewedAt = freezed,Object? managerRejectionReason = freezed,Object? securityReviewedBy = freezed,Object? securityReviewedAt = freezed,Object? securityRejectionReason = freezed,Object? completedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? leaseNumber = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? leaseStatus = freezed,Object? unitId = freezed,Object? unitName = freezed,Object? residentId = freezed,Object? residentName = freezed,Object? requestedByName = freezed,}) {
  return _then(_self.copyWith(
orgId: freezed == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String?,movementId: null == movementId ? _self.movementId : movementId // ignore: cast_nullable_to_non_nullable
as String,leaseId: freezed == leaseId ? _self.leaseId : leaseId // ignore: cast_nullable_to_non_nullable
as String?,movementType: freezed == movementType ? _self.movementType : movementType // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,requestedBy: freezed == requestedBy ? _self.requestedBy : requestedBy // ignore: cast_nullable_to_non_nullable
as String?,requestedAt: freezed == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,managerReviewedBy: freezed == managerReviewedBy ? _self.managerReviewedBy : managerReviewedBy // ignore: cast_nullable_to_non_nullable
as String?,managerReviewedAt: freezed == managerReviewedAt ? _self.managerReviewedAt : managerReviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,managerRejectionReason: freezed == managerRejectionReason ? _self.managerRejectionReason : managerRejectionReason // ignore: cast_nullable_to_non_nullable
as String?,securityReviewedBy: freezed == securityReviewedBy ? _self.securityReviewedBy : securityReviewedBy // ignore: cast_nullable_to_non_nullable
as String?,securityReviewedAt: freezed == securityReviewedAt ? _self.securityReviewedAt : securityReviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,securityRejectionReason: freezed == securityRejectionReason ? _self.securityRejectionReason : securityRejectionReason // ignore: cast_nullable_to_non_nullable
as String?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,leaseNumber: freezed == leaseNumber ? _self.leaseNumber : leaseNumber // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,leaseStatus: freezed == leaseStatus ? _self.leaseStatus : leaseStatus // ignore: cast_nullable_to_non_nullable
as String?,unitId: freezed == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String?,unitName: freezed == unitName ? _self.unitName : unitName // ignore: cast_nullable_to_non_nullable
as String?,residentId: freezed == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String?,residentName: freezed == residentName ? _self.residentName : residentName // ignore: cast_nullable_to_non_nullable
as String?,requestedByName: freezed == requestedByName ? _self.requestedByName : requestedByName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SecurityLeaseMovement].
extension SecurityLeaseMovementPatterns on SecurityLeaseMovement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SecurityLeaseMovement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SecurityLeaseMovement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SecurityLeaseMovement value)  $default,){
final _that = this;
switch (_that) {
case _SecurityLeaseMovement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SecurityLeaseMovement value)?  $default,){
final _that = this;
switch (_that) {
case _SecurityLeaseMovement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'org_id')  String? orgId, @JsonKey(name: 'movement_id')  String movementId, @JsonKey(name: 'lease_id')  String? leaseId, @JsonKey(name: 'movement_type')  String? movementType,  String status, @JsonKey(name: 'requested_by')  String? requestedBy, @JsonKey(name: 'requested_at')  DateTime? requestedAt, @JsonKey(name: 'manager_reviewed_by')  String? managerReviewedBy, @JsonKey(name: 'manager_reviewed_at')  DateTime? managerReviewedAt, @JsonKey(name: 'manager_rejection_reason')  String? managerRejectionReason, @JsonKey(name: 'security_reviewed_by')  String? securityReviewedBy, @JsonKey(name: 'security_reviewed_at')  DateTime? securityReviewedAt, @JsonKey(name: 'security_rejection_reason')  String? securityRejectionReason, @JsonKey(name: 'completed_at')  DateTime? completedAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'lease_number')  String? leaseNumber, @JsonKey(name: 'start_date')  DateTime? startDate, @JsonKey(name: 'end_date')  DateTime? endDate, @JsonKey(name: 'lease_status')  String? leaseStatus, @JsonKey(name: 'unit_id')  String? unitId, @JsonKey(name: 'unit_name')  String? unitName, @JsonKey(name: 'resident_id')  String? residentId, @JsonKey(name: 'resident_name')  String? residentName, @JsonKey(name: 'requested_by_name')  String? requestedByName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SecurityLeaseMovement() when $default != null:
return $default(_that.orgId,_that.movementId,_that.leaseId,_that.movementType,_that.status,_that.requestedBy,_that.requestedAt,_that.managerReviewedBy,_that.managerReviewedAt,_that.managerRejectionReason,_that.securityReviewedBy,_that.securityReviewedAt,_that.securityRejectionReason,_that.completedAt,_that.createdAt,_that.updatedAt,_that.leaseNumber,_that.startDate,_that.endDate,_that.leaseStatus,_that.unitId,_that.unitName,_that.residentId,_that.residentName,_that.requestedByName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'org_id')  String? orgId, @JsonKey(name: 'movement_id')  String movementId, @JsonKey(name: 'lease_id')  String? leaseId, @JsonKey(name: 'movement_type')  String? movementType,  String status, @JsonKey(name: 'requested_by')  String? requestedBy, @JsonKey(name: 'requested_at')  DateTime? requestedAt, @JsonKey(name: 'manager_reviewed_by')  String? managerReviewedBy, @JsonKey(name: 'manager_reviewed_at')  DateTime? managerReviewedAt, @JsonKey(name: 'manager_rejection_reason')  String? managerRejectionReason, @JsonKey(name: 'security_reviewed_by')  String? securityReviewedBy, @JsonKey(name: 'security_reviewed_at')  DateTime? securityReviewedAt, @JsonKey(name: 'security_rejection_reason')  String? securityRejectionReason, @JsonKey(name: 'completed_at')  DateTime? completedAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'lease_number')  String? leaseNumber, @JsonKey(name: 'start_date')  DateTime? startDate, @JsonKey(name: 'end_date')  DateTime? endDate, @JsonKey(name: 'lease_status')  String? leaseStatus, @JsonKey(name: 'unit_id')  String? unitId, @JsonKey(name: 'unit_name')  String? unitName, @JsonKey(name: 'resident_id')  String? residentId, @JsonKey(name: 'resident_name')  String? residentName, @JsonKey(name: 'requested_by_name')  String? requestedByName)  $default,) {final _that = this;
switch (_that) {
case _SecurityLeaseMovement():
return $default(_that.orgId,_that.movementId,_that.leaseId,_that.movementType,_that.status,_that.requestedBy,_that.requestedAt,_that.managerReviewedBy,_that.managerReviewedAt,_that.managerRejectionReason,_that.securityReviewedBy,_that.securityReviewedAt,_that.securityRejectionReason,_that.completedAt,_that.createdAt,_that.updatedAt,_that.leaseNumber,_that.startDate,_that.endDate,_that.leaseStatus,_that.unitId,_that.unitName,_that.residentId,_that.residentName,_that.requestedByName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'org_id')  String? orgId, @JsonKey(name: 'movement_id')  String movementId, @JsonKey(name: 'lease_id')  String? leaseId, @JsonKey(name: 'movement_type')  String? movementType,  String status, @JsonKey(name: 'requested_by')  String? requestedBy, @JsonKey(name: 'requested_at')  DateTime? requestedAt, @JsonKey(name: 'manager_reviewed_by')  String? managerReviewedBy, @JsonKey(name: 'manager_reviewed_at')  DateTime? managerReviewedAt, @JsonKey(name: 'manager_rejection_reason')  String? managerRejectionReason, @JsonKey(name: 'security_reviewed_by')  String? securityReviewedBy, @JsonKey(name: 'security_reviewed_at')  DateTime? securityReviewedAt, @JsonKey(name: 'security_rejection_reason')  String? securityRejectionReason, @JsonKey(name: 'completed_at')  DateTime? completedAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'lease_number')  String? leaseNumber, @JsonKey(name: 'start_date')  DateTime? startDate, @JsonKey(name: 'end_date')  DateTime? endDate, @JsonKey(name: 'lease_status')  String? leaseStatus, @JsonKey(name: 'unit_id')  String? unitId, @JsonKey(name: 'unit_name')  String? unitName, @JsonKey(name: 'resident_id')  String? residentId, @JsonKey(name: 'resident_name')  String? residentName, @JsonKey(name: 'requested_by_name')  String? requestedByName)?  $default,) {final _that = this;
switch (_that) {
case _SecurityLeaseMovement() when $default != null:
return $default(_that.orgId,_that.movementId,_that.leaseId,_that.movementType,_that.status,_that.requestedBy,_that.requestedAt,_that.managerReviewedBy,_that.managerReviewedAt,_that.managerRejectionReason,_that.securityReviewedBy,_that.securityReviewedAt,_that.securityRejectionReason,_that.completedAt,_that.createdAt,_that.updatedAt,_that.leaseNumber,_that.startDate,_that.endDate,_that.leaseStatus,_that.unitId,_that.unitName,_that.residentId,_that.residentName,_that.requestedByName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SecurityLeaseMovement implements SecurityLeaseMovement {
  const _SecurityLeaseMovement({@JsonKey(name: 'org_id') this.orgId, @JsonKey(name: 'movement_id') required this.movementId, @JsonKey(name: 'lease_id') this.leaseId, @JsonKey(name: 'movement_type') this.movementType, this.status = 'pending_security', @JsonKey(name: 'requested_by') this.requestedBy, @JsonKey(name: 'requested_at') this.requestedAt, @JsonKey(name: 'manager_reviewed_by') this.managerReviewedBy, @JsonKey(name: 'manager_reviewed_at') this.managerReviewedAt, @JsonKey(name: 'manager_rejection_reason') this.managerRejectionReason, @JsonKey(name: 'security_reviewed_by') this.securityReviewedBy, @JsonKey(name: 'security_reviewed_at') this.securityReviewedAt, @JsonKey(name: 'security_rejection_reason') this.securityRejectionReason, @JsonKey(name: 'completed_at') this.completedAt, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'lease_number') this.leaseNumber, @JsonKey(name: 'start_date') this.startDate, @JsonKey(name: 'end_date') this.endDate, @JsonKey(name: 'lease_status') this.leaseStatus, @JsonKey(name: 'unit_id') this.unitId, @JsonKey(name: 'unit_name') this.unitName, @JsonKey(name: 'resident_id') this.residentId, @JsonKey(name: 'resident_name') this.residentName, @JsonKey(name: 'requested_by_name') this.requestedByName});
  factory _SecurityLeaseMovement.fromJson(Map<String, dynamic> json) => _$SecurityLeaseMovementFromJson(json);

@override@JsonKey(name: 'org_id') final  String? orgId;
@override@JsonKey(name: 'movement_id') final  String movementId;
@override@JsonKey(name: 'lease_id') final  String? leaseId;
@override@JsonKey(name: 'movement_type') final  String? movementType;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'requested_by') final  String? requestedBy;
@override@JsonKey(name: 'requested_at') final  DateTime? requestedAt;
@override@JsonKey(name: 'manager_reviewed_by') final  String? managerReviewedBy;
@override@JsonKey(name: 'manager_reviewed_at') final  DateTime? managerReviewedAt;
@override@JsonKey(name: 'manager_rejection_reason') final  String? managerRejectionReason;
@override@JsonKey(name: 'security_reviewed_by') final  String? securityReviewedBy;
@override@JsonKey(name: 'security_reviewed_at') final  DateTime? securityReviewedAt;
@override@JsonKey(name: 'security_rejection_reason') final  String? securityRejectionReason;
@override@JsonKey(name: 'completed_at') final  DateTime? completedAt;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override@JsonKey(name: 'lease_number') final  String? leaseNumber;
@override@JsonKey(name: 'start_date') final  DateTime? startDate;
@override@JsonKey(name: 'end_date') final  DateTime? endDate;
@override@JsonKey(name: 'lease_status') final  String? leaseStatus;
@override@JsonKey(name: 'unit_id') final  String? unitId;
@override@JsonKey(name: 'unit_name') final  String? unitName;
@override@JsonKey(name: 'resident_id') final  String? residentId;
@override@JsonKey(name: 'resident_name') final  String? residentName;
@override@JsonKey(name: 'requested_by_name') final  String? requestedByName;

/// Create a copy of SecurityLeaseMovement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SecurityLeaseMovementCopyWith<_SecurityLeaseMovement> get copyWith => __$SecurityLeaseMovementCopyWithImpl<_SecurityLeaseMovement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SecurityLeaseMovementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SecurityLeaseMovement&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.movementId, movementId) || other.movementId == movementId)&&(identical(other.leaseId, leaseId) || other.leaseId == leaseId)&&(identical(other.movementType, movementType) || other.movementType == movementType)&&(identical(other.status, status) || other.status == status)&&(identical(other.requestedBy, requestedBy) || other.requestedBy == requestedBy)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.managerReviewedBy, managerReviewedBy) || other.managerReviewedBy == managerReviewedBy)&&(identical(other.managerReviewedAt, managerReviewedAt) || other.managerReviewedAt == managerReviewedAt)&&(identical(other.managerRejectionReason, managerRejectionReason) || other.managerRejectionReason == managerRejectionReason)&&(identical(other.securityReviewedBy, securityReviewedBy) || other.securityReviewedBy == securityReviewedBy)&&(identical(other.securityReviewedAt, securityReviewedAt) || other.securityReviewedAt == securityReviewedAt)&&(identical(other.securityRejectionReason, securityRejectionReason) || other.securityRejectionReason == securityRejectionReason)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.leaseNumber, leaseNumber) || other.leaseNumber == leaseNumber)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.leaseStatus, leaseStatus) || other.leaseStatus == leaseStatus)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.unitName, unitName) || other.unitName == unitName)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.residentName, residentName) || other.residentName == residentName)&&(identical(other.requestedByName, requestedByName) || other.requestedByName == requestedByName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,orgId,movementId,leaseId,movementType,status,requestedBy,requestedAt,managerReviewedBy,managerReviewedAt,managerRejectionReason,securityReviewedBy,securityReviewedAt,securityRejectionReason,completedAt,createdAt,updatedAt,leaseNumber,startDate,endDate,leaseStatus,unitId,unitName,residentId,residentName,requestedByName]);

@override
String toString() {
  return 'SecurityLeaseMovement(orgId: $orgId, movementId: $movementId, leaseId: $leaseId, movementType: $movementType, status: $status, requestedBy: $requestedBy, requestedAt: $requestedAt, managerReviewedBy: $managerReviewedBy, managerReviewedAt: $managerReviewedAt, managerRejectionReason: $managerRejectionReason, securityReviewedBy: $securityReviewedBy, securityReviewedAt: $securityReviewedAt, securityRejectionReason: $securityRejectionReason, completedAt: $completedAt, createdAt: $createdAt, updatedAt: $updatedAt, leaseNumber: $leaseNumber, startDate: $startDate, endDate: $endDate, leaseStatus: $leaseStatus, unitId: $unitId, unitName: $unitName, residentId: $residentId, residentName: $residentName, requestedByName: $requestedByName)';
}


}

/// @nodoc
abstract mixin class _$SecurityLeaseMovementCopyWith<$Res> implements $SecurityLeaseMovementCopyWith<$Res> {
  factory _$SecurityLeaseMovementCopyWith(_SecurityLeaseMovement value, $Res Function(_SecurityLeaseMovement) _then) = __$SecurityLeaseMovementCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'org_id') String? orgId,@JsonKey(name: 'movement_id') String movementId,@JsonKey(name: 'lease_id') String? leaseId,@JsonKey(name: 'movement_type') String? movementType, String status,@JsonKey(name: 'requested_by') String? requestedBy,@JsonKey(name: 'requested_at') DateTime? requestedAt,@JsonKey(name: 'manager_reviewed_by') String? managerReviewedBy,@JsonKey(name: 'manager_reviewed_at') DateTime? managerReviewedAt,@JsonKey(name: 'manager_rejection_reason') String? managerRejectionReason,@JsonKey(name: 'security_reviewed_by') String? securityReviewedBy,@JsonKey(name: 'security_reviewed_at') DateTime? securityReviewedAt,@JsonKey(name: 'security_rejection_reason') String? securityRejectionReason,@JsonKey(name: 'completed_at') DateTime? completedAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'lease_number') String? leaseNumber,@JsonKey(name: 'start_date') DateTime? startDate,@JsonKey(name: 'end_date') DateTime? endDate,@JsonKey(name: 'lease_status') String? leaseStatus,@JsonKey(name: 'unit_id') String? unitId,@JsonKey(name: 'unit_name') String? unitName,@JsonKey(name: 'resident_id') String? residentId,@JsonKey(name: 'resident_name') String? residentName,@JsonKey(name: 'requested_by_name') String? requestedByName
});




}
/// @nodoc
class __$SecurityLeaseMovementCopyWithImpl<$Res>
    implements _$SecurityLeaseMovementCopyWith<$Res> {
  __$SecurityLeaseMovementCopyWithImpl(this._self, this._then);

  final _SecurityLeaseMovement _self;
  final $Res Function(_SecurityLeaseMovement) _then;

/// Create a copy of SecurityLeaseMovement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orgId = freezed,Object? movementId = null,Object? leaseId = freezed,Object? movementType = freezed,Object? status = null,Object? requestedBy = freezed,Object? requestedAt = freezed,Object? managerReviewedBy = freezed,Object? managerReviewedAt = freezed,Object? managerRejectionReason = freezed,Object? securityReviewedBy = freezed,Object? securityReviewedAt = freezed,Object? securityRejectionReason = freezed,Object? completedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? leaseNumber = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? leaseStatus = freezed,Object? unitId = freezed,Object? unitName = freezed,Object? residentId = freezed,Object? residentName = freezed,Object? requestedByName = freezed,}) {
  return _then(_SecurityLeaseMovement(
orgId: freezed == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String?,movementId: null == movementId ? _self.movementId : movementId // ignore: cast_nullable_to_non_nullable
as String,leaseId: freezed == leaseId ? _self.leaseId : leaseId // ignore: cast_nullable_to_non_nullable
as String?,movementType: freezed == movementType ? _self.movementType : movementType // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,requestedBy: freezed == requestedBy ? _self.requestedBy : requestedBy // ignore: cast_nullable_to_non_nullable
as String?,requestedAt: freezed == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,managerReviewedBy: freezed == managerReviewedBy ? _self.managerReviewedBy : managerReviewedBy // ignore: cast_nullable_to_non_nullable
as String?,managerReviewedAt: freezed == managerReviewedAt ? _self.managerReviewedAt : managerReviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,managerRejectionReason: freezed == managerRejectionReason ? _self.managerRejectionReason : managerRejectionReason // ignore: cast_nullable_to_non_nullable
as String?,securityReviewedBy: freezed == securityReviewedBy ? _self.securityReviewedBy : securityReviewedBy // ignore: cast_nullable_to_non_nullable
as String?,securityReviewedAt: freezed == securityReviewedAt ? _self.securityReviewedAt : securityReviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,securityRejectionReason: freezed == securityRejectionReason ? _self.securityRejectionReason : securityRejectionReason // ignore: cast_nullable_to_non_nullable
as String?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,leaseNumber: freezed == leaseNumber ? _self.leaseNumber : leaseNumber // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,leaseStatus: freezed == leaseStatus ? _self.leaseStatus : leaseStatus // ignore: cast_nullable_to_non_nullable
as String?,unitId: freezed == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String?,unitName: freezed == unitName ? _self.unitName : unitName // ignore: cast_nullable_to_non_nullable
as String?,residentId: freezed == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String?,residentName: freezed == residentName ? _self.residentName : residentName // ignore: cast_nullable_to_non_nullable
as String?,requestedByName: freezed == requestedByName ? _self.requestedByName : requestedByName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
