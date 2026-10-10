// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MaintenanceRequest _$MaintenanceRequestFromJson(Map<String, dynamic> json) =>
    _MaintenanceRequest(
      id: json['id'] as String,
      orgId: json['org_id'] as String,
      unitId: json['unit_id'] as String,
      ticketNumber: json['ticket_number'] as String,
      createdBy: json['created_by'] as String,
      residentId: json['resident_id'] as String?,
      issueTitle: json['issue_title'] as String,
      issueType: json['issue_type'] as String,
      description: json['description'] as String,
      priority:
          $enumDecodeNullable(_$MaintenancePriorityEnumMap, json['priority']) ??
          MaintenancePriority.medium,
      status:
          $enumDecodeNullable(_$MaintenanceStatusEnumMap, json['status']) ??
          MaintenanceStatus.pendingReview,
      assignedTo: json['assigned_to'] as String?,
      reviewedBy: json['reviewed_by'] as String?,
      reviewedAt: json['reviewed_at'] == null
          ? null
          : DateTime.parse(json['reviewed_at'] as String),
      rejectionReason: json['rejection_reason'] as String?,
      approvedAt: json['approved_at'] == null
          ? null
          : DateTime.parse(json['approved_at'] as String),
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
      closedAt: json['closed_at'] == null
          ? null
          : DateTime.parse(json['closed_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$MaintenanceRequestToJson(_MaintenanceRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'org_id': instance.orgId,
      'unit_id': instance.unitId,
      'ticket_number': instance.ticketNumber,
      'created_by': instance.createdBy,
      'resident_id': instance.residentId,
      'issue_title': instance.issueTitle,
      'issue_type': instance.issueType,
      'description': instance.description,
      'priority': _$MaintenancePriorityEnumMap[instance.priority]!,
      'status': _$MaintenanceStatusEnumMap[instance.status]!,
      'assigned_to': instance.assignedTo,
      'reviewed_by': instance.reviewedBy,
      'reviewed_at': instance.reviewedAt?.toIso8601String(),
      'rejection_reason': instance.rejectionReason,
      'approved_at': instance.approvedAt?.toIso8601String(),
      'completed_at': instance.completedAt?.toIso8601String(),
      'closed_at': instance.closedAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$MaintenancePriorityEnumMap = {
  MaintenancePriority.low: 'low',
  MaintenancePriority.medium: 'medium',
  MaintenancePriority.high: 'high',
  MaintenancePriority.important: 'important',
};

const _$MaintenanceStatusEnumMap = {
  MaintenanceStatus.pendingReview: 'pending_review',
  MaintenanceStatus.rejected: 'rejected',
  MaintenanceStatus.approved: 'approved',
  MaintenanceStatus.assigned: 'assigned',
  MaintenanceStatus.inProgress: 'in_progress',
  MaintenanceStatus.completed: 'completed',
  MaintenanceStatus.closed: 'closed',
  MaintenanceStatus.cancelled: 'cancelled',
};
