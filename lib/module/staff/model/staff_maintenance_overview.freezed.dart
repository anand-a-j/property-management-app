// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_maintenance_overview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StaffMaintenanceOverview {

 int get totalTickets; int get pendingReview; int get activeTickets; int get completedTickets; List<MaintenanceRequest> get maintenanceList;
/// Create a copy of StaffMaintenanceOverview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StaffMaintenanceOverviewCopyWith<StaffMaintenanceOverview> get copyWith => _$StaffMaintenanceOverviewCopyWithImpl<StaffMaintenanceOverview>(this as StaffMaintenanceOverview, _$identity);

  /// Serializes this StaffMaintenanceOverview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StaffMaintenanceOverview&&(identical(other.totalTickets, totalTickets) || other.totalTickets == totalTickets)&&(identical(other.pendingReview, pendingReview) || other.pendingReview == pendingReview)&&(identical(other.activeTickets, activeTickets) || other.activeTickets == activeTickets)&&(identical(other.completedTickets, completedTickets) || other.completedTickets == completedTickets)&&const DeepCollectionEquality().equals(other.maintenanceList, maintenanceList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalTickets,pendingReview,activeTickets,completedTickets,const DeepCollectionEquality().hash(maintenanceList));

@override
String toString() {
  return 'StaffMaintenanceOverview(totalTickets: $totalTickets, pendingReview: $pendingReview, activeTickets: $activeTickets, completedTickets: $completedTickets, maintenanceList: $maintenanceList)';
}


}

/// @nodoc
abstract mixin class $StaffMaintenanceOverviewCopyWith<$Res>  {
  factory $StaffMaintenanceOverviewCopyWith(StaffMaintenanceOverview value, $Res Function(StaffMaintenanceOverview) _then) = _$StaffMaintenanceOverviewCopyWithImpl;
@useResult
$Res call({
 int totalTickets, int pendingReview, int activeTickets, int completedTickets, List<MaintenanceRequest> maintenanceList
});




}
/// @nodoc
class _$StaffMaintenanceOverviewCopyWithImpl<$Res>
    implements $StaffMaintenanceOverviewCopyWith<$Res> {
  _$StaffMaintenanceOverviewCopyWithImpl(this._self, this._then);

  final StaffMaintenanceOverview _self;
  final $Res Function(StaffMaintenanceOverview) _then;

/// Create a copy of StaffMaintenanceOverview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalTickets = null,Object? pendingReview = null,Object? activeTickets = null,Object? completedTickets = null,Object? maintenanceList = null,}) {
  return _then(_self.copyWith(
totalTickets: null == totalTickets ? _self.totalTickets : totalTickets // ignore: cast_nullable_to_non_nullable
as int,pendingReview: null == pendingReview ? _self.pendingReview : pendingReview // ignore: cast_nullable_to_non_nullable
as int,activeTickets: null == activeTickets ? _self.activeTickets : activeTickets // ignore: cast_nullable_to_non_nullable
as int,completedTickets: null == completedTickets ? _self.completedTickets : completedTickets // ignore: cast_nullable_to_non_nullable
as int,maintenanceList: null == maintenanceList ? _self.maintenanceList : maintenanceList // ignore: cast_nullable_to_non_nullable
as List<MaintenanceRequest>,
  ));
}

}


