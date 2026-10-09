// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lease_movement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaseMovement _$LeaseMovementFromJson(Map<String, dynamic> json) =>
    _LeaseMovement(
      id: json['id'] as String,
      leaseId: json['lease_id'] as String,
      movementType: $enumDecode(
        _$LeaseMovementTypeEnumMap,
        json['movement_type'],
      ),
      status:
          $enumDecodeNullable(_$LeaseMovementStatusEnumMap, json['status']) ??
          LeaseMovementStatus.pendingManager,
      requestedBy: json['requested_by'] as String,
      requestedAt: DateTime.parse(json['requested_at'] as String),
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
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$LeaseMovementToJson(_LeaseMovement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lease_id': instance.leaseId,
      'movement_type': _$LeaseMovementTypeEnumMap[instance.movementType]!,
      'status': _$LeaseMovementStatusEnumMap[instance.status]!,
      'requested_by': instance.requestedBy,
      'requested_at': instance.requestedAt.toIso8601String(),
      'manager_reviewed_by': instance.managerReviewedBy,
      'manager_reviewed_at': instance.managerReviewedAt?.toIso8601String(),
      'manager_rejection_reason': instance.managerRejectionReason,
      'security_reviewed_by': instance.securityReviewedBy,
      'security_reviewed_at': instance.securityReviewedAt?.toIso8601String(),
      'security_rejection_reason': instance.securityRejectionReason,
      'completed_at': instance.completedAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$LeaseMovementTypeEnumMap = {
  LeaseMovementType.moveIn: 'move_in',
  LeaseMovementType.moveOut: 'move_out',
};

const _$LeaseMovementStatusEnumMap = {
  LeaseMovementStatus.pendingManager: 'pending_manager',
  LeaseMovementStatus.managerRejected: 'manager_rejected',
  LeaseMovementStatus.pendingSecurity: 'pending_security',
  LeaseMovementStatus.securityRejected: 'security_rejected',
  LeaseMovementStatus.completed: 'completed',
  LeaseMovementStatus.cancelled: 'cancelled',
};
