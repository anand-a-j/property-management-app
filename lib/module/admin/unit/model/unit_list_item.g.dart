// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UnitListItem _$UnitListItemFromJson(Map<String, dynamic> json) =>
    _UnitListItem(
      id: json['id'] as String,
      communityId: json['community_id'] as String,
      name: json['name'] as String,
      area: json['area'] as String,
      description: json['description'] as String?,
      status: $enumDecodeNullable(_$UnitStatusEnumMap, json['status']),
      unitType: json['unit_type'] as String?,
      residentName: json['resident_name'] as String?,
      leaseId: json['lease_id'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$UnitListItemToJson(_UnitListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'community_id': instance.communityId,
      'name': instance.name,
      'area': instance.area,
      'description': instance.description,
      'status': _$UnitStatusEnumMap[instance.status],
      'unit_type': instance.unitType,
      'resident_name': instance.residentName,
      'lease_id': instance.leaseId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$UnitStatusEnumMap = {
  UnitStatus.unassigned: 'unassigned',
  UnitStatus.occupied: 'occupied',
  UnitStatus.vacant: 'vacant',
  UnitStatus.maintenance: 'maintenance',
};
