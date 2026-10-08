import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enum/lease_status.dart';
import '../../../../core/enum/payment_frequency.dart';
import '../../../auth/core/model/profile.dart';

part 'lease.freezed.dart';
part 'lease.g.dart';

@freezed
abstract class Lease with _$Lease {
  const factory Lease({
    required String id,
    @JsonKey(name: 'lease_number') required String leaseNumber,
    @JsonKey(name: 'unit_id') required String unitId,
    @JsonKey(name: 'resident_id') required String residentId,
    @JsonKey(name: 'start_date') required DateTime startDate,
    @JsonKey(name: 'end_date') required DateTime endDate,
    @JsonKey(name: 'annual_rent') required double annualRent,
    @JsonKey(name: 'security_deposit') @Default(0) double securityDeposit,
    @JsonKey(name: 'payment_frequency')
    required PaymentFrequency paymentFrequency,
    @JsonKey(name: 'number_of_cheques') @Default(1) int numberOfCheques,
    @Default(LeaseStatus.draft) LeaseStatus status,
    String? description,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    Profile? resident,
  }) = _Lease;

  factory Lease.fromJson(Map<String, dynamic> json) => _$LeaseFromJson(json);
}
