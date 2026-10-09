// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lease_movement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaseMovement {

 String get id;@JsonKey(name: 'lease_id') String get leaseId;@JsonKey(name: 'movement_type') LeaseMovementType get movementType; LeaseMovementStatus get status;@JsonKey(name: 'requested_by') String get requestedBy;@JsonKey(name: 'requested_at') DateTime get requestedAt;@JsonKey(name: 'manager_reviewed_by') String? get managerReviewedBy;@JsonKey(name: 'manager_reviewed_at') DateTime? get managerReviewedAt;@JsonKey(name: 'manager_rejection_reason') String? get managerRejectionReason;@JsonKey(name: 'security_reviewed_by') String? get securityReviewedBy;@JsonKey(name: 'security_reviewed_at') DateTime? get securityReviewedAt;@JsonKey(name: 'security_rejection_reason') String? get securityRejectionReason;@JsonKey(name: 'completed_at') DateTime? get completedAt;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of LeaseMovement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaseMovementCopyWith<LeaseMovement> get copyWith => _$LeaseMovementCopyWithImpl<LeaseMovement>(this as LeaseMovement, _$identity);

  /// Serializes this LeaseMovement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaseMovement&&(identical(other.id, id) || other.id == id)&&(identical(other.leaseId, leaseId) || other.leaseId == leaseId)&&(identical(other.movementType, movementType) || other.movementType == movementType)&&(identical(other.status, status) || other.status == status)&&(identical(other.requestedBy, requestedBy) || other.requestedBy == requestedBy)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.managerReviewedBy, managerReviewedBy) || other.managerReviewedBy == managerReviewedBy)&&(identical(other.managerReviewedAt, managerReviewedAt) || other.managerReviewedAt == managerReviewedAt)&&(identical(other.managerRejectionReason, managerRejectionReason) || other.managerRejectionReason == managerRejectionReason)&&(identical(other.securityReviewedBy, securityReviewedBy) || other.securityReviewedBy == securityReviewedBy)&&(identical(other.securityReviewedAt, securityReviewedAt) || other.securityReviewedAt == securityReviewedAt)&&(identical(other.securityRejectionReason, securityRejectionReason) || other.securityRejectionReason == securityRejectionReason)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,leaseId,movementType,status,requestedBy,requestedAt,managerReviewedBy,managerReviewedAt,managerRejectionReason,securityReviewedBy,securityReviewedAt,securityRejectionReason,completedAt,createdAt,updatedAt);

