// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_maintenance_overview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StaffMaintenanceOverview _$StaffMaintenanceOverviewFromJson(
  Map<String, dynamic> json,
) => _StaffMaintenanceOverview(
  totalTickets: (json['totalTickets'] as num?)?.toInt() ?? 0,
  pendingReview: (json['pendingReview'] as num?)?.toInt() ?? 0,
  activeTickets: (json['activeTickets'] as num?)?.toInt() ?? 0,
  completedTickets: (json['completedTickets'] as num?)?.toInt() ?? 0,
  maintenanceList:
      (json['maintenanceList'] as List<dynamic>?)
          ?.map((e) => MaintenanceRequest.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$StaffMaintenanceOverviewToJson(
  _StaffMaintenanceOverview instance,
) => <String, dynamic>{
  'totalTickets': instance.totalTickets,
  'pendingReview': instance.pendingReview,
  'activeTickets': instance.activeTickets,
  'completedTickets': instance.completedTickets,
  'maintenanceList': instance.maintenanceList,
};
