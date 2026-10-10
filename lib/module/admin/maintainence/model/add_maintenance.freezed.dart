// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_maintenance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddMaintenance {

@JsonKey(name: 'org_id') String get orgId;@JsonKey(name: 'unit_id') String get unitId;@JsonKey(name: 'created_by') String get createdBy;@JsonKey(name: 'resident_id') String? get residentId;@JsonKey(name: 'issue_title') String get issueTitle;@JsonKey(name: 'issue_type') String get issueType; String get description; MaintenancePriority get priority; MaintenanceStatus get status;
/// Create a copy of AddMaintenance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddMaintenanceCopyWith<AddMaintenance> get copyWith => _$AddMaintenanceCopyWithImpl<AddMaintenance>(this as AddMaintenance, _$identity);

  /// Serializes this AddMaintenance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddMaintenance&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.issueTitle, issueTitle) || other.issueTitle == issueTitle)&&(identical(other.issueType, issueType) || other.issueType == issueType)&&(identical(other.description, description) || other.description == description)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orgId,unitId,createdBy,residentId,issueTitle,issueType,description,priority,status);

@override
String toString() {
  return 'AddMaintenance(orgId: $orgId, unitId: $unitId, createdBy: $createdBy, residentId: $residentId, issueTitle: $issueTitle, issueType: $issueType, description: $description, priority: $priority, status: $status)';
}


}

