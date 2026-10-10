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

class GetMaintenanceListEvent extends MaintenanceEvent {
  final String orgId;
  final String? unitId;
  final int page;
  final int limit;

  const GetMaintenanceListEvent({
    required this.orgId,
    this.unitId,
    this.page = 1,
    this.limit = 10,
  });

  @override
  List<Object?> get props => [orgId, unitId, page, limit];
}
