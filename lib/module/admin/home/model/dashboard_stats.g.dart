// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardStats _$DashboardStatsFromJson(Map<String, dynamic> json) =>
    _DashboardStats(
      totalUnits: (json['totalUnits'] as num?)?.toInt() ?? 0,
      occupied: (json['occupied'] as num?)?.toInt() ?? 0,
      vacant: (json['vacant'] as num?)?.toInt() ?? 0,
      maintenance: (json['maintenance'] as num?)?.toInt() ?? 0,
      rentCollected: (json['rentCollected'] as num?)?.toInt() ?? 0,
      overdueCount: (json['overdueCount'] as num?)?.toInt() ?? 0,
      rentDueTotal: (json['rentDueTotal'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$DashboardStatsToJson(_DashboardStats instance) =>
    <String, dynamic>{
      'totalUnits': instance.totalUnits,
      'occupied': instance.occupied,
      'vacant': instance.vacant,
      'maintenance': instance.maintenance,
      'rentCollected': instance.rentCollected,
      'overdueCount': instance.overdueCount,
      'rentDueTotal': instance.rentDueTotal,
    };
