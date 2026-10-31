// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecentActivity {

@JsonKey(name: 'activity_type') String? get activityType; String? get title; String? get description;@JsonKey(name: 'activity_at') DateTime? get activityAt;@JsonKey(name: 'due_date') DateTime? get dueDate;@JsonKey(name: 'reference_id') String? get referenceId;@JsonKey(name: 'unit_name') String? get unitName;@JsonKey(name: 'community_name') String? get communityName; String? get status;
/// Create a copy of RecentActivity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecentActivityCopyWith<RecentActivity> get copyWith => _$RecentActivityCopyWithImpl<RecentActivity>(this as RecentActivity, _$identity);

  /// Serializes this RecentActivity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecentActivity&&(identical(other.activityType, activityType) || other.activityType == activityType)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.activityAt, activityAt) || other.activityAt == activityAt)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId)&&(identical(other.unitName, unitName) || other.unitName == unitName)&&(identical(other.communityName, communityName) || other.communityName == communityName)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activityType,title,description,activityAt,dueDate,referenceId,unitName,communityName,status);

@override
String toString() {
  return 'RecentActivity(activityType: $activityType, title: $title, description: $description, activityAt: $activityAt, dueDate: $dueDate, referenceId: $referenceId, unitName: $unitName, communityName: $communityName, status: $status)';
}


}

