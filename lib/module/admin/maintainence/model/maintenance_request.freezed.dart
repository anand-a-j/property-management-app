// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MaintenanceRequest {

 String get id;@JsonKey(name: 'org_id') String get orgId;@JsonKey(name: 'unit_id') String get unitId;@JsonKey(name: 'ticket_number') String get ticketNumber;@JsonKey(name: 'created_by') String get createdBy;@JsonKey(name: 'resident_id') String? get residentId;@JsonKey(name: 'issue_title') String get issueTitle;@JsonKey(name: 'issue_type') String get issueType; String get description; MaintenancePriority get priority; MaintenanceStatus get status;@JsonKey(name: 'assigned_to') String? get assignedTo;@JsonKey(name: 'reviewed_by') String? get reviewedBy;@JsonKey(name: 'reviewed_at') DateTime? get reviewedAt;@JsonKey(name: 'rejection_reason') String? get rejectionReason;@JsonKey(name: 'approved_at') DateTime? get approvedAt;@JsonKey(name: 'completed_at') DateTime? get completedAt;@JsonKey(name: 'closed_at') DateTime? get closedAt;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of MaintenanceRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceRequestCopyWith<MaintenanceRequest> get copyWith => _$MaintenanceRequestCopyWithImpl<MaintenanceRequest>(this as MaintenanceRequest, _$identity);

  /// Serializes this MaintenanceRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.ticketNumber, ticketNumber) || other.ticketNumber == ticketNumber)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.issueTitle, issueTitle) || other.issueTitle == issueTitle)&&(identical(other.issueType, issueType) || other.issueType == issueType)&&(identical(other.description, description) || other.description == description)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.status, status) || other.status == status)&&(identical(other.assignedTo, assignedTo) || other.assignedTo == assignedTo)&&(identical(other.reviewedBy, reviewedBy) || other.reviewedBy == reviewedBy)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,orgId,unitId,ticketNumber,createdBy,residentId,issueTitle,issueType,description,priority,status,assignedTo,reviewedBy,reviewedAt,rejectionReason,approvedAt,completedAt,closedAt,createdAt,updatedAt]);

