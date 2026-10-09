import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enum/lease_movement_status.dart';
import '../../../../core/enum/lease_movement_type.dart';

part 'lease_movement.freezed.dart';
part 'lease_movement.g.dart';

@freezed
abstract class LeaseMovement with _$LeaseMovement {
  const factory LeaseMovement({
    required String id,

    @JsonKey(name: 'lease_id') required String leaseId,

    @JsonKey(name: 'movement_type') required LeaseMovementType movementType,

    @Default(LeaseMovementStatus.pendingManager) LeaseMovementStatus status,

    @JsonKey(name: 'requested_by') required String requestedBy,

    @JsonKey(name: 'requested_at') required DateTime requestedAt,

    @JsonKey(name: 'manager_reviewed_by') String? managerReviewedBy,

    @JsonKey(name: 'manager_reviewed_at') DateTime? managerReviewedAt,

    @JsonKey(name: 'manager_rejection_reason') String? managerRejectionReason,

    @JsonKey(name: 'security_reviewed_by') String? securityReviewedBy,

    @JsonKey(name: 'security_reviewed_at') DateTime? securityReviewedAt,

    @JsonKey(name: 'security_rejection_reason') String? securityRejectionReason,

    @JsonKey(name: 'completed_at') DateTime? completedAt,

    @JsonKey(name: 'created_at') required DateTime createdAt,

    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _LeaseMovement;

  factory LeaseMovement.fromJson(Map<String, dynamic> json) =>
      _$LeaseMovementFromJson(json);
}
