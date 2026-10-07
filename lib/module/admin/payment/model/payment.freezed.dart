// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Payment {

 String get id;@JsonKey(name: 'payment_number') String get paymentNumber;@JsonKey(name: 'lease_id') String get leaseId;@JsonKey(name: 'due_date') DateTime get dueDate; double get amount;@JsonKey(name: 'payment_type') PaymentType get paymentType; PaymentStatus get status;@JsonKey(name: 'paid_date') DateTime? get paidDate;@JsonKey(name: 'cheque_number') String? get chequeNumber; String? get description;@JsonKey(name: 'cheque_copy_path') String? get chequeCopyPath;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(name: 'deleted_at') DateTime? get deletedAt;
/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentCopyWith<Payment> get copyWith => _$PaymentCopyWithImpl<Payment>(this as Payment, _$identity);

  /// Serializes this Payment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Payment&&(identical(other.id, id) || other.id == id)&&(identical(other.paymentNumber, paymentNumber) || other.paymentNumber == paymentNumber)&&(identical(other.leaseId, leaseId) || other.leaseId == leaseId)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.status, status) || other.status == status)&&(identical(other.paidDate, paidDate) || other.paidDate == paidDate)&&(identical(other.chequeNumber, chequeNumber) || other.chequeNumber == chequeNumber)&&(identical(other.description, description) || other.description == description)&&(identical(other.chequeCopyPath, chequeCopyPath) || other.chequeCopyPath == chequeCopyPath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,paymentNumber,leaseId,dueDate,amount,paymentType,status,paidDate,chequeNumber,description,chequeCopyPath,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'Payment(id: $id, paymentNumber: $paymentNumber, leaseId: $leaseId, dueDate: $dueDate, amount: $amount, paymentType: $paymentType, status: $status, paidDate: $paidDate, chequeNumber: $chequeNumber, description: $description, chequeCopyPath: $chequeCopyPath, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $PaymentCopyWith<$Res>  {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) _then) = _$PaymentCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'payment_number') String paymentNumber,@JsonKey(name: 'lease_id') String leaseId,@JsonKey(name: 'due_date') DateTime dueDate, double amount,@JsonKey(name: 'payment_type') PaymentType paymentType, PaymentStatus status,@JsonKey(name: 'paid_date') DateTime? paidDate,@JsonKey(name: 'cheque_number') String? chequeNumber, String? description,@JsonKey(name: 'cheque_copy_path') String? chequeCopyPath,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'deleted_at') DateTime? deletedAt
});




}
/// @nodoc
class _$PaymentCopyWithImpl<$Res>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._self, this._then);

  final Payment _self;
  final $Res Function(Payment) _then;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? paymentNumber = null,Object? leaseId = null,Object? dueDate = null,Object? amount = null,Object? paymentType = null,Object? status = null,Object? paidDate = freezed,Object? chequeNumber = freezed,Object? description = freezed,Object? chequeCopyPath = freezed,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,paymentNumber: null == paymentNumber ? _self.paymentNumber : paymentNumber // ignore: cast_nullable_to_non_nullable
as String,leaseId: null == leaseId ? _self.leaseId : leaseId // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as PaymentType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PaymentStatus,paidDate: freezed == paidDate ? _self.paidDate : paidDate // ignore: cast_nullable_to_non_nullable
as DateTime?,chequeNumber: freezed == chequeNumber ? _self.chequeNumber : chequeNumber // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,chequeCopyPath: freezed == chequeCopyPath ? _self.chequeCopyPath : chequeCopyPath // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Payment].
extension PaymentPatterns on Payment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Payment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Payment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Payment value)  $default,){
final _that = this;
switch (_that) {
case _Payment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Payment value)?  $default,){
final _that = this;
switch (_that) {
case _Payment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'payment_number')  String paymentNumber, @JsonKey(name: 'lease_id')  String leaseId, @JsonKey(name: 'due_date')  DateTime dueDate,  double amount, @JsonKey(name: 'payment_type')  PaymentType paymentType,  PaymentStatus status, @JsonKey(name: 'paid_date')  DateTime? paidDate, @JsonKey(name: 'cheque_number')  String? chequeNumber,  String? description, @JsonKey(name: 'cheque_copy_path')  String? chequeCopyPath, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'deleted_at')  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that.id,_that.paymentNumber,_that.leaseId,_that.dueDate,_that.amount,_that.paymentType,_that.status,_that.paidDate,_that.chequeNumber,_that.description,_that.chequeCopyPath,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'payment_number')  String paymentNumber, @JsonKey(name: 'lease_id')  String leaseId, @JsonKey(name: 'due_date')  DateTime dueDate,  double amount, @JsonKey(name: 'payment_type')  PaymentType paymentType,  PaymentStatus status, @JsonKey(name: 'paid_date')  DateTime? paidDate, @JsonKey(name: 'cheque_number')  String? chequeNumber,  String? description, @JsonKey(name: 'cheque_copy_path')  String? chequeCopyPath, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'deleted_at')  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _Payment():
return $default(_that.id,_that.paymentNumber,_that.leaseId,_that.dueDate,_that.amount,_that.paymentType,_that.status,_that.paidDate,_that.chequeNumber,_that.description,_that.chequeCopyPath,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'payment_number')  String paymentNumber, @JsonKey(name: 'lease_id')  String leaseId, @JsonKey(name: 'due_date')  DateTime dueDate,  double amount, @JsonKey(name: 'payment_type')  PaymentType paymentType,  PaymentStatus status, @JsonKey(name: 'paid_date')  DateTime? paidDate, @JsonKey(name: 'cheque_number')  String? chequeNumber,  String? description, @JsonKey(name: 'cheque_copy_path')  String? chequeCopyPath, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'deleted_at')  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that.id,_that.paymentNumber,_that.leaseId,_that.dueDate,_that.amount,_that.paymentType,_that.status,_that.paidDate,_that.chequeNumber,_that.description,_that.chequeCopyPath,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Payment implements Payment {
  const _Payment({required this.id, @JsonKey(name: 'payment_number') required this.paymentNumber, @JsonKey(name: 'lease_id') required this.leaseId, @JsonKey(name: 'due_date') required this.dueDate, required this.amount, @JsonKey(name: 'payment_type') required this.paymentType, this.status = PaymentStatus.pending, @JsonKey(name: 'paid_date') this.paidDate, @JsonKey(name: 'cheque_number') this.chequeNumber, this.description, @JsonKey(name: 'cheque_copy_path') this.chequeCopyPath, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'deleted_at') this.deletedAt});
  factory _Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);

