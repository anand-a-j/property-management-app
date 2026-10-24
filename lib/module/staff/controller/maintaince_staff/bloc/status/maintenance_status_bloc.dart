import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../admin/maintainence/controller/repo/maintenance_repo.dart';

part 'maintenance_status_event.dart';
part 'maintenance_status_state.dart';

class MaintenanceStatusBloc
    extends Bloc<MaintenanceStatusEvent, MaintenanceStatusState> {
  final MaintenanceRepo _maintenanceRepo;

  MaintenanceStatusBloc({required MaintenanceRepo maintenanceRepo})
    : _maintenanceRepo = maintenanceRepo,
      super(MaintenanceStatusInitial()) {
    on<UpdateMaintenanceStatusEvent>(_onUpdateMaintenanceStatus);
  }

  Future<void> _onUpdateMaintenanceStatus(
    UpdateMaintenanceStatusEvent event,
    Emitter<MaintenanceStatusState> emit,
  ) async {
    emit(MaintenanceStatusLoading());

    final response = await _maintenanceRepo.updateMaintenanceStatus(
      requestId: event.requestId.trim(),
      status: event.status.trim(),
      updatedBy: event.updatedBy.trim(),
      note: event.note?.trim(),
      assignedTo: event.assignedTo?.trim(),
      rejectionReason: event.rejectionReason?.trim(),
    );

    if (response.hasError) {
      emit(
        MaintenanceStatusFailed(
          errorMessage:
              response.error?.toString() ??
              'Failed to update maintenance status.',
        ),
      );
      return;
    }

    emit(MaintenanceStatusSuccess());
  }
}
