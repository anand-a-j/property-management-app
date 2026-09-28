// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManagerResponse _$ManagerResponseFromJson(Map<String, dynamic> json) =>
    _ManagerResponse(
      managers: (json['managers'] as List<dynamic>)
          .map((e) => Profile.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalManagers: (json['totalManagers'] as num).toInt(),
      activeUsers: (json['activeUsers'] as num).toInt(),
      totalUsers: (json['totalUsers'] as num).toInt(),
    );

Map<String, dynamic> _$ManagerResponseToJson(_ManagerResponse instance) =>
    <String, dynamic>{
      'managers': instance.managers,
      'totalManagers': instance.totalManagers,
      'activeUsers': instance.activeUsers,
      'totalUsers': instance.totalUsers,
    };
