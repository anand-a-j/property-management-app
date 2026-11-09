// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_maintenance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddMaintenance _$AddMaintenanceFromJson(Map<String, dynamic> json) =>
    _AddMaintenance(
      id: json['id'] as String?,
      orgId: json['org_id'] as String?,
      unitId: json['unit_id'] as String?,
      createdBy: json['created_by'] as String?,
      residentId: json['resident_id'] as String?,
      issueTitle: json['issue_title'] as String?,
      issueType: json['issue_type'] as String?,
      ticketNumber: json['ticket_number'] as String?,
      description: json['description'] as String?,
      priority: $enumDecodeNullable(
        _$MaintenancePriorityEnumMap,
        json['priority'],
      ),
      status: $enumDecodeNullable(_$MaintenanceStatusEnumMap, json['status']),
      unitName: json['unit_name'] as String?,
      communityId: json['community_id'] as String?,
      communityName: json['community_name'] as String?,
    );

Map<String, dynamic> _$AddMaintenanceToJson(_AddMaintenance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'org_id': instance.orgId,
      'unit_id': instance.unitId,
      'created_by': instance.createdBy,
      'resident_id': instance.residentId,
      'issue_title': instance.issueTitle,
      'issue_type': instance.issueType,
      'ticket_number': instance.ticketNumber,
      'description': instance.description,
      'priority': _$MaintenancePriorityEnumMap[instance.priority],
      'status': _$MaintenanceStatusEnumMap[instance.status],
      'unit_name': instance.unitName,
      'community_id': instance.communityId,
      'community_name': instance.communityName,
    };

const _$MaintenancePriorityEnumMap = {
  MaintenancePriority.low: 'low',
  MaintenancePriority.medium: 'medium',
  MaintenancePriority.high: 'high',
};

const _$MaintenanceStatusEnumMap = {
  MaintenanceStatus.pendingReview: 'pending_review',
  MaintenanceStatus.rejected: 'rejected',
  MaintenanceStatus.approved: 'approved',
  MaintenanceStatus.inProgress: 'in_progress',
  MaintenanceStatus.completed: 'completed',
  MaintenanceStatus.closed: 'closed',
  MaintenanceStatus.cancelled: 'cancelled',
};
