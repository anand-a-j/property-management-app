part of 'maintenance_status_bloc.dart';

abstract class MaintenanceStatusEvent extends Equatable {
  const MaintenanceStatusEvent();

  @override
  List<Object?> get props => [];
}

class UpdateMaintenanceStatusEvent extends MaintenanceStatusEvent {
  final String requestId;
  final String status;
  final String updatedBy;
  final String? note;
  final String? assignedTo;
  final String? rejectionReason;

  const UpdateMaintenanceStatusEvent({
    required this.requestId,
    required this.status,
    required this.updatedBy,
    this.note,
    this.assignedTo,
    this.rejectionReason,
  });

  @override
  List<Object?> get props => [
    requestId,
    status,
    updatedBy,
    note,
    assignedTo,
    rejectionReason,
  ];
}
