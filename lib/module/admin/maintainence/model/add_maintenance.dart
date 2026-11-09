import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enum/mainteance_status.dart';
import '../../../../core/enum/maintenance_priority.dart';

part 'add_maintenance.freezed.dart';
part 'add_maintenance.g.dart';

@freezed
abstract class AddMaintenance with _$AddMaintenance {
  const factory AddMaintenance({
    String? id,
    @JsonKey(name: 'org_id') String? orgId,
    @JsonKey(name: 'unit_id') String? unitId,
    @JsonKey(name: 'created_by') String? createdBy,
    @JsonKey(name: 'resident_id') String? residentId,
    @JsonKey(name: 'issue_title') String? issueTitle,
    @JsonKey(name: 'issue_type') String? issueType,
    @JsonKey(name: 'ticket_number') String? ticketNumber,
    String? description,
    MaintenancePriority? priority,
    MaintenanceStatus? status,
    @JsonKey(name: 'unit_name') String? unitName,
    @JsonKey(name: 'community_id') String? communityId,
    @JsonKey(name: 'community_name') String? communityName,
  }) = _AddMaintenance;

  factory AddMaintenance.fromJson(Map<String, dynamic> json) =>
      _$AddMaintenanceFromJson(json);
}
