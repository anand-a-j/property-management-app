// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileDetails {

@HiveField(0)@JsonKey(name: 'profile_id') String get profileId;@HiveField(1)@JsonKey(name: 'first_name') String get firstName;@HiveField(2)@JsonKey(name: 'last_name') String get lastName;@HiveField(3) String? get nickname;@HiveField(4)@JsonKey(name: 'emirates_id') String? get emiratesId;@HiveField(5)@JsonKey(name: 'created_at') DateTime? get createdAt;@HiveField(6)@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of ProfileDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileDetailsCopyWith<ProfileDetails> get copyWith => _$ProfileDetailsCopyWithImpl<ProfileDetails>(this as ProfileDetails, _$identity);

  /// Serializes this ProfileDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileDetails&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.emiratesId, emiratesId) || other.emiratesId == emiratesId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profileId,firstName,lastName,nickname,emiratesId,createdAt,updatedAt);

@override
String toString() {
  return 'ProfileDetails(profileId: $profileId, firstName: $firstName, lastName: $lastName, nickname: $nickname, emiratesId: $emiratesId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ProfileDetailsCopyWith<$Res>  {
  factory $ProfileDetailsCopyWith(ProfileDetails value, $Res Function(ProfileDetails) _then) = _$ProfileDetailsCopyWithImpl;
@useResult
$Res call({
@HiveField(0)@JsonKey(name: 'profile_id') String profileId,@HiveField(1)@JsonKey(name: 'first_name') String firstName,@HiveField(2)@JsonKey(name: 'last_name') String lastName,@HiveField(3) String? nickname,@HiveField(4)@JsonKey(name: 'emirates_id') String? emiratesId,@HiveField(5)@JsonKey(name: 'created_at') DateTime? createdAt,@HiveField(6)@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$ProfileDetailsCopyWithImpl<$Res>
    implements $ProfileDetailsCopyWith<$Res> {
  _$ProfileDetailsCopyWithImpl(this._self, this._then);

  final ProfileDetails _self;
  final $Res Function(ProfileDetails) _then;

/// Create a copy of ProfileDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profileId = null,Object? firstName = null,Object? lastName = null,Object? nickname = freezed,Object? emiratesId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,emiratesId: freezed == emiratesId ? _self.emiratesId : emiratesId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileDetails].
extension ProfileDetailsPatterns on ProfileDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileDetails value)  $default,){
final _that = this;
switch (_that) {
case _ProfileDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileDetails value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: 'profile_id')  String profileId, @HiveField(1)@JsonKey(name: 'first_name')  String firstName, @HiveField(2)@JsonKey(name: 'last_name')  String lastName, @HiveField(3)  String? nickname, @HiveField(4)@JsonKey(name: 'emirates_id')  String? emiratesId, @HiveField(5)@JsonKey(name: 'created_at')  DateTime? createdAt, @HiveField(6)@JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileDetails() when $default != null:
return $default(_that.profileId,_that.firstName,_that.lastName,_that.nickname,_that.emiratesId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)@JsonKey(name: 'profile_id')  String profileId, @HiveField(1)@JsonKey(name: 'first_name')  String firstName, @HiveField(2)@JsonKey(name: 'last_name')  String lastName, @HiveField(3)  String? nickname, @HiveField(4)@JsonKey(name: 'emirates_id')  String? emiratesId, @HiveField(5)@JsonKey(name: 'created_at')  DateTime? createdAt, @HiveField(6)@JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ProfileDetails():
return $default(_that.profileId,_that.firstName,_that.lastName,_that.nickname,_that.emiratesId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)@JsonKey(name: 'profile_id')  String profileId, @HiveField(1)@JsonKey(name: 'first_name')  String firstName, @HiveField(2)@JsonKey(name: 'last_name')  String lastName, @HiveField(3)  String? nickname, @HiveField(4)@JsonKey(name: 'emirates_id')  String? emiratesId, @HiveField(5)@JsonKey(name: 'created_at')  DateTime? createdAt, @HiveField(6)@JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ProfileDetails() when $default != null:
return $default(_that.profileId,_that.firstName,_that.lastName,_that.nickname,_that.emiratesId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileDetails implements ProfileDetails {
  const _ProfileDetails({@HiveField(0)@JsonKey(name: 'profile_id') required this.profileId, @HiveField(1)@JsonKey(name: 'first_name') this.firstName = '', @HiveField(2)@JsonKey(name: 'last_name') this.lastName = '', @HiveField(3) this.nickname, @HiveField(4)@JsonKey(name: 'emirates_id') this.emiratesId, @HiveField(5)@JsonKey(name: 'created_at') this.createdAt, @HiveField(6)@JsonKey(name: 'updated_at') this.updatedAt});
  factory _ProfileDetails.fromJson(Map<String, dynamic> json) => _$ProfileDetailsFromJson(json);

@override@HiveField(0)@JsonKey(name: 'profile_id') final  String profileId;
@override@HiveField(1)@JsonKey(name: 'first_name') final  String firstName;
@override@HiveField(2)@JsonKey(name: 'last_name') final  String lastName;
@override@HiveField(3) final  String? nickname;
@override@HiveField(4)@JsonKey(name: 'emirates_id') final  String? emiratesId;
@override@HiveField(5)@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@HiveField(6)@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of ProfileDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileDetailsCopyWith<_ProfileDetails> get copyWith => __$ProfileDetailsCopyWithImpl<_ProfileDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileDetails&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.emiratesId, emiratesId) || other.emiratesId == emiratesId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profileId,firstName,lastName,nickname,emiratesId,createdAt,updatedAt);

@override
String toString() {
  return 'ProfileDetails(profileId: $profileId, firstName: $firstName, lastName: $lastName, nickname: $nickname, emiratesId: $emiratesId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProfileDetailsCopyWith<$Res> implements $ProfileDetailsCopyWith<$Res> {
  factory _$ProfileDetailsCopyWith(_ProfileDetails value, $Res Function(_ProfileDetails) _then) = __$ProfileDetailsCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0)@JsonKey(name: 'profile_id') String profileId,@HiveField(1)@JsonKey(name: 'first_name') String firstName,@HiveField(2)@JsonKey(name: 'last_name') String lastName,@HiveField(3) String? nickname,@HiveField(4)@JsonKey(name: 'emirates_id') String? emiratesId,@HiveField(5)@JsonKey(name: 'created_at') DateTime? createdAt,@HiveField(6)@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$ProfileDetailsCopyWithImpl<$Res>
    implements _$ProfileDetailsCopyWith<$Res> {
  __$ProfileDetailsCopyWithImpl(this._self, this._then);

  final _ProfileDetails _self;
  final $Res Function(_ProfileDetails) _then;

/// Create a copy of ProfileDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profileId = null,Object? firstName = null,Object? lastName = null,Object? nickname = freezed,Object? emiratesId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ProfileDetails(
profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,emiratesId: freezed == emiratesId ? _self.emiratesId : emiratesId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
