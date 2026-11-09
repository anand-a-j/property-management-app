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

 String? get id;@JsonKey(name: 'org_id') String? get orgId;@JsonKey(name: 'unit_id') String? get unitId;@JsonKey(name: 'created_by') String? get createdBy;@JsonKey(name: 'resident_id') String? get residentId;@JsonKey(name: 'issue_title') String? get issueTitle;@JsonKey(name: 'issue_type') String? get issueType;@JsonKey(name: 'ticket_number') String? get ticketNumber; String? get description; MaintenancePriority? get priority; MaintenanceStatus? get status;@JsonKey(name: 'unit_name') String? get unitName;@JsonKey(name: 'community_id') String? get communityId;@JsonKey(name: 'community_name') String? get communityName;
/// Create a copy of AddMaintenance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddMaintenanceCopyWith<AddMaintenance> get copyWith => _$AddMaintenanceCopyWithImpl<AddMaintenance>(this as AddMaintenance, _$identity);

  /// Serializes this AddMaintenance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddMaintenance&&(identical(other.id, id) || other.id == id)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.issueTitle, issueTitle) || other.issueTitle == issueTitle)&&(identical(other.issueType, issueType) || other.issueType == issueType)&&(identical(other.ticketNumber, ticketNumber) || other.ticketNumber == ticketNumber)&&(identical(other.description, description) || other.description == description)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.status, status) || other.status == status)&&(identical(other.unitName, unitName) || other.unitName == unitName)&&(identical(other.communityId, communityId) || other.communityId == communityId)&&(identical(other.communityName, communityName) || other.communityName == communityName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orgId,unitId,createdBy,residentId,issueTitle,issueType,ticketNumber,description,priority,status,unitName,communityId,communityName);

@override
String toString() {
  return 'AddMaintenance(id: $id, orgId: $orgId, unitId: $unitId, createdBy: $createdBy, residentId: $residentId, issueTitle: $issueTitle, issueType: $issueType, ticketNumber: $ticketNumber, description: $description, priority: $priority, status: $status, unitName: $unitName, communityId: $communityId, communityName: $communityName)';
}


}

