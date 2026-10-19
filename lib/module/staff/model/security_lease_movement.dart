import 'package:freezed_annotation/freezed_annotation.dart';

part 'security_lease_movement.freezed.dart';
part 'security_lease_movement.g.dart';

@freezed
abstract class SecurityLeaseMovement with _$SecurityLeaseMovement {
  const factory SecurityLeaseMovement({
    @JsonKey(name: 'org_id') String? orgId,
    @JsonKey(name: 'movement_id') required String movementId,
    @JsonKey(name: 'lease_id') String? leaseId,
    @JsonKey(name: 'movement_type') String? movementType,
    @Default('pending_security') String status,
    @JsonKey(name: 'requested_by') String? requestedBy,
    @JsonKey(name: 'requested_at') DateTime? requestedAt,

    @JsonKey(name: 'manager_reviewed_by') String? managerReviewedBy,
    @JsonKey(name: 'manager_reviewed_at') DateTime? managerReviewedAt,
    @JsonKey(name: 'manager_rejection_reason') String? managerRejectionReason,

    @JsonKey(name: 'security_reviewed_by') String? securityReviewedBy,
    @JsonKey(name: 'security_reviewed_at') DateTime? securityReviewedAt,
    @JsonKey(name: 'security_rejection_reason') String? securityRejectionReason,

    @JsonKey(name: 'completed_at') DateTime? completedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,

    @JsonKey(name: 'lease_number') String? leaseNumber,
    @JsonKey(name: 'start_date') DateTime? startDate,
    @JsonKey(name: 'end_date') DateTime? endDate,
    @JsonKey(name: 'lease_status') String? leaseStatus,

    @JsonKey(name: 'unit_id') String? unitId,
    @JsonKey(name: 'unit_name') String? unitName,

    @JsonKey(name: 'resident_id') String? residentId,
    @JsonKey(name: 'resident_name') String? residentName,

    @JsonKey(name: 'requested_by_name') String? requestedByName,
  }) = _SecurityLeaseMovement;

  factory SecurityLeaseMovement.fromJson(Map<String, dynamic> json) =>
      _$SecurityLeaseMovementFromJson(json);
}
