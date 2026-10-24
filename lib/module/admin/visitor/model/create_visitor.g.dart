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
      visitAt: DateTime.parse(json['visit_at'] as String),
      visitType: json['visit_type'] as String,
      purpose: json['purpose'] as String?,
      unitId: json['unit_id'] as String?,
      createdBy: json['created_by'] as String,
    );

Map<String, dynamic> _$CreateVisitorToJson(_CreateVisitor instance) =>
    <String, dynamic>{
      'org_id': instance.orgId,
      'name': instance.name,
      'phone': instance.phone,
      'visit_at': instance.visitAt.toIso8601String(),
      'visit_type': instance.visitType,
      'purpose': instance.purpose,
      'unit_id': instance.unitId,
      'created_by': instance.createdBy,
    };