/// @nodoc
abstract mixin class $AddMaintenanceCopyWith<$Res>  {
  factory $AddMaintenanceCopyWith(AddMaintenance value, $Res Function(AddMaintenance) _then) = _$AddMaintenanceCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'org_id') String? orgId,@JsonKey(name: 'unit_id') String? unitId,@JsonKey(name: 'created_by') String? createdBy,@JsonKey(name: 'resident_id') String? residentId,@JsonKey(name: 'issue_title') String? issueTitle,@JsonKey(name: 'issue_type') String? issueType,@JsonKey(name: 'ticket_number') String? ticketNumber, String? description, MaintenancePriority? priority, MaintenanceStatus? status,@JsonKey(name: 'unit_name') String? unitName,@JsonKey(name: 'community_id') String? communityId,@JsonKey(name: 'community_name') String? communityName
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? orgId = freezed,Object? unitId = freezed,Object? createdBy = freezed,Object? residentId = freezed,Object? issueTitle = freezed,Object? issueType = freezed,Object? ticketNumber = freezed,Object? description = freezed,Object? priority = freezed,Object? status = freezed,Object? unitName = freezed,Object? communityId = freezed,Object? communityName = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,orgId: freezed == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String?,unitId: freezed == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,residentId: freezed == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String?,issueTitle: freezed == issueTitle ? _self.issueTitle : issueTitle // ignore: cast_nullable_to_non_nullable
as String?,issueType: freezed == issueType ? _self.issueType : issueType // ignore: cast_nullable_to_non_nullable
as String?,ticketNumber: freezed == ticketNumber ? _self.ticketNumber : ticketNumber // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,priority: freezed == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as MaintenancePriority?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MaintenanceStatus?,unitName: freezed == unitName ? _self.unitName : unitName // ignore: cast_nullable_to_non_nullable
as String?,communityId: freezed == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String?,communityName: freezed == communityName ? _self.communityName : communityName // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'org_id')  String? orgId, @JsonKey(name: 'unit_id')  String? unitId, @JsonKey(name: 'created_by')  String? createdBy, @JsonKey(name: 'resident_id')  String? residentId, @JsonKey(name: 'issue_title')  String? issueTitle, @JsonKey(name: 'issue_type')  String? issueType, @JsonKey(name: 'ticket_number')  String? ticketNumber,  String? description,  MaintenancePriority? priority,  MaintenanceStatus? status, @JsonKey(name: 'unit_name')  String? unitName, @JsonKey(name: 'community_id')  String? communityId, @JsonKey(name: 'community_name')  String? communityName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddMaintenance() when $default != null:
return $default(_that.id,_that.orgId,_that.unitId,_that.createdBy,_that.residentId,_that.issueTitle,_that.issueType,_that.ticketNumber,_that.description,_that.priority,_that.status,_that.unitName,_that.communityId,_that.communityName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'org_id')  String? orgId, @JsonKey(name: 'unit_id')  String? unitId, @JsonKey(name: 'created_by')  String? createdBy, @JsonKey(name: 'resident_id')  String? residentId, @JsonKey(name: 'issue_title')  String? issueTitle, @JsonKey(name: 'issue_type')  String? issueType, @JsonKey(name: 'ticket_number')  String? ticketNumber,  String? description,  MaintenancePriority? priority,  MaintenanceStatus? status, @JsonKey(name: 'unit_name')  String? unitName, @JsonKey(name: 'community_id')  String? communityId, @JsonKey(name: 'community_name')  String? communityName)  $default,) {final _that = this;
switch (_that) {
case _AddMaintenance():
return $default(_that.id,_that.orgId,_that.unitId,_that.createdBy,_that.residentId,_that.issueTitle,_that.issueType,_that.ticketNumber,_that.description,_that.priority,_that.status,_that.unitName,_that.communityId,_that.communityName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'org_id')  String? orgId, @JsonKey(name: 'unit_id')  String? unitId, @JsonKey(name: 'created_by')  String? createdBy, @JsonKey(name: 'resident_id')  String? residentId, @JsonKey(name: 'issue_title')  String? issueTitle, @JsonKey(name: 'issue_type')  String? issueType, @JsonKey(name: 'ticket_number')  String? ticketNumber,  String? description,  MaintenancePriority? priority,  MaintenanceStatus? status, @JsonKey(name: 'unit_name')  String? unitName, @JsonKey(name: 'community_id')  String? communityId, @JsonKey(name: 'community_name')  String? communityName)?  $default,) {final _that = this;
switch (_that) {
case _AddMaintenance() when $default != null:
return $default(_that.id,_that.orgId,_that.unitId,_that.createdBy,_that.residentId,_that.issueTitle,_that.issueType,_that.ticketNumber,_that.description,_that.priority,_that.status,_that.unitName,_that.communityId,_that.communityName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddMaintenance implements AddMaintenance {
  const _AddMaintenance({this.id, @JsonKey(name: 'org_id') this.orgId, @JsonKey(name: 'unit_id') this.unitId, @JsonKey(name: 'created_by') this.createdBy, @JsonKey(name: 'resident_id') this.residentId, @JsonKey(name: 'issue_title') this.issueTitle, @JsonKey(name: 'issue_type') this.issueType, @JsonKey(name: 'ticket_number') this.ticketNumber, this.description, this.priority, this.status, @JsonKey(name: 'unit_name') this.unitName, @JsonKey(name: 'community_id') this.communityId, @JsonKey(name: 'community_name') this.communityName});
  factory _AddMaintenance.fromJson(Map<String, dynamic> json) => _$AddMaintenanceFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'org_id') final  String? orgId;
@override@JsonKey(name: 'unit_id') final  String? unitId;
@override@JsonKey(name: 'created_by') final  String? createdBy;
@override@JsonKey(name: 'resident_id') final  String? residentId;
@override@JsonKey(name: 'issue_title') final  String? issueTitle;
@override@JsonKey(name: 'issue_type') final  String? issueType;
@override@JsonKey(name: 'ticket_number') final  String? ticketNumber;
@override final  String? description;
@override final  MaintenancePriority? priority;
@override final  MaintenanceStatus? status;
@override@JsonKey(name: 'unit_name') final  String? unitName;
@override@JsonKey(name: 'community_id') final  String? communityId;
@override@JsonKey(name: 'community_name') final  String? communityName;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddMaintenance&&(identical(other.id, id) || other.id == id)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.issueTitle, issueTitle) || other.issueTitle == issueTitle)&&(identical(other.issueType, issueType) || other.issueType == issueType)&&(identical(other.ticketNumber, ticketNumber) || other.ticketNumber == ticketNumber)&&(identical(other.description, description) || other.description == description)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.status, status) || other.status == status)&&(identical(other.unitName, unitName) || other.unitName == unitName)&&(identical(other.communityId, communityId) || other.communityId == communityId)&&(identical(other.communityName, communityName) || other.communityName == communityName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orgId,unitId,createdBy,residentId,issueTitle,issueType,ticketNumber,description,priority,status,unitName,communityId,communityName);

