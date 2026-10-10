// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MaintenanceUpdate {

 String get id;@JsonKey(name: 'maintenance_request_id') String get maintenanceRequestId;@JsonKey(name: 'updated_by') String get updatedBy; MaintenanceUpdateStatus get status; String get note;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of MaintenanceUpdate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceUpdateCopyWith<MaintenanceUpdate> get copyWith => _$MaintenanceUpdateCopyWithImpl<MaintenanceUpdate>(this as MaintenanceUpdate, _$identity);

  /// Serializes this MaintenanceUpdate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceUpdate&&(identical(other.id, id) || other.id == id)&&(identical(other.maintenanceRequestId, maintenanceRequestId) || other.maintenanceRequestId == maintenanceRequestId)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.status, status) || other.status == status)&&(identical(other.note, note) || other.note == note)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,maintenanceRequestId,updatedBy,status,note,createdAt);

@override
String toString() {
  return 'MaintenanceUpdate(id: $id, maintenanceRequestId: $maintenanceRequestId, updatedBy: $updatedBy, status: $status, note: $note, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MaintenanceUpdateCopyWith<$Res>  {
  factory $MaintenanceUpdateCopyWith(MaintenanceUpdate value, $Res Function(MaintenanceUpdate) _then) = _$MaintenanceUpdateCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'maintenance_request_id') String maintenanceRequestId,@JsonKey(name: 'updated_by') String updatedBy, MaintenanceUpdateStatus status, String note,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$MaintenanceUpdateCopyWithImpl<$Res>
    implements $MaintenanceUpdateCopyWith<$Res> {
  _$MaintenanceUpdateCopyWithImpl(this._self, this._then);

  final MaintenanceUpdate _self;
  final $Res Function(MaintenanceUpdate) _then;

/// Create a copy of MaintenanceUpdate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? maintenanceRequestId = null,Object? updatedBy = null,Object? status = null,Object? note = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,maintenanceRequestId: null == maintenanceRequestId ? _self.maintenanceRequestId : maintenanceRequestId // ignore: cast_nullable_to_non_nullable
as String,updatedBy: null == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MaintenanceUpdateStatus,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MaintenanceUpdate].
extension MaintenanceUpdatePatterns on MaintenanceUpdate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceUpdate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceUpdate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceUpdate value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceUpdate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceUpdate value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceUpdate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'maintenance_request_id')  String maintenanceRequestId, @JsonKey(name: 'updated_by')  String updatedBy,  MaintenanceUpdateStatus status,  String note, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceUpdate() when $default != null:
return $default(_that.id,_that.maintenanceRequestId,_that.updatedBy,_that.status,_that.note,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'maintenance_request_id')  String maintenanceRequestId, @JsonKey(name: 'updated_by')  String updatedBy,  MaintenanceUpdateStatus status,  String note, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceUpdate():
return $default(_that.id,_that.maintenanceRequestId,_that.updatedBy,_that.status,_that.note,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'maintenance_request_id')  String maintenanceRequestId, @JsonKey(name: 'updated_by')  String updatedBy,  MaintenanceUpdateStatus status,  String note, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceUpdate() when $default != null:
return $default(_that.id,_that.maintenanceRequestId,_that.updatedBy,_that.status,_that.note,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaintenanceUpdate implements MaintenanceUpdate {
  const _MaintenanceUpdate({required this.id, @JsonKey(name: 'maintenance_request_id') required this.maintenanceRequestId, @JsonKey(name: 'updated_by') required this.updatedBy, required this.status, required this.note, @JsonKey(name: 'created_at') required this.createdAt});
  factory _MaintenanceUpdate.fromJson(Map<String, dynamic> json) => _$MaintenanceUpdateFromJson(json);

@override final  String id;
@override@JsonKey(name: 'maintenance_request_id') final  String maintenanceRequestId;
@override@JsonKey(name: 'updated_by') final  String updatedBy;
@override final  MaintenanceUpdateStatus status;
@override final  String note;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of MaintenanceUpdate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceUpdateCopyWith<_MaintenanceUpdate> get copyWith => __$MaintenanceUpdateCopyWithImpl<_MaintenanceUpdate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaintenanceUpdateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceUpdate&&(identical(other.id, id) || other.id == id)&&(identical(other.maintenanceRequestId, maintenanceRequestId) || other.maintenanceRequestId == maintenanceRequestId)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.status, status) || other.status == status)&&(identical(other.note, note) || other.note == note)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,maintenanceRequestId,updatedBy,status,note,createdAt);

@override
String toString() {
  return 'MaintenanceUpdate(id: $id, maintenanceRequestId: $maintenanceRequestId, updatedBy: $updatedBy, status: $status, note: $note, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceUpdateCopyWith<$Res> implements $MaintenanceUpdateCopyWith<$Res> {
  factory _$MaintenanceUpdateCopyWith(_MaintenanceUpdate value, $Res Function(_MaintenanceUpdate) _then) = __$MaintenanceUpdateCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'maintenance_request_id') String maintenanceRequestId,@JsonKey(name: 'updated_by') String updatedBy, MaintenanceUpdateStatus status, String note,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$MaintenanceUpdateCopyWithImpl<$Res>
    implements _$MaintenanceUpdateCopyWith<$Res> {
  __$MaintenanceUpdateCopyWithImpl(this._self, this._then);

  final _MaintenanceUpdate _self;
  final $Res Function(_MaintenanceUpdate) _then;

/// Create a copy of MaintenanceUpdate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? maintenanceRequestId = null,Object? updatedBy = null,Object? status = null,Object? note = null,Object? createdAt = null,}) {
  return _then(_MaintenanceUpdate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,maintenanceRequestId: null == maintenanceRequestId ? _self.maintenanceRequestId : maintenanceRequestId // ignore: cast_nullable_to_non_nullable
as String,updatedBy: null == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MaintenanceUpdateStatus,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
