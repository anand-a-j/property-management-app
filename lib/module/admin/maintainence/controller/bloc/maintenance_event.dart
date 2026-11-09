part of 'maintenance_bloc.dart';

abstract class MaintenanceEvent extends Equatable {
  const MaintenanceEvent();

  @override
  List<Object?> get props => [];
}

class AddMaintenanceEvent extends MaintenanceEvent {
  final AddMaintenance maintenance;

  const AddMaintenanceEvent({required this.maintenance});

  @override
  List<Object?> get props => [maintenance];
}

class UpdateMaintenanceEvent extends MaintenanceEvent {
  final String maintenanceId;
  final AddMaintenance maintenance;

  const UpdateMaintenanceEvent({
    required this.maintenanceId,
    required this.maintenance,
  });

  @override
  List<Object?> get props => [maintenanceId, maintenance];
}

class DeleteMaintenanceEvent extends MaintenanceEvent {
  final String maintenanceId;

  const DeleteMaintenanceEvent({required this.maintenanceId});

  @override
  List<Object?> get props => [maintenanceId];
}
