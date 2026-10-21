// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Community _$CommunityFromJson(Map<String, dynamic> json) => _Community(
  id: json['id'] as String,
  orgId: json['org_id'] as String,
  developmentType: json['development_type'] as String,
  communityType: json['community_type'] as String,
  name: json['name'] as String,
  address: json['address'] as String,
  description: json['description'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
  totalUnits: (json['total_units'] as num?)?.toInt() ?? 0,
  occupiedUnits: (json['occupied_units'] as num?)?.toInt() ?? 0,
  vacantUnits: (json['vacant_units'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CommunityToJson(_Community instance) =>
    <String, dynamic>{
      'id': instance.id,
      'org_id': instance.orgId,
      'development_type': instance.developmentType,
      'community_type': instance.communityType,
      'name': instance.name,
      'address': instance.address,
      'description': instance.description,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'total_units': instance.totalUnits,
      'occupied_units': instance.occupiedUnits,
      'vacant_units': instance.vacantUnits,
    };
