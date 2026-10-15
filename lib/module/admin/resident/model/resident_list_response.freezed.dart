// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resident_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResidentListResponse {

@JsonKey(name: 'resident_name') String get residentName; Profile get profile;@JsonKey(name: 'profile_details') ProfileDetails? get profileDetails;@JsonKey(name: 'resident_status') ResidentStatus get residentStatus;@JsonKey(name: 'current_unit_id') String? get currentUnitId;@JsonKey(name: 'current_unit_name') String? get currentUnitName;@JsonKey(name: 'community_id') String? get communityId;@JsonKey(name: 'community_name') String? get communityName;
/// Create a copy of ResidentListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResidentListResponseCopyWith<ResidentListResponse> get copyWith => _$ResidentListResponseCopyWithImpl<ResidentListResponse>(this as ResidentListResponse, _$identity);

  /// Serializes this ResidentListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResidentListResponse&&(identical(other.residentName, residentName) || other.residentName == residentName)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.profileDetails, profileDetails) || other.profileDetails == profileDetails)&&(identical(other.residentStatus, residentStatus) || other.residentStatus == residentStatus)&&(identical(other.currentUnitId, currentUnitId) || other.currentUnitId == currentUnitId)&&(identical(other.currentUnitName, currentUnitName) || other.currentUnitName == currentUnitName)&&(identical(other.communityId, communityId) || other.communityId == communityId)&&(identical(other.communityName, communityName) || other.communityName == communityName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,residentName,profile,profileDetails,residentStatus,currentUnitId,currentUnitName,communityId,communityName);

@override
String toString() {
  return 'ResidentListResponse(residentName: $residentName, profile: $profile, profileDetails: $profileDetails, residentStatus: $residentStatus, currentUnitId: $currentUnitId, currentUnitName: $currentUnitName, communityId: $communityId, communityName: $communityName)';
}


}

/// @nodoc
abstract mixin class $ResidentListResponseCopyWith<$Res>  {
  factory $ResidentListResponseCopyWith(ResidentListResponse value, $Res Function(ResidentListResponse) _then) = _$ResidentListResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'resident_name') String residentName, Profile profile,@JsonKey(name: 'profile_details') ProfileDetails? profileDetails,@JsonKey(name: 'resident_status') ResidentStatus residentStatus,@JsonKey(name: 'current_unit_id') String? currentUnitId,@JsonKey(name: 'current_unit_name') String? currentUnitName,@JsonKey(name: 'community_id') String? communityId,@JsonKey(name: 'community_name') String? communityName
});


