// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_visitor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateVisitor _$CreateVisitorFromJson(Map<String, dynamic> json) =>
    _CreateVisitor(
      orgId: json['org_id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String?,
      visitStartAt: json['visit_start_at'] == null
          ? null
          : DateTime.parse(json['visit_start_at'] as String),
      visitEndAt: json['visit_end_at'] == null
          ? null
          : DateTime.parse(json['visit_end_at'] as String),
      visitType: json['visit_type'] as String,
      purpose: json['purpose'] as String?,
      unitId: json['unit_id'] as String?,
      residentId: json['resident_id'] as String?,
      leaseId: json['lease_id'] as String?,
      parkingRequired: json['parking_required'] as bool? ?? false,
      documentId: json['document_id'] as String?,
      createdBy: json['created_by'] as String,
    );

Map<String, dynamic> _$CreateVisitorToJson(_CreateVisitor instance) =>
    <String, dynamic>{
      'org_id': instance.orgId,
      'name': instance.name,
      'phone': instance.phone,
      'visit_start_at': instance.visitStartAt?.toIso8601String(),
      'visit_end_at': instance.visitEndAt?.toIso8601String(),
      'visit_type': instance.visitType,
      'purpose': instance.purpose,
      'unit_id': instance.unitId,
      'resident_id': instance.residentId,
      'lease_id': instance.leaseId,
      'parking_required': instance.parkingRequired,
      'document_id': instance.documentId,
      'created_by': instance.createdBy,
    };