/// @nodoc
abstract mixin class $AddMaintenanceCopyWith<$Res>  {
  factory $AddMaintenanceCopyWith(AddMaintenance value, $Res Function(AddMaintenance) _then) = _$AddMaintenanceCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'org_id') String orgId,@JsonKey(name: 'unit_id') String unitId,@JsonKey(name: 'created_by') String createdBy,@JsonKey(name: 'resident_id') String? residentId,@JsonKey(name: 'issue_title') String issueTitle,@JsonKey(name: 'issue_type') String issueType, String description, MaintenancePriority priority, MaintenanceStatus status
});




}
/// @nodoc
class _$AddMaintenanceCopyWithImpl<$Res>
    implements $AddMaintenanceCopyWith<$Res> {
  _$AddMaintenanceCopyWithImpl(this._self, this._then);

  final AddMaintenance _self;
  final $Res Function(AddMaintenance) _then;

/// Create a copy of AddMaintenance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orgId = null,Object? unitId = null,Object? createdBy = null,Object? residentId = freezed,Object? issueTitle = null,Object? issueType = null,Object? description = null,Object? priority = null,Object? status = null,}) {
  return _then(_self.copyWith(
orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,residentId: freezed == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String?,issueTitle: null == issueTitle ? _self.issueTitle : issueTitle // ignore: cast_nullable_to_non_nullable
as String,issueType: null == issueType ? _self.issueType : issueType // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as MaintenancePriority,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MaintenanceStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [AddMaintenance].
extension AddMaintenancePatterns on AddMaintenance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddMaintenance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddMaintenance() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddMaintenance value)  $default,){
final _that = this;
switch (_that) {
case _AddMaintenance():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddMaintenance value)?  $default,){
final _that = this;
switch (_that) {
case _AddMaintenance() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'org_id')  String orgId, @JsonKey(name: 'unit_id')  String unitId, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'resident_id')  String? residentId, @JsonKey(name: 'issue_title')  String issueTitle, @JsonKey(name: 'issue_type')  String issueType,  String description,  MaintenancePriority priority,  MaintenanceStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddMaintenance() when $default != null:
return $default(_that.orgId,_that.unitId,_that.createdBy,_that.residentId,_that.issueTitle,_that.issueType,_that.description,_that.priority,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'org_id')  String orgId, @JsonKey(name: 'unit_id')  String unitId, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'resident_id')  String? residentId, @JsonKey(name: 'issue_title')  String issueTitle, @JsonKey(name: 'issue_type')  String issueType,  String description,  MaintenancePriority priority,  MaintenanceStatus status)  $default,) {final _that = this;
switch (_that) {
case _AddMaintenance():
return $default(_that.orgId,_that.unitId,_that.createdBy,_that.residentId,_that.issueTitle,_that.issueType,_that.description,_that.priority,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'org_id')  String orgId, @JsonKey(name: 'unit_id')  String unitId, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'resident_id')  String? residentId, @JsonKey(name: 'issue_title')  String issueTitle, @JsonKey(name: 'issue_type')  String issueType,  String description,  MaintenancePriority priority,  MaintenanceStatus status)?  $default,) {final _that = this;
switch (_that) {
case _AddMaintenance() when $default != null:
return $default(_that.orgId,_that.unitId,_that.createdBy,_that.residentId,_that.issueTitle,_that.issueType,_that.description,_that.priority,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddMaintenance implements AddMaintenance {
  const _AddMaintenance({@JsonKey(name: 'org_id') required this.orgId, @JsonKey(name: 'unit_id') required this.unitId, @JsonKey(name: 'created_by') required this.createdBy, @JsonKey(name: 'resident_id') this.residentId, @JsonKey(name: 'issue_title') required this.issueTitle, @JsonKey(name: 'issue_type') required this.issueType, required this.description, this.priority = MaintenancePriority.medium, this.status = MaintenanceStatus.pendingReview});
  factory _AddMaintenance.fromJson(Map<String, dynamic> json) => _$AddMaintenanceFromJson(json);

@override@JsonKey(name: 'org_id') final  String orgId;
@override@JsonKey(name: 'unit_id') final  String unitId;
@override@JsonKey(name: 'created_by') final  String createdBy;
@override@JsonKey(name: 'resident_id') final  String? residentId;
@override@JsonKey(name: 'issue_title') final  String issueTitle;
@override@JsonKey(name: 'issue_type') final  String issueType;
@override final  String description;
@override@JsonKey() final  MaintenancePriority priority;
@override@JsonKey() final  MaintenanceStatus status;

/// Create a copy of AddMaintenance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddMaintenanceCopyWith<_AddMaintenance> get copyWith => __$AddMaintenanceCopyWithImpl<_AddMaintenance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddMaintenanceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddMaintenance&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.issueTitle, issueTitle) || other.issueTitle == issueTitle)&&(identical(other.issueType, issueType) || other.issueType == issueType)&&(identical(other.description, description) || other.description == description)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orgId,unitId,createdBy,residentId,issueTitle,issueType,description,priority,status);

@override
String toString() {
  return 'AddMaintenance(orgId: $orgId, unitId: $unitId, createdBy: $createdBy, residentId: $residentId, issueTitle: $issueTitle, issueType: $issueType, description: $description, priority: $priority, status: $status)';
}


}

/// @nodoc
abstract mixin class _$AddMaintenanceCopyWith<$Res> implements $AddMaintenanceCopyWith<$Res> {
  factory _$AddMaintenanceCopyWith(_AddMaintenance value, $Res Function(_AddMaintenance) _then) = __$AddMaintenanceCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'org_id') String orgId,@JsonKey(name: 'unit_id') String unitId,@JsonKey(name: 'created_by') String createdBy,@JsonKey(name: 'resident_id') String? residentId,@JsonKey(name: 'issue_title') String issueTitle,@JsonKey(name: 'issue_type') String issueType, String description, MaintenancePriority priority, MaintenanceStatus status
});




}
/// @nodoc
class __$AddMaintenanceCopyWithImpl<$Res>
    implements _$AddMaintenanceCopyWith<$Res> {
  __$AddMaintenanceCopyWithImpl(this._self, this._then);

  final _AddMaintenance _self;
  final $Res Function(_AddMaintenance) _then;

/// Create a copy of AddMaintenance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orgId = null,Object? unitId = null,Object? createdBy = null,Object? residentId = freezed,Object? issueTitle = null,Object? issueType = null,Object? description = null,Object? priority = null,Object? status = null,}) {
  return _then(_AddMaintenance(
orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,residentId: freezed == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String?,issueTitle: null == issueTitle ? _self.issueTitle : issueTitle // ignore: cast_nullable_to_non_nullable
as String,issueType: null == issueType ? _self.issueType : issueType // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as MaintenancePriority,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MaintenanceStatus,
  ));
}


}

// dart format on