@override
String toString() {
  return 'AddMaintenance(id: $id, orgId: $orgId, unitId: $unitId, createdBy: $createdBy, residentId: $residentId, issueTitle: $issueTitle, issueType: $issueType, ticketNumber: $ticketNumber, description: $description, priority: $priority, status: $status, unitName: $unitName, communityId: $communityId, communityName: $communityName)';
}


}

/// @nodoc
abstract mixin class _$AddMaintenanceCopyWith<$Res> implements $AddMaintenanceCopyWith<$Res> {
  factory _$AddMaintenanceCopyWith(_AddMaintenance value, $Res Function(_AddMaintenance) _then) = __$AddMaintenanceCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'org_id') String? orgId,@JsonKey(name: 'unit_id') String? unitId,@JsonKey(name: 'created_by') String? createdBy,@JsonKey(name: 'resident_id') String? residentId,@JsonKey(name: 'issue_title') String? issueTitle,@JsonKey(name: 'issue_type') String? issueType,@JsonKey(name: 'ticket_number') String? ticketNumber, String? description, MaintenancePriority? priority, MaintenanceStatus? status,@JsonKey(name: 'unit_name') String? unitName,@JsonKey(name: 'community_id') String? communityId,@JsonKey(name: 'community_name') String? communityName
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? orgId = freezed,Object? unitId = freezed,Object? createdBy = freezed,Object? residentId = freezed,Object? issueTitle = freezed,Object? issueType = freezed,Object? ticketNumber = freezed,Object? description = freezed,Object? priority = freezed,Object? status = freezed,Object? unitName = freezed,Object? communityId = freezed,Object? communityName = freezed,}) {
  return _then(_AddMaintenance(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,orgId: freezed == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String?,unitId: freezed == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,residentId: freezed == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String?,issueTitle: freezed == issueTitle ? _self.issueTitle : issueTitle // ignore: cast_nullable_to_non_nullable
as String?,issueType: freezed == issueType ? _self.issueType : issueType // ignore: cast_nullable_to_non_nullable
as String?,ticketNumber: freezed == ticketNumber ? _self.ticketNumber : ticketNumber // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,priority: freezed == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as MaintenancePriority?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MaintenanceStatus?,unitName: freezed == unitName ? _self.unitName : unitName // ignore: cast_nullable_to_non_nullable
as String?,communityId: freezed == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String?,communityName: freezed == communityName ? _self.communityName : communityName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
