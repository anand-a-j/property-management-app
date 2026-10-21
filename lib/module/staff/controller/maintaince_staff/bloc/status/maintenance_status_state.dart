part of 'maintenance_status_bloc.dart';

abstract class MaintenanceStatusState extends Equatable {
  const MaintenanceStatusState();

  @override
  List<Object?> get props => [];
}

class MaintenanceStatusInitial extends MaintenanceStatusState {}

class MaintenanceStatusLoading extends MaintenanceStatusState {}

class MaintenanceStatusSuccess extends MaintenanceStatusState {}

class MaintenanceStatusFailed extends MaintenanceStatusState {
  final String errorMessage;

  const MaintenanceStatusFailed({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}