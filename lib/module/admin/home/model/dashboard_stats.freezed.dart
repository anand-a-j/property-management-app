// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardStats {

 int get totalUnits; int get occupied; int get vacant; int get maintenance; int get rentCollected; int get overdueCount; double get rentDueTotal;
/// Create a copy of DashboardStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardStatsCopyWith<DashboardStats> get copyWith => _$DashboardStatsCopyWithImpl<DashboardStats>(this as DashboardStats, _$identity);

  /// Serializes this DashboardStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardStats&&(identical(other.totalUnits, totalUnits) || other.totalUnits == totalUnits)&&(identical(other.occupied, occupied) || other.occupied == occupied)&&(identical(other.vacant, vacant) || other.vacant == vacant)&&(identical(other.maintenance, maintenance) || other.maintenance == maintenance)&&(identical(other.rentCollected, rentCollected) || other.rentCollected == rentCollected)&&(identical(other.overdueCount, overdueCount) || other.overdueCount == overdueCount)&&(identical(other.rentDueTotal, rentDueTotal) || other.rentDueTotal == rentDueTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalUnits,occupied,vacant,maintenance,rentCollected,overdueCount,rentDueTotal);

@override
String toString() {
  return 'DashboardStats(totalUnits: $totalUnits, occupied: $occupied, vacant: $vacant, maintenance: $maintenance, rentCollected: $rentCollected, overdueCount: $overdueCount, rentDueTotal: $rentDueTotal)';
}


}