/// @nodoc
abstract mixin class $RecentActivityCopyWith<$Res>  {
  factory $RecentActivityCopyWith(RecentActivity value, $Res Function(RecentActivity) _then) = _$RecentActivityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'activity_type') String? activityType, String? title, String? description,@JsonKey(name: 'activity_at') DateTime? activityAt,@JsonKey(name: 'due_date') DateTime? dueDate,@JsonKey(name: 'reference_id') String? referenceId,@JsonKey(name: 'unit_name') String? unitName,@JsonKey(name: 'community_name') String? communityName, String? status
});




}
/// @nodoc
class _$RecentActivityCopyWithImpl<$Res>
    implements $RecentActivityCopyWith<$Res> {
  _$RecentActivityCopyWithImpl(this._self, this._then);

  final RecentActivity _self;
  final $Res Function(RecentActivity) _then;

/// Create a copy of RecentActivity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activityType = freezed,Object? title = freezed,Object? description = freezed,Object? activityAt = freezed,Object? dueDate = freezed,Object? referenceId = freezed,Object? unitName = freezed,Object? communityName = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
activityType: freezed == activityType ? _self.activityType : activityType // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,activityAt: freezed == activityAt ? _self.activityAt : activityAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,referenceId: freezed == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String?,unitName: freezed == unitName ? _self.unitName : unitName // ignore: cast_nullable_to_non_nullable
as String?,communityName: freezed == communityName ? _self.communityName : communityName // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecentActivity].
extension RecentActivityPatterns on RecentActivity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecentActivity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecentActivity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecentActivity value)  $default,){
final _that = this;
switch (_that) {
case _RecentActivity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecentActivity value)?  $default,){
final _that = this;
switch (_that) {
case _RecentActivity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'activity_type')  String? activityType,  String? title,  String? description, @JsonKey(name: 'activity_at')  DateTime? activityAt, @JsonKey(name: 'due_date')  DateTime? dueDate, @JsonKey(name: 'reference_id')  String? referenceId, @JsonKey(name: 'unit_name')  String? unitName, @JsonKey(name: 'community_name')  String? communityName,  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecentActivity() when $default != null:
return $default(_that.activityType,_that.title,_that.description,_that.activityAt,_that.dueDate,_that.referenceId,_that.unitName,_that.communityName,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'activity_type')  String? activityType,  String? title,  String? description, @JsonKey(name: 'activity_at')  DateTime? activityAt, @JsonKey(name: 'due_date')  DateTime? dueDate, @JsonKey(name: 'reference_id')  String? referenceId, @JsonKey(name: 'unit_name')  String? unitName, @JsonKey(name: 'community_name')  String? communityName,  String? status)  $default,) {final _that = this;
switch (_that) {
case _RecentActivity():
return $default(_that.activityType,_that.title,_that.description,_that.activityAt,_that.dueDate,_that.referenceId,_that.unitName,_that.communityName,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'activity_type')  String? activityType,  String? title,  String? description, @JsonKey(name: 'activity_at')  DateTime? activityAt, @JsonKey(name: 'due_date')  DateTime? dueDate, @JsonKey(name: 'reference_id')  String? referenceId, @JsonKey(name: 'unit_name')  String? unitName, @JsonKey(name: 'community_name')  String? communityName,  String? status)?  $default,) {final _that = this;
switch (_that) {
case _RecentActivity() when $default != null:
return $default(_that.activityType,_that.title,_that.description,_that.activityAt,_that.dueDate,_that.referenceId,_that.unitName,_that.communityName,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecentActivity implements RecentActivity {
  const _RecentActivity({@JsonKey(name: 'activity_type') this.activityType, this.title, this.description, @JsonKey(name: 'activity_at') this.activityAt, @JsonKey(name: 'due_date') this.dueDate, @JsonKey(name: 'reference_id') this.referenceId, @JsonKey(name: 'unit_name') this.unitName, @JsonKey(name: 'community_name') this.communityName, this.status});
  factory _RecentActivity.fromJson(Map<String, dynamic> json) => _$RecentActivityFromJson(json);

@override@JsonKey(name: 'activity_type') final  String? activityType;
@override final  String? title;
@override final  String? description;
@override@JsonKey(name: 'activity_at') final  DateTime? activityAt;
@override@JsonKey(name: 'due_date') final  DateTime? dueDate;
@override@JsonKey(name: 'reference_id') final  String? referenceId;
@override@JsonKey(name: 'unit_name') final  String? unitName;
@override@JsonKey(name: 'community_name') final  String? communityName;
@override final  String? status;

/// Create a copy of RecentActivity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecentActivityCopyWith<_RecentActivity> get copyWith => __$RecentActivityCopyWithImpl<_RecentActivity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecentActivityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecentActivity&&(identical(other.activityType, activityType) || other.activityType == activityType)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.activityAt, activityAt) || other.activityAt == activityAt)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId)&&(identical(other.unitName, unitName) || other.unitName == unitName)&&(identical(other.communityName, communityName) || other.communityName == communityName)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activityType,title,description,activityAt,dueDate,referenceId,unitName,communityName,status);

@override
String toString() {
  return 'RecentActivity(activityType: $activityType, title: $title, description: $description, activityAt: $activityAt, dueDate: $dueDate, referenceId: $referenceId, unitName: $unitName, communityName: $communityName, status: $status)';
}


}

/// @nodoc
abstract mixin class _$RecentActivityCopyWith<$Res> implements $RecentActivityCopyWith<$Res> {
  factory _$RecentActivityCopyWith(_RecentActivity value, $Res Function(_RecentActivity) _then) = __$RecentActivityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'activity_type') String? activityType, String? title, String? description,@JsonKey(name: 'activity_at') DateTime? activityAt,@JsonKey(name: 'due_date') DateTime? dueDate,@JsonKey(name: 'reference_id') String? referenceId,@JsonKey(name: 'unit_name') String? unitName,@JsonKey(name: 'community_name') String? communityName, String? status
});




}
/// @nodoc
class __$RecentActivityCopyWithImpl<$Res>
    implements _$RecentActivityCopyWith<$Res> {
  __$RecentActivityCopyWithImpl(this._self, this._then);

  final _RecentActivity _self;
  final $Res Function(_RecentActivity) _then;

/// Create a copy of RecentActivity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activityType = freezed,Object? title = freezed,Object? description = freezed,Object? activityAt = freezed,Object? dueDate = freezed,Object? referenceId = freezed,Object? unitName = freezed,Object? communityName = freezed,Object? status = freezed,}) {
  return _then(_RecentActivity(
activityType: freezed == activityType ? _self.activityType : activityType // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,activityAt: freezed == activityAt ? _self.activityAt : activityAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,referenceId: freezed == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String?,unitName: freezed == unitName ? _self.unitName : unitName // ignore: cast_nullable_to_non_nullable
as String?,communityName: freezed == communityName ? _self.communityName : communityName // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