/// Adds pattern-matching-related methods to [StaffMaintenanceOverview].
extension StaffMaintenanceOverviewPatterns on StaffMaintenanceOverview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StaffMaintenanceOverview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StaffMaintenanceOverview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StaffMaintenanceOverview value)  $default,){
final _that = this;
switch (_that) {
case _StaffMaintenanceOverview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StaffMaintenanceOverview value)?  $default,){
final _that = this;
switch (_that) {
case _StaffMaintenanceOverview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalTickets,  int pendingReview,  int activeTickets,  int completedTickets,  List<MaintenanceRequest> maintenanceList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StaffMaintenanceOverview() when $default != null:
return $default(_that.totalTickets,_that.pendingReview,_that.activeTickets,_that.completedTickets,_that.maintenanceList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalTickets,  int pendingReview,  int activeTickets,  int completedTickets,  List<MaintenanceRequest> maintenanceList)  $default,) {final _that = this;
switch (_that) {
case _StaffMaintenanceOverview():
return $default(_that.totalTickets,_that.pendingReview,_that.activeTickets,_that.completedTickets,_that.maintenanceList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalTickets,  int pendingReview,  int activeTickets,  int completedTickets,  List<MaintenanceRequest> maintenanceList)?  $default,) {final _that = this;
switch (_that) {
case _StaffMaintenanceOverview() when $default != null:
return $default(_that.totalTickets,_that.pendingReview,_that.activeTickets,_that.completedTickets,_that.maintenanceList);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StaffMaintenanceOverview implements StaffMaintenanceOverview {
  const _StaffMaintenanceOverview({this.totalTickets = 0, this.pendingReview = 0, this.activeTickets = 0, this.completedTickets = 0, final  List<MaintenanceRequest> maintenanceList = const []}): _maintenanceList = maintenanceList;
  factory _StaffMaintenanceOverview.fromJson(Map<String, dynamic> json) => _$StaffMaintenanceOverviewFromJson(json);

@override@JsonKey() final  int totalTickets;
@override@JsonKey() final  int pendingReview;
@override@JsonKey() final  int activeTickets;
@override@JsonKey() final  int completedTickets;
 final  List<MaintenanceRequest> _maintenanceList;
@override@JsonKey() List<MaintenanceRequest> get maintenanceList {
  if (_maintenanceList is EqualUnmodifiableListView) return _maintenanceList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_maintenanceList);
}


/// Create a copy of StaffMaintenanceOverview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StaffMaintenanceOverviewCopyWith<_StaffMaintenanceOverview> get copyWith => __$StaffMaintenanceOverviewCopyWithImpl<_StaffMaintenanceOverview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StaffMaintenanceOverviewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StaffMaintenanceOverview&&(identical(other.totalTickets, totalTickets) || other.totalTickets == totalTickets)&&(identical(other.pendingReview, pendingReview) || other.pendingReview == pendingReview)&&(identical(other.activeTickets, activeTickets) || other.activeTickets == activeTickets)&&(identical(other.completedTickets, completedTickets) || other.completedTickets == completedTickets)&&const DeepCollectionEquality().equals(other._maintenanceList, _maintenanceList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalTickets,pendingReview,activeTickets,completedTickets,const DeepCollectionEquality().hash(_maintenanceList));

@override
String toString() {
  return 'StaffMaintenanceOverview(totalTickets: $totalTickets, pendingReview: $pendingReview, activeTickets: $activeTickets, completedTickets: $completedTickets, maintenanceList: $maintenanceList)';
}


}

/// @nodoc
abstract mixin class _$StaffMaintenanceOverviewCopyWith<$Res> implements $StaffMaintenanceOverviewCopyWith<$Res> {
  factory _$StaffMaintenanceOverviewCopyWith(_StaffMaintenanceOverview value, $Res Function(_StaffMaintenanceOverview) _then) = __$StaffMaintenanceOverviewCopyWithImpl;
@override @useResult
$Res call({
 int totalTickets, int pendingReview, int activeTickets, int completedTickets, List<MaintenanceRequest> maintenanceList
});




}
/// @nodoc
class __$StaffMaintenanceOverviewCopyWithImpl<$Res>
    implements _$StaffMaintenanceOverviewCopyWith<$Res> {
  __$StaffMaintenanceOverviewCopyWithImpl(this._self, this._then);

  final _StaffMaintenanceOverview _self;
  final $Res Function(_StaffMaintenanceOverview) _then;

/// Create a copy of StaffMaintenanceOverview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalTickets = null,Object? pendingReview = null,Object? activeTickets = null,Object? completedTickets = null,Object? maintenanceList = null,}) {
  return _then(_StaffMaintenanceOverview(
totalTickets: null == totalTickets ? _self.totalTickets : totalTickets // ignore: cast_nullable_to_non_nullable
as int,pendingReview: null == pendingReview ? _self.pendingReview : pendingReview // ignore: cast_nullable_to_non_nullable
as int,activeTickets: null == activeTickets ? _self.activeTickets : activeTickets // ignore: cast_nullable_to_non_nullable
as int,completedTickets: null == completedTickets ? _self.completedTickets : completedTickets // ignore: cast_nullable_to_non_nullable
as int,maintenanceList: null == maintenanceList ? _self._maintenanceList : maintenanceList // ignore: cast_nullable_to_non_nullable
as List<MaintenanceRequest>,
  ));
}


}

// dart format on
