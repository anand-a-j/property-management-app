// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Visitor _$VisitorFromJson(Map<String, dynamic> json) => _Visitor(
  id: json['id'] as String,
  orgId: json['org_id'] as String,
  name: json['name'] as String,
  phone: json['phone'] as String?,
  visitorCode: json['visitor_code'] as String?,
  visitStartAt: json['visit_start_at'] == null
      ? null
      : DateTime.parse(json['visit_start_at'] as String),
  visitEndAt: json['visit_end_at'] == null
      ? null
      : DateTime.parse(json['visit_end_at'] as String),
  visitAt: json['visit_at'] == null
      ? null
      : DateTime.parse(json['visit_at'] as String),
  visitType:
      $enumDecodeNullable(
        _$VisitTypeEnumMap,
        json['visitType'],
        unknownValue: VisitType.other,
      ) ??
      VisitType.other,
  purpose: json['purpose'] as String?,
  unitId: json['unit_id'] as String?,
  residentId: json['resident_id'] as String?,
  leaseId: json['lease_id'] as String?,
  parkingRequired: json['parking_required'] as bool?,
  documentId: json['document_id'] as String?,
  status:
      $enumDecodeNullable(
        _$VisitorStatusEnumMap,
        json['status'],
        unknownValue: VisitorStatus.pending,
      ) ??
      VisitorStatus.pending,
  createdBy: json['created_by'] as String,
  approvedBy: json['approved_by'] as String?,
  checkedInAt: json['checked_in_at'] == null
      ? null
      : DateTime.parse(json['checked_in_at'] as String),
  checkedOutAt: json['checked_out_at'] == null
      ? null
      : DateTime.parse(json['checked_out_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$VisitorToJson(_Visitor instance) => <String, dynamic>{
  'id': instance.id,
  'org_id': instance.orgId,
  'name': instance.name,
  'phone': instance.phone,
  'visitor_code': instance.visitorCode,
  'visit_start_at': instance.visitStartAt?.toIso8601String(),
  'visit_end_at': instance.visitEndAt?.toIso8601String(),
  'visit_at': instance.visitAt?.toIso8601String(),
  'visitType': _$VisitTypeEnumMap[instance.visitType]!,
  'purpose': instance.purpose,
  'unit_id': instance.unitId,
  'resident_id': instance.residentId,
  'lease_id': instance.leaseId,
  'parking_required': instance.parkingRequired,
  'document_id': instance.documentId,
  'status': _$VisitorStatusEnumMap[instance.status]!,
  'created_by': instance.createdBy,
  'approved_by': instance.approvedBy,
  'checked_in_at': instance.checkedInAt?.toIso8601String(),
  'checked_out_at': instance.checkedOutAt?.toIso8601String(),
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};

const _$VisitTypeEnumMap = {
  VisitType.resident: 'resident',
  VisitType.maintenance: 'maintenance',
  VisitType.delivery: 'delivery',
  VisitType.guest: 'guest',
  VisitType.other: 'other',
};

const _$VisitorStatusEnumMap = {
  VisitorStatus.pending: 'pending',
  VisitorStatus.approved: 'approved',
  VisitorStatus.rejected: 'rejected',
  VisitorStatus.checkedIn: 'checked_in',
  VisitorStatus.checkedOut: 'checked_out',
  VisitorStatus.cancelled: 'cancelled',
};
