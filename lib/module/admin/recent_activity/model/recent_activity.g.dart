// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecentActivity _$RecentActivityFromJson(Map<String, dynamic> json) =>
    _RecentActivity(
      activityType: json['activity_type'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      activityAt: json['activity_at'] == null
          ? null
          : DateTime.parse(json['activity_at'] as String),
      dueDate: json['due_date'] == null
          ? null
          : DateTime.parse(json['due_date'] as String),
      referenceId: json['reference_id'] as String?,
      unitName: json['unit_name'] as String?,
      communityName: json['community_name'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$RecentActivityToJson(_RecentActivity instance) =>
    <String, dynamic>{
      'activity_type': instance.activityType,
      'title': instance.title,
      'description': instance.description,
      'activity_at': instance.activityAt?.toIso8601String(),
      'due_date': instance.dueDate?.toIso8601String(),
      'reference_id': instance.referenceId,
      'unit_name': instance.unitName,
      'community_name': instance.communityName,
      'status': instance.status,
    };