@override
String toString() {
  return 'LeaseMovement(id: $id, leaseId: $leaseId, movementType: $movementType, status: $status, requestedBy: $requestedBy, requestedAt: $requestedAt, managerReviewedBy: $managerReviewedBy, managerReviewedAt: $managerReviewedAt, managerRejectionReason: $managerRejectionReason, securityReviewedBy: $securityReviewedBy, securityReviewedAt: $securityReviewedAt, securityRejectionReason: $securityRejectionReason, completedAt: $completedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $LeaseMovementCopyWith<$Res>  {
  factory $LeaseMovementCopyWith(LeaseMovement value, $Res Function(LeaseMovement) _then) = _$LeaseMovementCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'lease_id') String leaseId,@JsonKey(name: 'movement_type') LeaseMovementType movementType, LeaseMovementStatus status,@JsonKey(name: 'requested_by') String requestedBy,@JsonKey(name: 'requested_at') DateTime requestedAt,@JsonKey(name: 'manager_reviewed_by') String? managerReviewedBy,@JsonKey(name: 'manager_reviewed_at') DateTime? managerReviewedAt,@JsonKey(name: 'manager_rejection_reason') String? managerRejectionReason,@JsonKey(name: 'security_reviewed_by') String? securityReviewedBy,@JsonKey(name: 'security_reviewed_at') DateTime? securityReviewedAt,@JsonKey(name: 'security_rejection_reason') String? securityRejectionReason,@JsonKey(name: 'completed_at') DateTime? completedAt,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$LeaseMovementCopyWithImpl<$Res>
    implements $LeaseMovementCopyWith<$Res> {
  _$LeaseMovementCopyWithImpl(this._self, this._then);

  final LeaseMovement _self;
  final $Res Function(LeaseMovement) _then;

/// Create a copy of LeaseMovement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? leaseId = null,Object? movementType = null,Object? status = null,Object? requestedBy = null,Object? requestedAt = null,Object? managerReviewedBy = freezed,Object? managerReviewedAt = freezed,Object? managerRejectionReason = freezed,Object? securityReviewedBy = freezed,Object? securityReviewedAt = freezed,Object? securityRejectionReason = freezed,Object? completedAt = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,leaseId: null == leaseId ? _self.leaseId : leaseId // ignore: cast_nullable_to_non_nullable
as String,movementType: null == movementType ? _self.movementType : movementType // ignore: cast_nullable_to_non_nullable
as LeaseMovementType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LeaseMovementStatus,requestedBy: null == requestedBy ? _self.requestedBy : requestedBy // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,managerReviewedBy: freezed == managerReviewedBy ? _self.managerReviewedBy : managerReviewedBy // ignore: cast_nullable_to_non_nullable
as String?,managerReviewedAt: freezed == managerReviewedAt ? _self.managerReviewedAt : managerReviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,managerRejectionReason: freezed == managerRejectionReason ? _self.managerRejectionReason : managerRejectionReason // ignore: cast_nullable_to_non_nullable
as String?,securityReviewedBy: freezed == securityReviewedBy ? _self.securityReviewedBy : securityReviewedBy // ignore: cast_nullable_to_non_nullable
as String?,securityReviewedAt: freezed == securityReviewedAt ? _self.securityReviewedAt : securityReviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,securityRejectionReason: freezed == securityRejectionReason ? _self.securityRejectionReason : securityRejectionReason // ignore: cast_nullable_to_non_nullable
as String?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaseMovement].
extension LeaseMovementPatterns on LeaseMovement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaseMovement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaseMovement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaseMovement value)  $default,){
final _that = this;
switch (_that) {
case _LeaseMovement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaseMovement value)?  $default,){
final _that = this;
switch (_that) {
case _LeaseMovement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'lease_id')  String leaseId, @JsonKey(name: 'movement_type')  LeaseMovementType movementType,  LeaseMovementStatus status, @JsonKey(name: 'requested_by')  String requestedBy, @JsonKey(name: 'requested_at')  DateTime requestedAt, @JsonKey(name: 'manager_reviewed_by')  String? managerReviewedBy, @JsonKey(name: 'manager_reviewed_at')  DateTime? managerReviewedAt, @JsonKey(name: 'manager_rejection_reason')  String? managerRejectionReason, @JsonKey(name: 'security_reviewed_by')  String? securityReviewedBy, @JsonKey(name: 'security_reviewed_at')  DateTime? securityReviewedAt, @JsonKey(name: 'security_rejection_reason')  String? securityRejectionReason, @JsonKey(name: 'completed_at')  DateTime? completedAt, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaseMovement() when $default != null:
return $default(_that.id,_that.leaseId,_that.movementType,_that.status,_that.requestedBy,_that.requestedAt,_that.managerReviewedBy,_that.managerReviewedAt,_that.managerRejectionReason,_that.securityReviewedBy,_that.securityReviewedAt,_that.securityRejectionReason,_that.completedAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'lease_id')  String leaseId, @JsonKey(name: 'movement_type')  LeaseMovementType movementType,  LeaseMovementStatus status, @JsonKey(name: 'requested_by')  String requestedBy, @JsonKey(name: 'requested_at')  DateTime requestedAt, @JsonKey(name: 'manager_reviewed_by')  String? managerReviewedBy, @JsonKey(name: 'manager_reviewed_at')  DateTime? managerReviewedAt, @JsonKey(name: 'manager_rejection_reason')  String? managerRejectionReason, @JsonKey(name: 'security_reviewed_by')  String? securityReviewedBy, @JsonKey(name: 'security_reviewed_at')  DateTime? securityReviewedAt, @JsonKey(name: 'security_rejection_reason')  String? securityRejectionReason, @JsonKey(name: 'completed_at')  DateTime? completedAt, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _LeaseMovement():
return $default(_that.id,_that.leaseId,_that.movementType,_that.status,_that.requestedBy,_that.requestedAt,_that.managerReviewedBy,_that.managerReviewedAt,_that.managerRejectionReason,_that.securityReviewedBy,_that.securityReviewedAt,_that.securityRejectionReason,_that.completedAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'lease_id')  String leaseId, @JsonKey(name: 'movement_type')  LeaseMovementType movementType,  LeaseMovementStatus status, @JsonKey(name: 'requested_by')  String requestedBy, @JsonKey(name: 'requested_at')  DateTime requestedAt, @JsonKey(name: 'manager_reviewed_by')  String? managerReviewedBy, @JsonKey(name: 'manager_reviewed_at')  DateTime? managerReviewedAt, @JsonKey(name: 'manager_rejection_reason')  String? managerRejectionReason, @JsonKey(name: 'security_reviewed_by')  String? securityReviewedBy, @JsonKey(name: 'security_reviewed_at')  DateTime? securityReviewedAt, @JsonKey(name: 'security_rejection_reason')  String? securityRejectionReason, @JsonKey(name: 'completed_at')  DateTime? completedAt, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _LeaseMovement() when $default != null:
return $default(_that.id,_that.leaseId,_that.movementType,_that.status,_that.requestedBy,_that.requestedAt,_that.managerReviewedBy,_that.managerReviewedAt,_that.managerRejectionReason,_that.securityReviewedBy,_that.securityReviewedAt,_that.securityRejectionReason,_that.completedAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeaseMovement implements LeaseMovement {
  const _LeaseMovement({required this.id, @JsonKey(name: 'lease_id') required this.leaseId, @JsonKey(name: 'movement_type') required this.movementType, this.status = LeaseMovementStatus.pendingManager, @JsonKey(name: 'requested_by') required this.requestedBy, @JsonKey(name: 'requested_at') required this.requestedAt, @JsonKey(name: 'manager_reviewed_by') this.managerReviewedBy, @JsonKey(name: 'manager_reviewed_at') this.managerReviewedAt, @JsonKey(name: 'manager_rejection_reason') this.managerRejectionReason, @JsonKey(name: 'security_reviewed_by') this.securityReviewedBy, @JsonKey(name: 'security_reviewed_at') this.securityReviewedAt, @JsonKey(name: 'security_rejection_reason') this.securityRejectionReason, @JsonKey(name: 'completed_at') this.completedAt, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _LeaseMovement.fromJson(Map<String, dynamic> json) => _$LeaseMovementFromJson(json);

@override final  String id;
@override@JsonKey(name: 'lease_id') final  String leaseId;
@override@JsonKey(name: 'movement_type') final  LeaseMovementType movementType;
@override@JsonKey() final  LeaseMovementStatus status;
@override@JsonKey(name: 'requested_by') final  String requestedBy;
@override@JsonKey(name: 'requested_at') final  DateTime requestedAt;
@override@JsonKey(name: 'manager_reviewed_by') final  String? managerReviewedBy;
@override@JsonKey(name: 'manager_reviewed_at') final  DateTime? managerReviewedAt;
@override@JsonKey(name: 'manager_rejection_reason') final  String? managerRejectionReason;
@override@JsonKey(name: 'security_reviewed_by') final  String? securityReviewedBy;
@override@JsonKey(name: 'security_reviewed_at') final  DateTime? securityReviewedAt;
@override@JsonKey(name: 'security_rejection_reason') final  String? securityRejectionReason;
@override@JsonKey(name: 'completed_at') final  DateTime? completedAt;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of LeaseMovement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaseMovementCopyWith<_LeaseMovement> get copyWith => __$LeaseMovementCopyWithImpl<_LeaseMovement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaseMovementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaseMovement&&(identical(other.id, id) || other.id == id)&&(identical(other.leaseId, leaseId) || other.leaseId == leaseId)&&(identical(other.movementType, movementType) || other.movementType == movementType)&&(identical(other.status, status) || other.status == status)&&(identical(other.requestedBy, requestedBy) || other.requestedBy == requestedBy)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.managerReviewedBy, managerReviewedBy) || other.managerReviewedBy == managerReviewedBy)&&(identical(other.managerReviewedAt, managerReviewedAt) || other.managerReviewedAt == managerReviewedAt)&&(identical(other.managerRejectionReason, managerRejectionReason) || other.managerRejectionReason == managerRejectionReason)&&(identical(other.securityReviewedBy, securityReviewedBy) || other.securityReviewedBy == securityReviewedBy)&&(identical(other.securityReviewedAt, securityReviewedAt) || other.securityReviewedAt == securityReviewedAt)&&(identical(other.securityRejectionReason, securityRejectionReason) || other.securityRejectionReason == securityRejectionReason)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,leaseId,movementType,status,requestedBy,requestedAt,managerReviewedBy,managerReviewedAt,managerRejectionReason,securityReviewedBy,securityReviewedAt,securityRejectionReason,completedAt,createdAt,updatedAt);

@override
String toString() {
  return 'LeaseMovement(id: $id, leaseId: $leaseId, movementType: $movementType, status: $status, requestedBy: $requestedBy, requestedAt: $requestedAt, managerReviewedBy: $managerReviewedBy, managerReviewedAt: $managerReviewedAt, managerRejectionReason: $managerRejectionReason, securityReviewedBy: $securityReviewedBy, securityReviewedAt: $securityReviewedAt, securityRejectionReason: $securityRejectionReason, completedAt: $completedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$LeaseMovementCopyWith<$Res> implements $LeaseMovementCopyWith<$Res> {
  factory _$LeaseMovementCopyWith(_LeaseMovement value, $Res Function(_LeaseMovement) _then) = __$LeaseMovementCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'lease_id') String leaseId,@JsonKey(name: 'movement_type') LeaseMovementType movementType, LeaseMovementStatus status,@JsonKey(name: 'requested_by') String requestedBy,@JsonKey(name: 'requested_at') DateTime requestedAt,@JsonKey(name: 'manager_reviewed_by') String? managerReviewedBy,@JsonKey(name: 'manager_reviewed_at') DateTime? managerReviewedAt,@JsonKey(name: 'manager_rejection_reason') String? managerRejectionReason,@JsonKey(name: 'security_reviewed_by') String? securityReviewedBy,@JsonKey(name: 'security_reviewed_at') DateTime? securityReviewedAt,@JsonKey(name: 'security_rejection_reason') String? securityRejectionReason,@JsonKey(name: 'completed_at') DateTime? completedAt,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$LeaseMovementCopyWithImpl<$Res>
    implements _$LeaseMovementCopyWith<$Res> {
  __$LeaseMovementCopyWithImpl(this._self, this._then);

  final _LeaseMovement _self;
  final $Res Function(_LeaseMovement) _then;

/// Create a copy of LeaseMovement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? leaseId = null,Object? movementType = null,Object? status = null,Object? requestedBy = null,Object? requestedAt = null,Object? managerReviewedBy = freezed,Object? managerReviewedAt = freezed,Object? managerRejectionReason = freezed,Object? securityReviewedBy = freezed,Object? securityReviewedAt = freezed,Object? securityRejectionReason = freezed,Object? completedAt = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_LeaseMovement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,leaseId: null == leaseId ? _self.leaseId : leaseId // ignore: cast_nullable_to_non_nullable
as String,movementType: null == movementType ? _self.movementType : movementType // ignore: cast_nullable_to_non_nullable
as LeaseMovementType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LeaseMovementStatus,requestedBy: null == requestedBy ? _self.requestedBy : requestedBy // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,managerReviewedBy: freezed == managerReviewedBy ? _self.managerReviewedBy : managerReviewedBy // ignore: cast_nullable_to_non_nullable
as String?,managerReviewedAt: freezed == managerReviewedAt ? _self.managerReviewedAt : managerReviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,managerRejectionReason: freezed == managerRejectionReason ? _self.managerRejectionReason : managerRejectionReason // ignore: cast_nullable_to_non_nullable
as String?,securityReviewedBy: freezed == securityReviewedBy ? _self.securityReviewedBy : securityReviewedBy // ignore: cast_nullable_to_non_nullable
as String?,securityReviewedAt: freezed == securityReviewedAt ? _self.securityReviewedAt : securityReviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,securityRejectionReason: freezed == securityRejectionReason ? _self.securityRejectionReason : securityRejectionReason // ignore: cast_nullable_to_non_nullable
as String?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
