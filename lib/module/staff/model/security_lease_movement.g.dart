// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_lease_movement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SecurityLeaseMovement _$SecurityLeaseMovementFromJson(
  Map<String, dynamic> json,
) => _SecurityLeaseMovement(
  orgId: json['org_id'] as String?,
  movementId: json['movement_id'] as String,
  leaseId: json['lease_id'] as String?,
  movementType: json['movement_type'] as String?,
  status: json['status'] as String? ?? 'pending_security',
  requestedBy: json['requested_by'] as String?,
  requestedAt: json['requested_at'] == null
      ? null
      : DateTime.parse(json['requested_at'] as String),
  managerReviewedBy: json['manager_reviewed_by'] as String?,
  managerReviewedAt: json['manager_reviewed_at'] == null
      ? null
      : DateTime.parse(json['manager_reviewed_at'] as String),
  managerRejectionReason: json['manager_rejection_reason'] as String?,
  securityReviewedBy: json['security_reviewed_by'] as String?,
  securityReviewedAt: json['security_reviewed_at'] == null
      ? null
      : DateTime.parse(json['security_reviewed_at'] as String),
  securityRejectionReason: json['security_rejection_reason'] as String?,
  completedAt: json['completed_at'] == null
      ? null
      : DateTime.parse(json['completed_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  leaseNumber: json['lease_number'] as String?,
  startDate: json['start_date'] == null
      ? null
      : DateTime.parse(json['start_date'] as String),
  endDate: json['end_date'] == null
      ? null
      : DateTime.parse(json['end_date'] as String),
  leaseStatus: json['lease_status'] as String?,
  unitId: json['unit_id'] as String?,
  unitName: json['unit_name'] as String?,
  residentId: json['resident_id'] as String?,
  residentName: json['resident_name'] as String?,
  requestedByName: json['requested_by_name'] as String?,
);

Map<String, dynamic> _$SecurityLeaseMovementToJson(
  _SecurityLeaseMovement instance,
) => <String, dynamic>{
  'org_id': instance.orgId,
  'movement_id': instance.movementId,
  'lease_id': instance.leaseId,
  'movement_type': instance.movementType,
  'status': instance.status,
  'requested_by': instance.requestedBy,
  'requested_at': instance.requestedAt?.toIso8601String(),
  'manager_reviewed_by': instance.managerReviewedBy,
  'manager_reviewed_at': instance.managerReviewedAt?.toIso8601String(),
  'manager_rejection_reason': instance.managerRejectionReason,
  'security_reviewed_by': instance.securityReviewedBy,
  'security_reviewed_at': instance.securityReviewedAt?.toIso8601String(),
  'security_rejection_reason': instance.securityRejectionReason,
  'completed_at': instance.completedAt?.toIso8601String(),
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'lease_number': instance.leaseNumber,
  'start_date': instance.startDate?.toIso8601String(),
  'end_date': instance.endDate?.toIso8601String(),
  'lease_status': instance.leaseStatus,
  'unit_id': instance.unitId,
  'unit_name': instance.unitName,
  'resident_id': instance.residentId,
  'resident_name': instance.residentName,
  'requested_by_name': instance.requestedByName,
};
