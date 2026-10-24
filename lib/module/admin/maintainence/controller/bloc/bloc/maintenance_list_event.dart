part of 'maintenance_list_bloc.dart';

abstract class MaintenanceListEvent extends Equatable {
  const MaintenanceListEvent();

  @override
  List<Object?> get props => [];
}

class GetMaintenanceListEvent extends MaintenanceListEvent {
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