$ProfileCopyWith<$Res> get profile;$ProfileDetailsCopyWith<$Res>? get profileDetails;

}
/// @nodoc
class _$ResidentListResponseCopyWithImpl<$Res>
    implements $ResidentListResponseCopyWith<$Res> {
  _$ResidentListResponseCopyWithImpl(this._self, this._then);

  final ResidentListResponse _self;
  final $Res Function(ResidentListResponse) _then;

/// Create a copy of ResidentListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? residentName = null,Object? profile = null,Object? profileDetails = freezed,Object? residentStatus = null,Object? currentUnitId = freezed,Object? currentUnitName = freezed,Object? communityId = freezed,Object? communityName = freezed,}) {
  return _then(_self.copyWith(
residentName: null == residentName ? _self.residentName : residentName // ignore: cast_nullable_to_non_nullable
as String,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profile,profileDetails: freezed == profileDetails ? _self.profileDetails : profileDetails // ignore: cast_nullable_to_non_nullable
as ProfileDetails?,residentStatus: null == residentStatus ? _self.residentStatus : residentStatus // ignore: cast_nullable_to_non_nullable
as ResidentStatus,currentUnitId: freezed == currentUnitId ? _self.currentUnitId : currentUnitId // ignore: cast_nullable_to_non_nullable
as String?,currentUnitName: freezed == currentUnitName ? _self.currentUnitName : currentUnitName // ignore: cast_nullable_to_non_nullable
as String?,communityId: freezed == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String?,communityName: freezed == communityName ? _self.communityName : communityName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ResidentListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res> get profile {
  
  return $ProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of ResidentListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileDetailsCopyWith<$Res>? get profileDetails {
    if (_self.profileDetails == null) {
    return null;
  }

  return $ProfileDetailsCopyWith<$Res>(_self.profileDetails!, (value) {
    return _then(_self.copyWith(profileDetails: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResidentListResponse].
extension ResidentListResponsePatterns on ResidentListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResidentListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResidentListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResidentListResponse value)  $default,){
final _that = this;
switch (_that) {
case _ResidentListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResidentListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ResidentListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'resident_name')  String residentName,  Profile profile, @JsonKey(name: 'profile_details')  ProfileDetails? profileDetails, @JsonKey(name: 'resident_status')  ResidentStatus residentStatus, @JsonKey(name: 'current_unit_id')  String? currentUnitId, @JsonKey(name: 'current_unit_name')  String? currentUnitName, @JsonKey(name: 'community_id')  String? communityId, @JsonKey(name: 'community_name')  String? communityName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResidentListResponse() when $default != null:
return $default(_that.residentName,_that.profile,_that.profileDetails,_that.residentStatus,_that.currentUnitId,_that.currentUnitName,_that.communityId,_that.communityName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'resident_name')  String residentName,  Profile profile, @JsonKey(name: 'profile_details')  ProfileDetails? profileDetails, @JsonKey(name: 'resident_status')  ResidentStatus residentStatus, @JsonKey(name: 'current_unit_id')  String? currentUnitId, @JsonKey(name: 'current_unit_name')  String? currentUnitName, @JsonKey(name: 'community_id')  String? communityId, @JsonKey(name: 'community_name')  String? communityName)  $default,) {final _that = this;
switch (_that) {
case _ResidentListResponse():
return $default(_that.residentName,_that.profile,_that.profileDetails,_that.residentStatus,_that.currentUnitId,_that.currentUnitName,_that.communityId,_that.communityName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'resident_name')  String residentName,  Profile profile, @JsonKey(name: 'profile_details')  ProfileDetails? profileDetails, @JsonKey(name: 'resident_status')  ResidentStatus residentStatus, @JsonKey(name: 'current_unit_id')  String? currentUnitId, @JsonKey(name: 'current_unit_name')  String? currentUnitName, @JsonKey(name: 'community_id')  String? communityId, @JsonKey(name: 'community_name')  String? communityName)?  $default,) {final _that = this;
switch (_that) {
case _ResidentListResponse() when $default != null:
return $default(_that.residentName,_that.profile,_that.profileDetails,_that.residentStatus,_that.currentUnitId,_that.currentUnitName,_that.communityId,_that.communityName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResidentListResponse implements ResidentListResponse {
  const _ResidentListResponse({@JsonKey(name: 'resident_name') required this.residentName, required this.profile, @JsonKey(name: 'profile_details') this.profileDetails, @JsonKey(name: 'resident_status') required this.residentStatus, @JsonKey(name: 'current_unit_id') this.currentUnitId, @JsonKey(name: 'current_unit_name') this.currentUnitName, @JsonKey(name: 'community_id') this.communityId, @JsonKey(name: 'community_name') this.communityName});
  factory _ResidentListResponse.fromJson(Map<String, dynamic> json) => _$ResidentListResponseFromJson(json);

@override@JsonKey(name: 'resident_name') final  String residentName;
@override final  Profile profile;
@override@JsonKey(name: 'profile_details') final  ProfileDetails? profileDetails;
@override@JsonKey(name: 'resident_status') final  ResidentStatus residentStatus;
@override@JsonKey(name: 'current_unit_id') final  String? currentUnitId;
@override@JsonKey(name: 'current_unit_name') final  String? currentUnitName;
@override@JsonKey(name: 'community_id') final  String? communityId;
@override@JsonKey(name: 'community_name') final  String? communityName;

/// Create a copy of ResidentListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResidentListResponseCopyWith<_ResidentListResponse> get copyWith => __$ResidentListResponseCopyWithImpl<_ResidentListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResidentListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResidentListResponse&&(identical(other.residentName, residentName) || other.residentName == residentName)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.profileDetails, profileDetails) || other.profileDetails == profileDetails)&&(identical(other.residentStatus, residentStatus) || other.residentStatus == residentStatus)&&(identical(other.currentUnitId, currentUnitId) || other.currentUnitId == currentUnitId)&&(identical(other.currentUnitName, currentUnitName) || other.currentUnitName == currentUnitName)&&(identical(other.communityId, communityId) || other.communityId == communityId)&&(identical(other.communityName, communityName) || other.communityName == communityName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,residentName,profile,profileDetails,residentStatus,currentUnitId,currentUnitName,communityId,communityName);

@override
String toString() {
  return 'ResidentListResponse(residentName: $residentName, profile: $profile, profileDetails: $profileDetails, residentStatus: $residentStatus, currentUnitId: $currentUnitId, currentUnitName: $currentUnitName, communityId: $communityId, communityName: $communityName)';
}


}

/// @nodoc
abstract mixin class _$ResidentListResponseCopyWith<$Res> implements $ResidentListResponseCopyWith<$Res> {
  factory _$ResidentListResponseCopyWith(_ResidentListResponse value, $Res Function(_ResidentListResponse) _then) = __$ResidentListResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'resident_name') String residentName, Profile profile,@JsonKey(name: 'profile_details') ProfileDetails? profileDetails,@JsonKey(name: 'resident_status') ResidentStatus residentStatus,@JsonKey(name: 'current_unit_id') String? currentUnitId,@JsonKey(name: 'current_unit_name') String? currentUnitName,@JsonKey(name: 'community_id') String? communityId,@JsonKey(name: 'community_name') String? communityName
});


@override $ProfileCopyWith<$Res> get profile;@override $ProfileDetailsCopyWith<$Res>? get profileDetails;

}
/// @nodoc
class __$ResidentListResponseCopyWithImpl<$Res>
    implements _$ResidentListResponseCopyWith<$Res> {
  __$ResidentListResponseCopyWithImpl(this._self, this._then);

  final _ResidentListResponse _self;
  final $Res Function(_ResidentListResponse) _then;

/// Create a copy of ResidentListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? residentName = null,Object? profile = null,Object? profileDetails = freezed,Object? residentStatus = null,Object? currentUnitId = freezed,Object? currentUnitName = freezed,Object? communityId = freezed,Object? communityName = freezed,}) {
  return _then(_ResidentListResponse(
residentName: null == residentName ? _self.residentName : residentName // ignore: cast_nullable_to_non_nullable
as String,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profile,profileDetails: freezed == profileDetails ? _self.profileDetails : profileDetails // ignore: cast_nullable_to_non_nullable
as ProfileDetails?,residentStatus: null == residentStatus ? _self.residentStatus : residentStatus // ignore: cast_nullable_to_non_nullable
as ResidentStatus,currentUnitId: freezed == currentUnitId ? _self.currentUnitId : currentUnitId // ignore: cast_nullable_to_non_nullable
as String?,currentUnitName: freezed == currentUnitName ? _self.currentUnitName : currentUnitName // ignore: cast_nullable_to_non_nullable
as String?,communityId: freezed == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String?,communityName: freezed == communityName ? _self.communityName : communityName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ResidentListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res> get profile {
  
  return $ProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of ResidentListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileDetailsCopyWith<$Res>? get profileDetails {
    if (_self.profileDetails == null) {
    return null;
  }

  return $ProfileDetailsCopyWith<$Res>(_self.profileDetails!, (value) {
    return _then(_self.copyWith(profileDetails: value));
  });
}
}

// dart format on
