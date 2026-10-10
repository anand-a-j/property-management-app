import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enum/maintenance_update_status.dart';

part 'maintenance_update.freezed.dart';
part 'maintenance_update.g.dart';

@freezed
abstract class MaintenanceUpdate with _$MaintenanceUpdate {
  const factory MaintenanceUpdate({
    required String id,
    @JsonKey(name: 'maintenance_request_id')
    required String maintenanceRequestId,
    @JsonKey(name: 'updated_by') required String updatedBy,
    required MaintenanceUpdateStatus status,
    required String note,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _MaintenanceUpdate;

  factory MaintenanceUpdate.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceUpdateFromJson(json);
}
