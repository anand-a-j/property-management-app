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
