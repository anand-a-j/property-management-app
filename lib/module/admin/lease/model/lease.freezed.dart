// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lease.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Lease {

 String get id;@JsonKey(name: 'lease_number') String get leaseNumber;@JsonKey(name: 'unit_id') String get unitId;@JsonKey(name: 'resident_id') String get residentId;@JsonKey(name: 'start_date') DateTime get startDate;@JsonKey(name: 'end_date') DateTime get endDate;@JsonKey(name: 'annual_rent') double get annualRent;@JsonKey(name: 'security_deposit') double get securityDeposit;@JsonKey(name: 'payment_frequency') PaymentFrequency get paymentFrequency;@JsonKey(name: 'number_of_cheques') int get numberOfCheques; LeaseStatus get status; String? get description;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(name: 'deleted_at') DateTime? get deletedAt;
/// Create a copy of Lease
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaseCopyWith<Lease> get copyWith => _$LeaseCopyWithImpl<Lease>(this as Lease, _$identity);

  /// Serializes this Lease to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Lease&&(identical(other.id, id) || other.id == id)&&(identical(other.leaseNumber, leaseNumber) || other.leaseNumber == leaseNumber)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.annualRent, annualRent) || other.annualRent == annualRent)&&(identical(other.securityDeposit, securityDeposit) || other.securityDeposit == securityDeposit)&&(identical(other.paymentFrequency, paymentFrequency) || other.paymentFrequency == paymentFrequency)&&(identical(other.numberOfCheques, numberOfCheques) || other.numberOfCheques == numberOfCheques)&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,leaseNumber,unitId,residentId,startDate,endDate,annualRent,securityDeposit,paymentFrequency,numberOfCheques,status,description,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'Lease(id: $id, leaseNumber: $leaseNumber, unitId: $unitId, residentId: $residentId, startDate: $startDate, endDate: $endDate, annualRent: $annualRent, securityDeposit: $securityDeposit, paymentFrequency: $paymentFrequency, numberOfCheques: $numberOfCheques, status: $status, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $LeaseCopyWith<$Res>  {
  factory $LeaseCopyWith(Lease value, $Res Function(Lease) _then) = _$LeaseCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'lease_number') String leaseNumber,@JsonKey(name: 'unit_id') String unitId,@JsonKey(name: 'resident_id') String residentId,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate,@JsonKey(name: 'annual_rent') double annualRent,@JsonKey(name: 'security_deposit') double securityDeposit,@JsonKey(name: 'payment_frequency') PaymentFrequency paymentFrequency,@JsonKey(name: 'number_of_cheques') int numberOfCheques, LeaseStatus status, String? description,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'deleted_at') DateTime? deletedAt
});




}
/// @nodoc
class _$LeaseCopyWithImpl<$Res>
    implements $LeaseCopyWith<$Res> {
  _$LeaseCopyWithImpl(this._self, this._then);

  final Lease _self;
  final $Res Function(Lease) _then;

/// Create a copy of Lease
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? leaseNumber = null,Object? unitId = null,Object? residentId = null,Object? startDate = null,Object? endDate = null,Object? annualRent = null,Object? securityDeposit = null,Object? paymentFrequency = null,Object? numberOfCheques = null,Object? status = null,Object? description = freezed,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,leaseNumber: null == leaseNumber ? _self.leaseNumber : leaseNumber // ignore: cast_nullable_to_non_nullable
as String,unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String,residentId: null == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,annualRent: null == annualRent ? _self.annualRent : annualRent // ignore: cast_nullable_to_non_nullable
as double,securityDeposit: null == securityDeposit ? _self.securityDeposit : securityDeposit // ignore: cast_nullable_to_non_nullable
as double,paymentFrequency: null == paymentFrequency ? _self.paymentFrequency : paymentFrequency // ignore: cast_nullable_to_non_nullable
as PaymentFrequency,numberOfCheques: null == numberOfCheques ? _self.numberOfCheques : numberOfCheques // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LeaseStatus,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Lease].
extension LeasePatterns on Lease {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Lease value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Lease() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Lease value)  $default,){
final _that = this;
switch (_that) {
case _Lease():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Lease value)?  $default,){
final _that = this;
switch (_that) {
case _Lease() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'lease_number')  String leaseNumber, @JsonKey(name: 'unit_id')  String unitId, @JsonKey(name: 'resident_id')  String residentId, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate, @JsonKey(name: 'annual_rent')  double annualRent, @JsonKey(name: 'security_deposit')  double securityDeposit, @JsonKey(name: 'payment_frequency')  PaymentFrequency paymentFrequency, @JsonKey(name: 'number_of_cheques')  int numberOfCheques,  LeaseStatus status,  String? description, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'deleted_at')  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Lease() when $default != null:
return $default(_that.id,_that.leaseNumber,_that.unitId,_that.residentId,_that.startDate,_that.endDate,_that.annualRent,_that.securityDeposit,_that.paymentFrequency,_that.numberOfCheques,_that.status,_that.description,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'lease_number')  String leaseNumber, @JsonKey(name: 'unit_id')  String unitId, @JsonKey(name: 'resident_id')  String residentId, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate, @JsonKey(name: 'annual_rent')  double annualRent, @JsonKey(name: 'security_deposit')  double securityDeposit, @JsonKey(name: 'payment_frequency')  PaymentFrequency paymentFrequency, @JsonKey(name: 'number_of_cheques')  int numberOfCheques,  LeaseStatus status,  String? description, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'deleted_at')  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _Lease():
return $default(_that.id,_that.leaseNumber,_that.unitId,_that.residentId,_that.startDate,_that.endDate,_that.annualRent,_that.securityDeposit,_that.paymentFrequency,_that.numberOfCheques,_that.status,_that.description,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'lease_number')  String leaseNumber, @JsonKey(name: 'unit_id')  String unitId, @JsonKey(name: 'resident_id')  String residentId, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate, @JsonKey(name: 'annual_rent')  double annualRent, @JsonKey(name: 'security_deposit')  double securityDeposit, @JsonKey(name: 'payment_frequency')  PaymentFrequency paymentFrequency, @JsonKey(name: 'number_of_cheques')  int numberOfCheques,  LeaseStatus status,  String? description, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'deleted_at')  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _Lease() when $default != null:
return $default(_that.id,_that.leaseNumber,_that.unitId,_that.residentId,_that.startDate,_that.endDate,_that.annualRent,_that.securityDeposit,_that.paymentFrequency,_that.numberOfCheques,_that.status,_that.description,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Lease implements Lease {
  const _Lease({required this.id, @JsonKey(name: 'lease_number') required this.leaseNumber, @JsonKey(name: 'unit_id') required this.unitId, @JsonKey(name: 'resident_id') required this.residentId, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate, @JsonKey(name: 'annual_rent') required this.annualRent, @JsonKey(name: 'security_deposit') this.securityDeposit = 0, @JsonKey(name: 'payment_frequency') required this.paymentFrequency, @JsonKey(name: 'number_of_cheques') this.numberOfCheques = 1, this.status = LeaseStatus.draft, this.description, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'deleted_at') this.deletedAt});
  factory _Lease.fromJson(Map<String, dynamic> json) => _$LeaseFromJson(json);

@override final  String id;
@override@JsonKey(name: 'lease_number') final  String leaseNumber;
@override@JsonKey(name: 'unit_id') final  String unitId;
@override@JsonKey(name: 'resident_id') final  String residentId;
@override@JsonKey(name: 'start_date') final  DateTime startDate;
@override@JsonKey(name: 'end_date') final  DateTime endDate;
@override@JsonKey(name: 'annual_rent') final  double annualRent;
@override@JsonKey(name: 'security_deposit') final  double securityDeposit;
@override@JsonKey(name: 'payment_frequency') final  PaymentFrequency paymentFrequency;
@override@JsonKey(name: 'number_of_cheques') final  int numberOfCheques;
@override@JsonKey() final  LeaseStatus status;
@override final  String? description;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override@JsonKey(name: 'deleted_at') final  DateTime? deletedAt;

/// Create a copy of Lease
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaseCopyWith<_Lease> get copyWith => __$LeaseCopyWithImpl<_Lease>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Lease&&(identical(other.id, id) || other.id == id)&&(identical(other.leaseNumber, leaseNumber) || other.leaseNumber == leaseNumber)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.annualRent, annualRent) || other.annualRent == annualRent)&&(identical(other.securityDeposit, securityDeposit) || other.securityDeposit == securityDeposit)&&(identical(other.paymentFrequency, paymentFrequency) || other.paymentFrequency == paymentFrequency)&&(identical(other.numberOfCheques, numberOfCheques) || other.numberOfCheques == numberOfCheques)&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,leaseNumber,unitId,residentId,startDate,endDate,annualRent,securityDeposit,paymentFrequency,numberOfCheques,status,description,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'Lease(id: $id, leaseNumber: $leaseNumber, unitId: $unitId, residentId: $residentId, startDate: $startDate, endDate: $endDate, annualRent: $annualRent, securityDeposit: $securityDeposit, paymentFrequency: $paymentFrequency, numberOfCheques: $numberOfCheques, status: $status, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$LeaseCopyWith<$Res> implements $LeaseCopyWith<$Res> {
  factory _$LeaseCopyWith(_Lease value, $Res Function(_Lease) _then) = __$LeaseCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'lease_number') String leaseNumber,@JsonKey(name: 'unit_id') String unitId,@JsonKey(name: 'resident_id') String residentId,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate,@JsonKey(name: 'annual_rent') double annualRent,@JsonKey(name: 'security_deposit') double securityDeposit,@JsonKey(name: 'payment_frequency') PaymentFrequency paymentFrequency,@JsonKey(name: 'number_of_cheques') int numberOfCheques, LeaseStatus status, String? description,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'deleted_at') DateTime? deletedAt
});




}
/// @nodoc
class __$LeaseCopyWithImpl<$Res>
    implements _$LeaseCopyWith<$Res> {
  __$LeaseCopyWithImpl(this._self, this._then);

  final _Lease _self;
  final $Res Function(_Lease) _then;

/// Create a copy of Lease
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? leaseNumber = null,Object? unitId = null,Object? residentId = null,Object? startDate = null,Object? endDate = null,Object? annualRent = null,Object? securityDeposit = null,Object? paymentFrequency = null,Object? numberOfCheques = null,Object? status = null,Object? description = freezed,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_Lease(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,leaseNumber: null == leaseNumber ? _self.leaseNumber : leaseNumber // ignore: cast_nullable_to_non_nullable
as String,unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String,residentId: null == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,annualRent: null == annualRent ? _self.annualRent : annualRent // ignore: cast_nullable_to_non_nullable
as double,securityDeposit: null == securityDeposit ? _self.securityDeposit : securityDeposit // ignore: cast_nullable_to_non_nullable
as double,paymentFrequency: null == paymentFrequency ? _self.paymentFrequency : paymentFrequency // ignore: cast_nullable_to_non_nullable
as PaymentFrequency,numberOfCheques: null == numberOfCheques ? _self.numberOfCheques : numberOfCheques // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LeaseStatus,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