@override
String toString() {
  return 'MaintenanceRequest(id: $id, orgId: $orgId, unitId: $unitId, ticketNumber: $ticketNumber, createdBy: $createdBy, residentId: $residentId, issueTitle: $issueTitle, issueType: $issueType, description: $description, priority: $priority, status: $status, assignedTo: $assignedTo, reviewedBy: $reviewedBy, reviewedAt: $reviewedAt, rejectionReason: $rejectionReason, approvedAt: $approvedAt, completedAt: $completedAt, closedAt: $closedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MaintenanceRequestCopyWith<$Res>  {
  factory $MaintenanceRequestCopyWith(MaintenanceRequest value, $Res Function(MaintenanceRequest) _then) = _$MaintenanceRequestCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'org_id') String orgId,@JsonKey(name: 'unit_id') String unitId,@JsonKey(name: 'ticket_number') String ticketNumber,@JsonKey(name: 'created_by') String createdBy,@JsonKey(name: 'resident_id') String? residentId,@JsonKey(name: 'issue_title') String issueTitle,@JsonKey(name: 'issue_type') String issueType, String description, MaintenancePriority priority, MaintenanceStatus status,@JsonKey(name: 'assigned_to') String? assignedTo,@JsonKey(name: 'reviewed_by') String? reviewedBy,@JsonKey(name: 'reviewed_at') DateTime? reviewedAt,@JsonKey(name: 'rejection_reason') String? rejectionReason,@JsonKey(name: 'approved_at') DateTime? approvedAt,@JsonKey(name: 'completed_at') DateTime? completedAt,@JsonKey(name: 'closed_at') DateTime? closedAt,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$MaintenanceRequestCopyWithImpl<$Res>
    implements $MaintenanceRequestCopyWith<$Res> {
  _$MaintenanceRequestCopyWithImpl(this._self, this._then);

  final MaintenanceRequest _self;
  final $Res Function(MaintenanceRequest) _then;

/// Create a copy of MaintenanceRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orgId = null,Object? unitId = null,Object? ticketNumber = null,Object? createdBy = null,Object? residentId = freezed,Object? issueTitle = null,Object? issueType = null,Object? description = null,Object? priority = null,Object? status = null,Object? assignedTo = freezed,Object? reviewedBy = freezed,Object? reviewedAt = freezed,Object? rejectionReason = freezed,Object? approvedAt = freezed,Object? completedAt = freezed,Object? closedAt = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String,ticketNumber: null == ticketNumber ? _self.ticketNumber : ticketNumber // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,residentId: freezed == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String?,issueTitle: null == issueTitle ? _self.issueTitle : issueTitle // ignore: cast_nullable_to_non_nullable
as String,issueType: null == issueType ? _self.issueType : issueType // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as MaintenancePriority,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MaintenanceStatus,assignedTo: freezed == assignedTo ? _self.assignedTo : assignedTo // ignore: cast_nullable_to_non_nullable
as String?,reviewedBy: freezed == reviewedBy ? _self.reviewedBy : reviewedBy // ignore: cast_nullable_to_non_nullable
as String?,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MaintenanceRequest].
extension MaintenanceRequestPatterns on MaintenanceRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceRequest value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceRequest value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'org_id')  String orgId, @JsonKey(name: 'unit_id')  String unitId, @JsonKey(name: 'ticket_number')  String ticketNumber, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'resident_id')  String? residentId, @JsonKey(name: 'issue_title')  String issueTitle, @JsonKey(name: 'issue_type')  String issueType,  String description,  MaintenancePriority priority,  MaintenanceStatus status, @JsonKey(name: 'assigned_to')  String? assignedTo, @JsonKey(name: 'reviewed_by')  String? reviewedBy, @JsonKey(name: 'reviewed_at')  DateTime? reviewedAt, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'approved_at')  DateTime? approvedAt, @JsonKey(name: 'completed_at')  DateTime? completedAt, @JsonKey(name: 'closed_at')  DateTime? closedAt, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceRequest() when $default != null:
return $default(_that.id,_that.orgId,_that.unitId,_that.ticketNumber,_that.createdBy,_that.residentId,_that.issueTitle,_that.issueType,_that.description,_that.priority,_that.status,_that.assignedTo,_that.reviewedBy,_that.reviewedAt,_that.rejectionReason,_that.approvedAt,_that.completedAt,_that.closedAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'org_id')  String orgId, @JsonKey(name: 'unit_id')  String unitId, @JsonKey(name: 'ticket_number')  String ticketNumber, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'resident_id')  String? residentId, @JsonKey(name: 'issue_title')  String issueTitle, @JsonKey(name: 'issue_type')  String issueType,  String description,  MaintenancePriority priority,  MaintenanceStatus status, @JsonKey(name: 'assigned_to')  String? assignedTo, @JsonKey(name: 'reviewed_by')  String? reviewedBy, @JsonKey(name: 'reviewed_at')  DateTime? reviewedAt, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'approved_at')  DateTime? approvedAt, @JsonKey(name: 'completed_at')  DateTime? completedAt, @JsonKey(name: 'closed_at')  DateTime? closedAt, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceRequest():
return $default(_that.id,_that.orgId,_that.unitId,_that.ticketNumber,_that.createdBy,_that.residentId,_that.issueTitle,_that.issueType,_that.description,_that.priority,_that.status,_that.assignedTo,_that.reviewedBy,_that.reviewedAt,_that.rejectionReason,_that.approvedAt,_that.completedAt,_that.closedAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'org_id')  String orgId, @JsonKey(name: 'unit_id')  String unitId, @JsonKey(name: 'ticket_number')  String ticketNumber, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'resident_id')  String? residentId, @JsonKey(name: 'issue_title')  String issueTitle, @JsonKey(name: 'issue_type')  String issueType,  String description,  MaintenancePriority priority,  MaintenanceStatus status, @JsonKey(name: 'assigned_to')  String? assignedTo, @JsonKey(name: 'reviewed_by')  String? reviewedBy, @JsonKey(name: 'reviewed_at')  DateTime? reviewedAt, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'approved_at')  DateTime? approvedAt, @JsonKey(name: 'completed_at')  DateTime? completedAt, @JsonKey(name: 'closed_at')  DateTime? closedAt, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceRequest() when $default != null:
return $default(_that.id,_that.orgId,_that.unitId,_that.ticketNumber,_that.createdBy,_that.residentId,_that.issueTitle,_that.issueType,_that.description,_that.priority,_that.status,_that.assignedTo,_that.reviewedBy,_that.reviewedAt,_that.rejectionReason,_that.approvedAt,_that.completedAt,_that.closedAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaintenanceRequest implements MaintenanceRequest {
  const _MaintenanceRequest({required this.id, @JsonKey(name: 'org_id') required this.orgId, @JsonKey(name: 'unit_id') required this.unitId, @JsonKey(name: 'ticket_number') required this.ticketNumber, @JsonKey(name: 'created_by') required this.createdBy, @JsonKey(name: 'resident_id') this.residentId, @JsonKey(name: 'issue_title') required this.issueTitle, @JsonKey(name: 'issue_type') required this.issueType, required this.description, this.priority = MaintenancePriority.medium, this.status = MaintenanceStatus.pendingReview, @JsonKey(name: 'assigned_to') this.assignedTo, @JsonKey(name: 'reviewed_by') this.reviewedBy, @JsonKey(name: 'reviewed_at') this.reviewedAt, @JsonKey(name: 'rejection_reason') this.rejectionReason, @JsonKey(name: 'approved_at') this.approvedAt, @JsonKey(name: 'completed_at') this.completedAt, @JsonKey(name: 'closed_at') this.closedAt, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _MaintenanceRequest.fromJson(Map<String, dynamic> json) => _$MaintenanceRequestFromJson(json);

@override final  String id;
@override@JsonKey(name: 'org_id') final  String orgId;
@override@JsonKey(name: 'unit_id') final  String unitId;
@override@JsonKey(name: 'ticket_number') final  String ticketNumber;
@override@JsonKey(name: 'created_by') final  String createdBy;
@override@JsonKey(name: 'resident_id') final  String? residentId;
@override@JsonKey(name: 'issue_title') final  String issueTitle;
@override@JsonKey(name: 'issue_type') final  String issueType;
@override final  String description;
@override@JsonKey() final  MaintenancePriority priority;
@override@JsonKey() final  MaintenanceStatus status;
@override@JsonKey(name: 'assigned_to') final  String? assignedTo;
@override@JsonKey(name: 'reviewed_by') final  String? reviewedBy;
@override@JsonKey(name: 'reviewed_at') final  DateTime? reviewedAt;
@override@JsonKey(name: 'rejection_reason') final  String? rejectionReason;
@override@JsonKey(name: 'approved_at') final  DateTime? approvedAt;
@override@JsonKey(name: 'completed_at') final  DateTime? completedAt;
@override@JsonKey(name: 'closed_at') final  DateTime? closedAt;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of MaintenanceRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceRequestCopyWith<_MaintenanceRequest> get copyWith => __$MaintenanceRequestCopyWithImpl<_MaintenanceRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaintenanceRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.ticketNumber, ticketNumber) || other.ticketNumber == ticketNumber)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.issueTitle, issueTitle) || other.issueTitle == issueTitle)&&(identical(other.issueType, issueType) || other.issueType == issueType)&&(identical(other.description, description) || other.description == description)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.status, status) || other.status == status)&&(identical(other.assignedTo, assignedTo) || other.assignedTo == assignedTo)&&(identical(other.reviewedBy, reviewedBy) || other.reviewedBy == reviewedBy)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,orgId,unitId,ticketNumber,createdBy,residentId,issueTitle,issueType,description,priority,status,assignedTo,reviewedBy,reviewedAt,rejectionReason,approvedAt,completedAt,closedAt,createdAt,updatedAt]);

