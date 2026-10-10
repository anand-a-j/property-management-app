// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_maintenance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddMaintenance _$AddMaintenanceFromJson(Map<String, dynamic> json) =>
    _AddMaintenance(
      orgId: json['org_id'] as String,
      unitId: json['unit_id'] as String,
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
    );

Map<String, dynamic> _$AddMaintenanceToJson(_AddMaintenance instance) =>
    <String, dynamic>{
      'org_id': instance.orgId,
      'unit_id': instance.unitId,
      'created_by': instance.createdBy,
      'resident_id': instance.residentId,
      'issue_title': instance.issueTitle,
      'issue_type': instance.issueType,
      'description': instance.description,
      'priority': _$MaintenancePriorityEnumMap[instance.priority]!,
      'status': _$MaintenanceStatusEnumMap[instance.status]!,
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
