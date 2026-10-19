part of 'maintenance_staff_bloc.dart';

abstract class MaintenanceStaffState extends Equatable {
  const MaintenanceStaffState();

  @override
  List<Object?> get props => [];
}

class MaintenanceStaffInitial extends MaintenanceStaffState {
  const MaintenanceStaffInitial();
}

class MaintenanceStaffLoading extends MaintenanceStaffState {
  const MaintenanceStaffLoading();
}

class MaintenanceStaffSuccess extends MaintenanceStaffState {
  final StaffMaintenanceOverview overview;
  final bool hasMore;
  final bool isLoadingMore;

  const MaintenanceStaffSuccess({
    required this.overview,
    this.hasMore = true,
    this.isLoadingMore = false,
  });

  @override
  List<Object?> get props => [overview, hasMore, isLoadingMore];
}

class MaintenanceStaffFailed extends MaintenanceStaffState {
  final String message;

  const MaintenanceStaffFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
