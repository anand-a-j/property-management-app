// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MaintenanceUpdate _$MaintenanceUpdateFromJson(Map<String, dynamic> json) =>
    _MaintenanceUpdate(
      id: json['id'] as String,
      maintenanceRequestId: json['maintenance_request_id'] as String,
      updatedBy: json['updated_by'] as String,
      status: $enumDecode(_$MaintenanceUpdateStatusEnumMap, json['status']),
      note: json['note'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$MaintenanceUpdateToJson(_MaintenanceUpdate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'maintenance_request_id': instance.maintenanceRequestId,
      'updated_by': instance.updatedBy,
      'status': _$MaintenanceUpdateStatusEnumMap[instance.status]!,
      'note': instance.note,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$MaintenanceUpdateStatusEnumMap = {
  MaintenanceUpdateStatus.assigned: 'assigned',
  MaintenanceUpdateStatus.inProgress: 'in_progress',
  MaintenanceUpdateStatus.completed: 'completed',
};
