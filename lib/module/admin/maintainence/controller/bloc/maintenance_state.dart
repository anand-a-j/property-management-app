part of 'maintenance_bloc.dart';

abstract class MaintenanceState extends Equatable {
  const MaintenanceState();

  @override
  List<Object?> get props => [];
}

class MaintenanceInitial extends MaintenanceState {
  const MaintenanceInitial();
}

class MaintenanceLoading extends MaintenanceState {
  const MaintenanceLoading();
}

class MaintenanceAddSuccess extends MaintenanceState {
  const MaintenanceAddSuccess();
}

class MaintenanceListSuccess extends MaintenanceState {
  final List<MaintenanceRequest> maintenanceList;

  const MaintenanceListSuccess({required this.maintenanceList});

  @override
  List<Object?> get props => [maintenanceList];
}

class MaintenanceFailed extends MaintenanceState {
  final String message;

  const MaintenanceFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
