// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resident_lease_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResidentLeaseDetails {

@JsonKey(name: 'lease_id') String get leaseId;@JsonKey(name: 'lease_number') String get leaseNumber;@JsonKey(name: 'resident_id') String get residentId;@JsonKey(name: 'lease_status') LeaseStatus get leaseStatus;@JsonKey(name: 'start_date') DateTime get startDate;@JsonKey(name: 'end_date') DateTime get endDate;@JsonKey(name: 'annual_rent') double get annualRent;@JsonKey(name: 'security_deposit') double get securityDeposit;@JsonKey(name: 'payment_frequency') String get paymentFrequency;@JsonKey(name: 'number_of_cheques') int get numberOfCheques;@JsonKey(name: 'lease_description') String? get leaseDescription;@JsonKey(name: 'unit_id') String get unitId;@JsonKey(name: 'unit_name') String get unitName;@JsonKey(name: 'community_id') String get communityId;@JsonKey(name: 'community_name') String get communityName;
/// Create a copy of ResidentLeaseDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResidentLeaseDetailsCopyWith<ResidentLeaseDetails> get copyWith => _$ResidentLeaseDetailsCopyWithImpl<ResidentLeaseDetails>(this as ResidentLeaseDetails, _$identity);

  /// Serializes this ResidentLeaseDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResidentLeaseDetails&&(identical(other.leaseId, leaseId) || other.leaseId == leaseId)&&(identical(other.leaseNumber, leaseNumber) || other.leaseNumber == leaseNumber)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.leaseStatus, leaseStatus) || other.leaseStatus == leaseStatus)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.annualRent, annualRent) || other.annualRent == annualRent)&&(identical(other.securityDeposit, securityDeposit) || other.securityDeposit == securityDeposit)&&(identical(other.paymentFrequency, paymentFrequency) || other.paymentFrequency == paymentFrequency)&&(identical(other.numberOfCheques, numberOfCheques) || other.numberOfCheques == numberOfCheques)&&(identical(other.leaseDescription, leaseDescription) || other.leaseDescription == leaseDescription)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.unitName, unitName) || other.unitName == unitName)&&(identical(other.communityId, communityId) || other.communityId == communityId)&&(identical(other.communityName, communityName) || other.communityName == communityName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leaseId,leaseNumber,residentId,leaseStatus,startDate,endDate,annualRent,securityDeposit,paymentFrequency,numberOfCheques,leaseDescription,unitId,unitName,communityId,communityName);

@override
String toString() {
  return 'ResidentLeaseDetails(leaseId: $leaseId, leaseNumber: $leaseNumber, residentId: $residentId, leaseStatus: $leaseStatus, startDate: $startDate, endDate: $endDate, annualRent: $annualRent, securityDeposit: $securityDeposit, paymentFrequency: $paymentFrequency, numberOfCheques: $numberOfCheques, leaseDescription: $leaseDescription, unitId: $unitId, unitName: $unitName, communityId: $communityId, communityName: $communityName)';
}


}