@override
String toString() {
  return 'MaintenanceRequest(id: $id, orgId: $orgId, unitId: $unitId, ticketNumber: $ticketNumber, createdBy: $createdBy, residentId: $residentId, issueTitle: $issueTitle, issueType: $issueType, description: $description, priority: $priority, status: $status, assignedTo: $assignedTo, reviewedBy: $reviewedBy, reviewedAt: $reviewedAt, rejectionReason: $rejectionReason, approvedAt: $approvedAt, completedAt: $completedAt, closedAt: $closedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceRequestCopyWith<$Res> implements $MaintenanceRequestCopyWith<$Res> {
  factory _$MaintenanceRequestCopyWith(_MaintenanceRequest value, $Res Function(_MaintenanceRequest) _then) = __$MaintenanceRequestCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'org_id') String orgId,@JsonKey(name: 'unit_id') String unitId,@JsonKey(name: 'ticket_number') String ticketNumber,@JsonKey(name: 'created_by') String createdBy,@JsonKey(name: 'resident_id') String? residentId,@JsonKey(name: 'issue_title') String issueTitle,@JsonKey(name: 'issue_type') String issueType, String description, MaintenancePriority priority, MaintenanceStatus status,@JsonKey(name: 'assigned_to') String? assignedTo,@JsonKey(name: 'reviewed_by') String? reviewedBy,@JsonKey(name: 'reviewed_at') DateTime? reviewedAt,@JsonKey(name: 'rejection_reason') String? rejectionReason,@JsonKey(name: 'approved_at') DateTime? approvedAt,@JsonKey(name: 'completed_at') DateTime? completedAt,@JsonKey(name: 'closed_at') DateTime? closedAt,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$MaintenanceRequestCopyWithImpl<$Res>
    implements _$MaintenanceRequestCopyWith<$Res> {
  __$MaintenanceRequestCopyWithImpl(this._self, this._then);

  final _MaintenanceRequest _self;
  final $Res Function(_MaintenanceRequest) _then;

/// Create a copy of MaintenanceRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orgId = null,Object? unitId = null,Object? ticketNumber = null,Object? createdBy = null,Object? residentId = freezed,Object? issueTitle = null,Object? issueType = null,Object? description = null,Object? priority = null,Object? status = null,Object? assignedTo = freezed,Object? reviewedBy = freezed,Object? reviewedAt = freezed,Object? rejectionReason = freezed,Object? approvedAt = freezed,Object? completedAt = freezed,Object? closedAt = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_MaintenanceRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String,ticketNumber: null == ticketNumber ? _self.ticketNumber : ticketNumber // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,residentId: freezed == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String?,issueTitle: null == issueTitle ? _self.issueTitle : issueTitle // ignore: cast_nullable_to_non_nullable
as String,issueType: null == issueType ? _self.issueType : issueType // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as MaintenancePriority,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MaintenanceStatus,assignedTo: freezed == assignedTo ? _self.assignedTo : assignedTo // ignore: cast_nullable_to_non_nullable
as String?,reviewedBy: freezed == reviewedBy ? _self.reviewedBy : reviewedBy // ignore: cast_nullable_to_non_nullable
as String?,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
