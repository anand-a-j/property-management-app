import 'package:freezed_annotation/freezed_annotation.dart';

part 'lease_payment_details.freezed.dart';
part 'lease_payment_details.g.dart';

@freezed
abstract class LeasePaymentDetails with _$LeasePaymentDetails {
  const factory LeasePaymentDetails({
    required String id,
    UnitPaymentDetails? unit,
    ResidentPaymentDetails? resident,
  }) = _LeasePaymentDetails;
  factory LeasePaymentDetails.fromJson(Map<String, dynamic> json) =>
      _$LeasePaymentDetailsFromJson(json);
}

@freezed
abstract class UnitPaymentDetails with _$UnitPaymentDetails {
  const factory UnitPaymentDetails({required String name}) =
      _UnitPaymentDetails;
  factory UnitPaymentDetails.fromJson(Map<String, dynamic> json) =>
      _$UnitPaymentDetailsFromJson(json);
}

@freezed
abstract class ResidentPaymentDetails with _$ResidentPaymentDetails {
  const factory ResidentPaymentDetails({required String name}) =
      _ResidentPaymentDetails;
  factory ResidentPaymentDetails.fromJson(Map<String, dynamic> json) =>
      _$ResidentPaymentDetailsFromJson(json);
}