/// @nodoc
abstract mixin class $ResidentLeaseDetailsCopyWith<$Res>  {
  factory $ResidentLeaseDetailsCopyWith(ResidentLeaseDetails value, $Res Function(ResidentLeaseDetails) _then) = _$ResidentLeaseDetailsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'lease_id') String leaseId,@JsonKey(name: 'lease_number') String leaseNumber,@JsonKey(name: 'resident_id') String residentId,@JsonKey(name: 'lease_status') LeaseStatus leaseStatus,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate,@JsonKey(name: 'annual_rent') double annualRent,@JsonKey(name: 'security_deposit') double securityDeposit,@JsonKey(name: 'payment_frequency') String paymentFrequency,@JsonKey(name: 'number_of_cheques') int numberOfCheques,@JsonKey(name: 'lease_description') String? leaseDescription,@JsonKey(name: 'unit_id') String unitId,@JsonKey(name: 'unit_name') String unitName,@JsonKey(name: 'community_id') String communityId,@JsonKey(name: 'community_name') String communityName
});




}
/// @nodoc
class _$ResidentLeaseDetailsCopyWithImpl<$Res>
    implements $ResidentLeaseDetailsCopyWith<$Res> {
  _$ResidentLeaseDetailsCopyWithImpl(this._self, this._then);

  final ResidentLeaseDetails _self;
  final $Res Function(ResidentLeaseDetails) _then;

/// Create a copy of ResidentLeaseDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? leaseId = null,Object? leaseNumber = null,Object? residentId = null,Object? leaseStatus = null,Object? startDate = null,Object? endDate = null,Object? annualRent = null,Object? securityDeposit = null,Object? paymentFrequency = null,Object? numberOfCheques = null,Object? leaseDescription = freezed,Object? unitId = null,Object? unitName = null,Object? communityId = null,Object? communityName = null,}) {
  return _then(_self.copyWith(
leaseId: null == leaseId ? _self.leaseId : leaseId // ignore: cast_nullable_to_non_nullable
as String,leaseNumber: null == leaseNumber ? _self.leaseNumber : leaseNumber // ignore: cast_nullable_to_non_nullable
as String,residentId: null == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String,leaseStatus: null == leaseStatus ? _self.leaseStatus : leaseStatus // ignore: cast_nullable_to_non_nullable
as LeaseStatus,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,annualRent: null == annualRent ? _self.annualRent : annualRent // ignore: cast_nullable_to_non_nullable
as double,securityDeposit: null == securityDeposit ? _self.securityDeposit : securityDeposit // ignore: cast_nullable_to_non_nullable
as double,paymentFrequency: null == paymentFrequency ? _self.paymentFrequency : paymentFrequency // ignore: cast_nullable_to_non_nullable
as String,numberOfCheques: null == numberOfCheques ? _self.numberOfCheques : numberOfCheques // ignore: cast_nullable_to_non_nullable
as int,leaseDescription: freezed == leaseDescription ? _self.leaseDescription : leaseDescription // ignore: cast_nullable_to_non_nullable
as String?,unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String,unitName: null == unitName ? _self.unitName : unitName // ignore: cast_nullable_to_non_nullable
as String,communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,communityName: null == communityName ? _self.communityName : communityName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ResidentLeaseDetails].
extension ResidentLeaseDetailsPatterns on ResidentLeaseDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResidentLeaseDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResidentLeaseDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResidentLeaseDetails value)  $default,){
final _that = this;
switch (_that) {
case _ResidentLeaseDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResidentLeaseDetails value)?  $default,){
final _that = this;
switch (_that) {
case _ResidentLeaseDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'lease_id')  String leaseId, @JsonKey(name: 'lease_number')  String leaseNumber, @JsonKey(name: 'resident_id')  String residentId, @JsonKey(name: 'lease_status')  LeaseStatus leaseStatus, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate, @JsonKey(name: 'annual_rent')  double annualRent, @JsonKey(name: 'security_deposit')  double securityDeposit, @JsonKey(name: 'payment_frequency')  String paymentFrequency, @JsonKey(name: 'number_of_cheques')  int numberOfCheques, @JsonKey(name: 'lease_description')  String? leaseDescription, @JsonKey(name: 'unit_id')  String unitId, @JsonKey(name: 'unit_name')  String unitName, @JsonKey(name: 'community_id')  String communityId, @JsonKey(name: 'community_name')  String communityName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResidentLeaseDetails() when $default != null:
return $default(_that.leaseId,_that.leaseNumber,_that.residentId,_that.leaseStatus,_that.startDate,_that.endDate,_that.annualRent,_that.securityDeposit,_that.paymentFrequency,_that.numberOfCheques,_that.leaseDescription,_that.unitId,_that.unitName,_that.communityId,_that.communityName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'lease_id')  String leaseId, @JsonKey(name: 'lease_number')  String leaseNumber, @JsonKey(name: 'resident_id')  String residentId, @JsonKey(name: 'lease_status')  LeaseStatus leaseStatus, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate, @JsonKey(name: 'annual_rent')  double annualRent, @JsonKey(name: 'security_deposit')  double securityDeposit, @JsonKey(name: 'payment_frequency')  String paymentFrequency, @JsonKey(name: 'number_of_cheques')  int numberOfCheques, @JsonKey(name: 'lease_description')  String? leaseDescription, @JsonKey(name: 'unit_id')  String unitId, @JsonKey(name: 'unit_name')  String unitName, @JsonKey(name: 'community_id')  String communityId, @JsonKey(name: 'community_name')  String communityName)  $default,) {final _that = this;
switch (_that) {
case _ResidentLeaseDetails():
return $default(_that.leaseId,_that.leaseNumber,_that.residentId,_that.leaseStatus,_that.startDate,_that.endDate,_that.annualRent,_that.securityDeposit,_that.paymentFrequency,_that.numberOfCheques,_that.leaseDescription,_that.unitId,_that.unitName,_that.communityId,_that.communityName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'lease_id')  String leaseId, @JsonKey(name: 'lease_number')  String leaseNumber, @JsonKey(name: 'resident_id')  String residentId, @JsonKey(name: 'lease_status')  LeaseStatus leaseStatus, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate, @JsonKey(name: 'annual_rent')  double annualRent, @JsonKey(name: 'security_deposit')  double securityDeposit, @JsonKey(name: 'payment_frequency')  String paymentFrequency, @JsonKey(name: 'number_of_cheques')  int numberOfCheques, @JsonKey(name: 'lease_description')  String? leaseDescription, @JsonKey(name: 'unit_id')  String unitId, @JsonKey(name: 'unit_name')  String unitName, @JsonKey(name: 'community_id')  String communityId, @JsonKey(name: 'community_name')  String communityName)?  $default,) {final _that = this;
switch (_that) {
case _ResidentLeaseDetails() when $default != null:
return $default(_that.leaseId,_that.leaseNumber,_that.residentId,_that.leaseStatus,_that.startDate,_that.endDate,_that.annualRent,_that.securityDeposit,_that.paymentFrequency,_that.numberOfCheques,_that.leaseDescription,_that.unitId,_that.unitName,_that.communityId,_that.communityName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResidentLeaseDetails implements ResidentLeaseDetails {
  const _ResidentLeaseDetails({@JsonKey(name: 'lease_id') required this.leaseId, @JsonKey(name: 'lease_number') required this.leaseNumber, @JsonKey(name: 'resident_id') required this.residentId, @JsonKey(name: 'lease_status') required this.leaseStatus, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate, @JsonKey(name: 'annual_rent') required this.annualRent, @JsonKey(name: 'security_deposit') required this.securityDeposit, @JsonKey(name: 'payment_frequency') required this.paymentFrequency, @JsonKey(name: 'number_of_cheques') required this.numberOfCheques, @JsonKey(name: 'lease_description') this.leaseDescription, @JsonKey(name: 'unit_id') required this.unitId, @JsonKey(name: 'unit_name') required this.unitName, @JsonKey(name: 'community_id') required this.communityId, @JsonKey(name: 'community_name') required this.communityName});
  factory _ResidentLeaseDetails.fromJson(Map<String, dynamic> json) => _$ResidentLeaseDetailsFromJson(json);

@override@JsonKey(name: 'lease_id') final  String leaseId;
@override@JsonKey(name: 'lease_number') final  String leaseNumber;
@override@JsonKey(name: 'resident_id') final  String residentId;
@override@JsonKey(name: 'lease_status') final  LeaseStatus leaseStatus;
@override@JsonKey(name: 'start_date') final  DateTime startDate;
@override@JsonKey(name: 'end_date') final  DateTime endDate;
@override@JsonKey(name: 'annual_rent') final  double annualRent;
@override@JsonKey(name: 'security_deposit') final  double securityDeposit;
@override@JsonKey(name: 'payment_frequency') final  String paymentFrequency;
@override@JsonKey(name: 'number_of_cheques') final  int numberOfCheques;
@override@JsonKey(name: 'lease_description') final  String? leaseDescription;
@override@JsonKey(name: 'unit_id') final  String unitId;
@override@JsonKey(name: 'unit_name') final  String unitName;
@override@JsonKey(name: 'community_id') final  String communityId;
@override@JsonKey(name: 'community_name') final  String communityName;

/// Create a copy of ResidentLeaseDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResidentLeaseDetailsCopyWith<_ResidentLeaseDetails> get copyWith => __$ResidentLeaseDetailsCopyWithImpl<_ResidentLeaseDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResidentLeaseDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResidentLeaseDetails&&(identical(other.leaseId, leaseId) || other.leaseId == leaseId)&&(identical(other.leaseNumber, leaseNumber) || other.leaseNumber == leaseNumber)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.leaseStatus, leaseStatus) || other.leaseStatus == leaseStatus)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.annualRent, annualRent) || other.annualRent == annualRent)&&(identical(other.securityDeposit, securityDeposit) || other.securityDeposit == securityDeposit)&&(identical(other.paymentFrequency, paymentFrequency) || other.paymentFrequency == paymentFrequency)&&(identical(other.numberOfCheques, numberOfCheques) || other.numberOfCheques == numberOfCheques)&&(identical(other.leaseDescription, leaseDescription) || other.leaseDescription == leaseDescription)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.unitName, unitName) || other.unitName == unitName)&&(identical(other.communityId, communityId) || other.communityId == communityId)&&(identical(other.communityName, communityName) || other.communityName == communityName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leaseId,leaseNumber,residentId,leaseStatus,startDate,endDate,annualRent,securityDeposit,paymentFrequency,numberOfCheques,leaseDescription,unitId,unitName,communityId,communityName);

@override
String toString() {
  return 'ResidentLeaseDetails(leaseId: $leaseId, leaseNumber: $leaseNumber, residentId: $residentId, leaseStatus: $leaseStatus, startDate: $startDate, endDate: $endDate, annualRent: $annualRent, securityDeposit: $securityDeposit, paymentFrequency: $paymentFrequency, numberOfCheques: $numberOfCheques, leaseDescription: $leaseDescription, unitId: $unitId, unitName: $unitName, communityId: $communityId, communityName: $communityName)';
}


}

/// @nodoc
abstract mixin class _$ResidentLeaseDetailsCopyWith<$Res> implements $ResidentLeaseDetailsCopyWith<$Res> {
  factory _$ResidentLeaseDetailsCopyWith(_ResidentLeaseDetails value, $Res Function(_ResidentLeaseDetails) _then) = __$ResidentLeaseDetailsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'lease_id') String leaseId,@JsonKey(name: 'lease_number') String leaseNumber,@JsonKey(name: 'resident_id') String residentId,@JsonKey(name: 'lease_status') LeaseStatus leaseStatus,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate,@JsonKey(name: 'annual_rent') double annualRent,@JsonKey(name: 'security_deposit') double securityDeposit,@JsonKey(name: 'payment_frequency') String paymentFrequency,@JsonKey(name: 'number_of_cheques') int numberOfCheques,@JsonKey(name: 'lease_description') String? leaseDescription,@JsonKey(name: 'unit_id') String unitId,@JsonKey(name: 'unit_name') String unitName,@JsonKey(name: 'community_id') String communityId,@JsonKey(name: 'community_name') String communityName
});




}
/// @nodoc
class __$ResidentLeaseDetailsCopyWithImpl<$Res>
    implements _$ResidentLeaseDetailsCopyWith<$Res> {
  __$ResidentLeaseDetailsCopyWithImpl(this._self, this._then);

  final _ResidentLeaseDetails _self;
  final $Res Function(_ResidentLeaseDetails) _then;

/// Create a copy of ResidentLeaseDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? leaseId = null,Object? leaseNumber = null,Object? residentId = null,Object? leaseStatus = null,Object? startDate = null,Object? endDate = null,Object? annualRent = null,Object? securityDeposit = null,Object? paymentFrequency = null,Object? numberOfCheques = null,Object? leaseDescription = freezed,Object? unitId = null,Object? unitName = null,Object? communityId = null,Object? communityName = null,}) {
  return _then(_ResidentLeaseDetails(
leaseId: null == leaseId ? _self.leaseId : leaseId // ignore: cast_nullable_to_non_nullable
as String,leaseNumber: null == leaseNumber ? _self.leaseNumber : leaseNumber // ignore: cast_nullable_to_non_nullable
as String,residentId: null == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String,leaseStatus: null == leaseStatus ? _self.leaseStatus : leaseStatus // ignore: cast_nullable_to_non_nullable
as LeaseStatus,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,annualRent: null == annualRent ? _self.annualRent : annualRent // ignore: cast_nullable_to_non_nullable
as double,securityDeposit: null == securityDeposit ? _self.securityDeposit : securityDeposit // ignore: cast_nullable_to_non_nullable
as double,paymentFrequency: null == paymentFrequency ? _self.paymentFrequency : paymentFrequency // ignore: cast_nullable_to_non_nullable
as String,numberOfCheques: null == numberOfCheques ? _self.numberOfCheques : numberOfCheques // ignore: cast_nullable_to_non_nullable
as int,leaseDescription: freezed == leaseDescription ? _self.leaseDescription : leaseDescription // ignore: cast_nullable_to_non_nullable
as String?,unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String,unitName: null == unitName ? _self.unitName : unitName // ignore: cast_nullable_to_non_nullable
as String,communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,communityName: null == communityName ? _self.communityName : communityName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