/// @nodoc
abstract mixin class $DashboardStatsCopyWith<$Res>  {
  factory $DashboardStatsCopyWith(DashboardStats value, $Res Function(DashboardStats) _then) = _$DashboardStatsCopyWithImpl;
@useResult
$Res call({
 int totalUnits, int occupied, int vacant, int maintenance, int rentCollected, int overdueCount, double rentDueTotal
});




}
/// @nodoc
class _$DashboardStatsCopyWithImpl<$Res>
    implements $DashboardStatsCopyWith<$Res> {
  _$DashboardStatsCopyWithImpl(this._self, this._then);

  final DashboardStats _self;
  final $Res Function(DashboardStats) _then;

/// Create a copy of DashboardStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalUnits = null,Object? occupied = null,Object? vacant = null,Object? maintenance = null,Object? rentCollected = null,Object? overdueCount = null,Object? rentDueTotal = null,}) {
  return _then(_self.copyWith(
totalUnits: null == totalUnits ? _self.totalUnits : totalUnits // ignore: cast_nullable_to_non_nullable
as int,occupied: null == occupied ? _self.occupied : occupied // ignore: cast_nullable_to_non_nullable
as int,vacant: null == vacant ? _self.vacant : vacant // ignore: cast_nullable_to_non_nullable
as int,maintenance: null == maintenance ? _self.maintenance : maintenance // ignore: cast_nullable_to_non_nullable
as int,rentCollected: null == rentCollected ? _self.rentCollected : rentCollected // ignore: cast_nullable_to_non_nullable
as int,overdueCount: null == overdueCount ? _self.overdueCount : overdueCount // ignore: cast_nullable_to_non_nullable
as int,rentDueTotal: null == rentDueTotal ? _self.rentDueTotal : rentDueTotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardStats].
extension DashboardStatsPatterns on DashboardStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardStats value)  $default,){
final _that = this;
switch (_that) {
case _DashboardStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardStats value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalUnits,  int occupied,  int vacant,  int maintenance,  int rentCollected,  int overdueCount,  double rentDueTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardStats() when $default != null:
return $default(_that.totalUnits,_that.occupied,_that.vacant,_that.maintenance,_that.rentCollected,_that.overdueCount,_that.rentDueTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalUnits,  int occupied,  int vacant,  int maintenance,  int rentCollected,  int overdueCount,  double rentDueTotal)  $default,) {final _that = this;
switch (_that) {
case _DashboardStats():
return $default(_that.totalUnits,_that.occupied,_that.vacant,_that.maintenance,_that.rentCollected,_that.overdueCount,_that.rentDueTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalUnits,  int occupied,  int vacant,  int maintenance,  int rentCollected,  int overdueCount,  double rentDueTotal)?  $default,) {final _that = this;
switch (_that) {
case _DashboardStats() when $default != null:
return $default(_that.totalUnits,_that.occupied,_that.vacant,_that.maintenance,_that.rentCollected,_that.overdueCount,_that.rentDueTotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardStats implements DashboardStats {
  const _DashboardStats({this.totalUnits = 0, this.occupied = 0, this.vacant = 0, this.maintenance = 0, this.rentCollected = 0, this.overdueCount = 0, this.rentDueTotal = 0.0});
  factory _DashboardStats.fromJson(Map<String, dynamic> json) => _$DashboardStatsFromJson(json);

@override@JsonKey() final  int totalUnits;
@override@JsonKey() final  int occupied;
@override@JsonKey() final  int vacant;
@override@JsonKey() final  int maintenance;
@override@JsonKey() final  int rentCollected;
@override@JsonKey() final  int overdueCount;
@override@JsonKey() final  double rentDueTotal;

/// Create a copy of DashboardStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardStatsCopyWith<_DashboardStats> get copyWith => __$DashboardStatsCopyWithImpl<_DashboardStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardStats&&(identical(other.totalUnits, totalUnits) || other.totalUnits == totalUnits)&&(identical(other.occupied, occupied) || other.occupied == occupied)&&(identical(other.vacant, vacant) || other.vacant == vacant)&&(identical(other.maintenance, maintenance) || other.maintenance == maintenance)&&(identical(other.rentCollected, rentCollected) || other.rentCollected == rentCollected)&&(identical(other.overdueCount, overdueCount) || other.overdueCount == overdueCount)&&(identical(other.rentDueTotal, rentDueTotal) || other.rentDueTotal == rentDueTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalUnits,occupied,vacant,maintenance,rentCollected,overdueCount,rentDueTotal);

@override
String toString() {
  return 'DashboardStats(totalUnits: $totalUnits, occupied: $occupied, vacant: $vacant, maintenance: $maintenance, rentCollected: $rentCollected, overdueCount: $overdueCount, rentDueTotal: $rentDueTotal)';
}


}

/// @nodoc
abstract mixin class _$DashboardStatsCopyWith<$Res> implements $DashboardStatsCopyWith<$Res> {
  factory _$DashboardStatsCopyWith(_DashboardStats value, $Res Function(_DashboardStats) _then) = __$DashboardStatsCopyWithImpl;
@override @useResult
$Res call({
 int totalUnits, int occupied, int vacant, int maintenance, int rentCollected, int overdueCount, double rentDueTotal
});




}
/// @nodoc
class __$DashboardStatsCopyWithImpl<$Res>
    implements _$DashboardStatsCopyWith<$Res> {
  __$DashboardStatsCopyWithImpl(this._self, this._then);

  final _DashboardStats _self;
  final $Res Function(_DashboardStats) _then;

/// Create a copy of DashboardStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalUnits = null,Object? occupied = null,Object? vacant = null,Object? maintenance = null,Object? rentCollected = null,Object? overdueCount = null,Object? rentDueTotal = null,}) {
  return _then(_DashboardStats(
totalUnits: null == totalUnits ? _self.totalUnits : totalUnits // ignore: cast_nullable_to_non_nullable
as int,occupied: null == occupied ? _self.occupied : occupied // ignore: cast_nullable_to_non_nullable
as int,vacant: null == vacant ? _self.vacant : vacant // ignore: cast_nullable_to_non_nullable
as int,maintenance: null == maintenance ? _self.maintenance : maintenance // ignore: cast_nullable_to_non_nullable
as int,rentCollected: null == rentCollected ? _self.rentCollected : rentCollected // ignore: cast_nullable_to_non_nullable
as int,overdueCount: null == overdueCount ? _self.overdueCount : overdueCount // ignore: cast_nullable_to_non_nullable
as int,rentDueTotal: null == rentDueTotal ? _self.rentDueTotal : rentDueTotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
