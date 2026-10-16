import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naseem/core/enum/lease_status.dart';

part 'resident_lease_details.freezed.dart';
part 'resident_lease_details.g.dart';

@freezed
abstract class ResidentLeaseDetails with _$ResidentLeaseDetails {
  const factory ResidentLeaseDetails({
    @JsonKey(name: 'lease_id') required String leaseId,

    @JsonKey(name: 'lease_number') required String leaseNumber,

    @JsonKey(name: 'resident_id') required String residentId,

    @JsonKey(name: 'lease_status') required LeaseStatus leaseStatus,

    @JsonKey(name: 'start_date') required DateTime startDate,

    @JsonKey(name: 'end_date') required DateTime endDate,

    @JsonKey(name: 'annual_rent') required double annualRent,

    @JsonKey(name: 'security_deposit') required double securityDeposit,

    @JsonKey(name: 'payment_frequency') required String paymentFrequency,

    @JsonKey(name: 'number_of_cheques') required int numberOfCheques,

    @JsonKey(name: 'lease_description') String? leaseDescription,

    @JsonKey(name: 'unit_id') required String unitId,

    @JsonKey(name: 'unit_name') required String unitName,

    @JsonKey(name: 'community_id') required String communityId,

    @JsonKey(name: 'community_name') required String communityName,
  }) = _ResidentLeaseDetails;

  factory ResidentLeaseDetails.fromJson(Map<String, dynamic> json) =>
      _$ResidentLeaseDetailsFromJson(json);
}
