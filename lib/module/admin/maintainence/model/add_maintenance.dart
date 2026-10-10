import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enum/mainteance_status.dart';
import '../../../../core/enum/maintenance_priority.dart';

part 'add_maintenance.freezed.dart';
part 'add_maintenance.g.dart';

@freezed
abstract class AddMaintenance with _$AddMaintenance {
  const factory AddMaintenance({
    @JsonKey(name: 'org_id') required String orgId,
    @JsonKey(name: 'unit_id') required String unitId,
    @JsonKey(name: 'created_by') required String createdBy,
    @JsonKey(name: 'resident_id') String? residentId,
    @JsonKey(name: 'issue_title') required String issueTitle,
    @JsonKey(name: 'issue_type') required String issueType,
    required String description,
    @Default(MaintenancePriority.medium) MaintenancePriority priority,
    @Default(MaintenanceStatus.pendingReview) MaintenanceStatus status,
  }) = _AddMaintenance;

  factory AddMaintenance.fromJson(Map<String, dynamic> json) =>
      _$AddMaintenanceFromJson(json);
}
