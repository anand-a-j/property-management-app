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
  visitAt: DateTime.parse(json['visit_at'] as String),
  visitType:
      $enumDecodeNullable(
        _$VisitTypeEnumMap,
        json['visitType'],
        unknownValue: VisitType.other,
      ) ??
      VisitType.other,
  purpose: json['purpose'] as String?,
  unitId: json['unit_id'] as String?,
  status:
      $enumDecodeNullable(
        _$VisitorStatusEnumMap,
        json['status'],
        unknownValue: VisitorStatus.pending,
      ) ??
      VisitorStatus.pending,
  createdBy: json['created_by'] as String,
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
  'visit_at': instance.visitAt.toIso8601String(),
  'visitType': _$VisitTypeEnumMap[instance.visitType]!,
  'purpose': instance.purpose,
  'unit_id': instance.unitId,
  'status': _$VisitorStatusEnumMap[instance.status]!,
  'created_by': instance.createdBy,
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
