part of 'maintenance_list_bloc.dart';

abstract class MaintenanceListState extends Equatable {
  const MaintenanceListState();

  @override
  List<Object?> get props => [];
}

class MaintenanceListInitial extends MaintenanceListState {
  const MaintenanceListInitial();
}

class MaintenanceListLoading extends MaintenanceListState {
  const MaintenanceListLoading();
}

class MaintenanceListSuccess extends MaintenanceListState {
  final List<MaintenanceRequest> maintenanceList;

  const MaintenanceListSuccess({required this.maintenanceList});

  @override
  List<Object?> get props => [maintenanceList];
}

class MaintenanceListFailed extends MaintenanceListState {
  final String message;

  const MaintenanceListFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
