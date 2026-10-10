import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enum/mainteance_status.dart';
import '../../../../core/enum/maintenance_priority.dart';

part 'maintenance_request.freezed.dart';
part 'maintenance_request.g.dart';

@freezed
abstract class MaintenanceRequest with _$MaintenanceRequest {
  const factory MaintenanceRequest({
    required String id,
    @JsonKey(name: 'org_id') required String orgId,
    @JsonKey(name: 'unit_id') required String unitId,
    @JsonKey(name: 'ticket_number') required String ticketNumber,
    @JsonKey(name: 'created_by') required String createdBy,
    @JsonKey(name: 'resident_id') String? residentId,
    @JsonKey(name: 'issue_title') required String issueTitle,
    @JsonKey(name: 'issue_type') required String issueType,
    required String description,
    @Default(MaintenancePriority.medium) MaintenancePriority priority,
    @Default(MaintenanceStatus.pendingReview) MaintenanceStatus status,
    @JsonKey(name: 'assigned_to') String? assignedTo,
    @JsonKey(name: 'reviewed_by') String? reviewedBy,
    @JsonKey(name: 'reviewed_at') DateTime? reviewedAt,
    @JsonKey(name: 'rejection_reason') String? rejectionReason,
    @JsonKey(name: 'approved_at') DateTime? approvedAt,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
    @JsonKey(name: 'closed_at') DateTime? closedAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _MaintenanceRequest;

  factory MaintenanceRequest.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceRequestFromJson(json);
}
