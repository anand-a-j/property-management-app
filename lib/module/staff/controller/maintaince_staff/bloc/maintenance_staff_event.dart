part of 'maintenance_staff_bloc.dart';

abstract class MaintenanceStaffEvent extends Equatable {
  const MaintenanceStaffEvent();

  @override
  List<Object?> get props => [];
}

class FetchStaffMaintenanceList extends MaintenanceStaffEvent {
  final String orgId;
  final int page;
  final int limit;


  const FetchStaffMaintenanceList({
    required this.orgId,
    this.page = 1,
    this.limit = 10,
  });

  @override
  List<Object?> get props => [orgId, page, limit];
}

class LoadMoreStaffMaintenanceList extends MaintenanceStaffEvent {
  final String orgId;

  const LoadMoreStaffMaintenanceList({required this.orgId});

  @override
  List<Object?> get props => [orgId];
}
