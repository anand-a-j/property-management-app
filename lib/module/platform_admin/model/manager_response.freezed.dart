// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manager_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManagerResponse {

 List<Profile> get managers; int get totalManagers; int get activeUsers; int get totalUsers;
/// Create a copy of ManagerResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagerResponseCopyWith<ManagerResponse> get copyWith => _$ManagerResponseCopyWithImpl<ManagerResponse>(this as ManagerResponse, _$identity);

  /// Serializes this ManagerResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagerResponse&&const DeepCollectionEquality().equals(other.managers, managers)&&(identical(other.totalManagers, totalManagers) || other.totalManagers == totalManagers)&&(identical(other.activeUsers, activeUsers) || other.activeUsers == activeUsers)&&(identical(other.totalUsers, totalUsers) || other.totalUsers == totalUsers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(managers),totalManagers,activeUsers,totalUsers);

@override
String toString() {
  return 'ManagerResponse(managers: $managers, totalManagers: $totalManagers, activeUsers: $activeUsers, totalUsers: $totalUsers)';
}


}

/// @nodoc
abstract mixin class $ManagerResponseCopyWith<$Res>  {
  factory $ManagerResponseCopyWith(ManagerResponse value, $Res Function(ManagerResponse) _then) = _$ManagerResponseCopyWithImpl;
@useResult
$Res call({
 List<Profile> managers, int totalManagers, int activeUsers, int totalUsers
});




}
/// @nodoc
class _$ManagerResponseCopyWithImpl<$Res>
    implements $ManagerResponseCopyWith<$Res> {
  _$ManagerResponseCopyWithImpl(this._self, this._then);

  final ManagerResponse _self;
  final $Res Function(ManagerResponse) _then;

/// Create a copy of ManagerResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? managers = null,Object? totalManagers = null,Object? activeUsers = null,Object? totalUsers = null,}) {
  return _then(_self.copyWith(
managers: null == managers ? _self.managers : managers // ignore: cast_nullable_to_non_nullable
as List<Profile>,totalManagers: null == totalManagers ? _self.totalManagers : totalManagers // ignore: cast_nullable_to_non_nullable
as int,activeUsers: null == activeUsers ? _self.activeUsers : activeUsers // ignore: cast_nullable_to_non_nullable
as int,totalUsers: null == totalUsers ? _self.totalUsers : totalUsers // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ManagerResponse].
extension ManagerResponsePatterns on ManagerResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManagerResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManagerResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManagerResponse value)  $default,){
final _that = this;
switch (_that) {
case _ManagerResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManagerResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ManagerResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Profile> managers,  int totalManagers,  int activeUsers,  int totalUsers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManagerResponse() when $default != null:
return $default(_that.managers,_that.totalManagers,_that.activeUsers,_that.totalUsers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Profile> managers,  int totalManagers,  int activeUsers,  int totalUsers)  $default,) {final _that = this;
switch (_that) {
case _ManagerResponse():
return $default(_that.managers,_that.totalManagers,_that.activeUsers,_that.totalUsers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Profile> managers,  int totalManagers,  int activeUsers,  int totalUsers)?  $default,) {final _that = this;
switch (_that) {
case _ManagerResponse() when $default != null:
return $default(_that.managers,_that.totalManagers,_that.activeUsers,_that.totalUsers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManagerResponse implements ManagerResponse {
  const _ManagerResponse({required final  List<Profile> managers, required this.totalManagers, required this.activeUsers, required this.totalUsers}): _managers = managers;
  factory _ManagerResponse.fromJson(Map<String, dynamic> json) => _$ManagerResponseFromJson(json);

 final  List<Profile> _managers;
@override List<Profile> get managers {
  if (_managers is EqualUnmodifiableListView) return _managers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_managers);
}

@override final  int totalManagers;
@override final  int activeUsers;
@override final  int totalUsers;

/// Create a copy of ManagerResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManagerResponseCopyWith<_ManagerResponse> get copyWith => __$ManagerResponseCopyWithImpl<_ManagerResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManagerResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManagerResponse&&const DeepCollectionEquality().equals(other._managers, _managers)&&(identical(other.totalManagers, totalManagers) || other.totalManagers == totalManagers)&&(identical(other.activeUsers, activeUsers) || other.activeUsers == activeUsers)&&(identical(other.totalUsers, totalUsers) || other.totalUsers == totalUsers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_managers),totalManagers,activeUsers,totalUsers);

@override
String toString() {
  return 'ManagerResponse(managers: $managers, totalManagers: $totalManagers, activeUsers: $activeUsers, totalUsers: $totalUsers)';
}


}

/// @nodoc
abstract mixin class _$ManagerResponseCopyWith<$Res> implements $ManagerResponseCopyWith<$Res> {
  factory _$ManagerResponseCopyWith(_ManagerResponse value, $Res Function(_ManagerResponse) _then) = __$ManagerResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Profile> managers, int totalManagers, int activeUsers, int totalUsers
});




}
/// @nodoc
class __$ManagerResponseCopyWithImpl<$Res>
    implements _$ManagerResponseCopyWith<$Res> {
  __$ManagerResponseCopyWithImpl(this._self, this._then);

  final _ManagerResponse _self;
  final $Res Function(_ManagerResponse) _then;

/// Create a copy of ManagerResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? managers = null,Object? totalManagers = null,Object? activeUsers = null,Object? totalUsers = null,}) {
  return _then(_ManagerResponse(
managers: null == managers ? _self._managers : managers // ignore: cast_nullable_to_non_nullable
as List<Profile>,totalManagers: null == totalManagers ? _self.totalManagers : totalManagers // ignore: cast_nullable_to_non_nullable
as int,activeUsers: null == activeUsers ? _self.activeUsers : activeUsers // ignore: cast_nullable_to_non_nullable
as int,totalUsers: null == totalUsers ? _self.totalUsers : totalUsers // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
