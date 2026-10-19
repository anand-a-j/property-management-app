import 'package:freezed_annotation/freezed_annotation.dart';

import '../../admin/maintainence/model/maintenance_request.dart';

part 'staff_maintenance_overview.freezed.dart';
part 'staff_maintenance_overview.g.dart';

@freezed
abstract class StaffMaintenanceOverview with _$StaffMaintenanceOverview {
  const factory StaffMaintenanceOverview({
    @Default(0) int totalTickets,
    @Default(0) int pendingReview,
    @Default(0) int activeTickets,
    @Default(0) int completedTickets,
    @Default([]) List<MaintenanceRequest> maintenanceList,
  }) = _StaffMaintenanceOverview;

  factory StaffMaintenanceOverview.fromJson(Map<String, dynamic> json) =>
      _$StaffMaintenanceOverviewFromJson(json);
}