@override final  String id;
@override@JsonKey(name: 'payment_number') final  String paymentNumber;
@override@JsonKey(name: 'lease_id') final  String leaseId;
@override@JsonKey(name: 'due_date') final  DateTime dueDate;
@override final  double amount;
@override@JsonKey(name: 'payment_type') final  PaymentType paymentType;
@override@JsonKey() final  PaymentStatus status;
@override@JsonKey(name: 'paid_date') final  DateTime? paidDate;
@override@JsonKey(name: 'cheque_number') final  String? chequeNumber;
@override final  String? description;
@override@JsonKey(name: 'cheque_copy_path') final  String? chequeCopyPath;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override@JsonKey(name: 'deleted_at') final  DateTime? deletedAt;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentCopyWith<_Payment> get copyWith => __$PaymentCopyWithImpl<_Payment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Payment&&(identical(other.id, id) || other.id == id)&&(identical(other.paymentNumber, paymentNumber) || other.paymentNumber == paymentNumber)&&(identical(other.leaseId, leaseId) || other.leaseId == leaseId)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.status, status) || other.status == status)&&(identical(other.paidDate, paidDate) || other.paidDate == paidDate)&&(identical(other.chequeNumber, chequeNumber) || other.chequeNumber == chequeNumber)&&(identical(other.description, description) || other.description == description)&&(identical(other.chequeCopyPath, chequeCopyPath) || other.chequeCopyPath == chequeCopyPath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,paymentNumber,leaseId,dueDate,amount,paymentType,status,paidDate,chequeNumber,description,chequeCopyPath,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'Payment(id: $id, paymentNumber: $paymentNumber, leaseId: $leaseId, dueDate: $dueDate, amount: $amount, paymentType: $paymentType, status: $status, paidDate: $paidDate, chequeNumber: $chequeNumber, description: $description, chequeCopyPath: $chequeCopyPath, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$PaymentCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$PaymentCopyWith(_Payment value, $Res Function(_Payment) _then) = __$PaymentCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'payment_number') String paymentNumber,@JsonKey(name: 'lease_id') String leaseId,@JsonKey(name: 'due_date') DateTime dueDate, double amount,@JsonKey(name: 'payment_type') PaymentType paymentType, PaymentStatus status,@JsonKey(name: 'paid_date') DateTime? paidDate,@JsonKey(name: 'cheque_number') String? chequeNumber, String? description,@JsonKey(name: 'cheque_copy_path') String? chequeCopyPath,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'deleted_at') DateTime? deletedAt
});




}
/// @nodoc
class __$PaymentCopyWithImpl<$Res>
    implements _$PaymentCopyWith<$Res> {
  __$PaymentCopyWithImpl(this._self, this._then);

  final _Payment _self;
  final $Res Function(_Payment) _then;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? paymentNumber = null,Object? leaseId = null,Object? dueDate = null,Object? amount = null,Object? paymentType = null,Object? status = null,Object? paidDate = freezed,Object? chequeNumber = freezed,Object? description = freezed,Object? chequeCopyPath = freezed,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_Payment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,paymentNumber: null == paymentNumber ? _self.paymentNumber : paymentNumber // ignore: cast_nullable_to_non_nullable
as String,leaseId: null == leaseId ? _self.leaseId : leaseId // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as PaymentType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PaymentStatus,paidDate: freezed == paidDate ? _self.paidDate : paidDate // ignore: cast_nullable_to_non_nullable
as DateTime?,chequeNumber: freezed == chequeNumber ? _self.chequeNumber : chequeNumber // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,chequeCopyPath: freezed == chequeCopyPath ? _self.chequeCopyPath : chequeCopyPath // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
