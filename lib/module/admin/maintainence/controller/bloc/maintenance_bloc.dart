import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/add_maintenance.dart';
import '../../model/maintenance_request.dart';
import '../repo/maintenance_repo.dart';

part 'maintenance_event.dart';
part 'maintenance_state.dart';

class MaintenanceBloc extends Bloc<MaintenanceEvent, MaintenanceState> {
  final MaintenanceRepo _maintenanceRepo;

  MaintenanceBloc({required MaintenanceRepo maintenanceRepo})
    : _maintenanceRepo = maintenanceRepo,
      super(const MaintenanceInitial()) {
    on<AddMaintenanceEvent>(_onAddMaintenance);
  }

  Future<void> _onAddMaintenance(
    AddMaintenanceEvent event,
    Emitter<MaintenanceState> emit,
  ) async {
    emit(const MaintenanceLoading());

    final response = await _maintenanceRepo.addMaintenance(
      maintenance: event.maintenance.copyWith(
        issueTitle: event.maintenance.issueTitle.trim(),
        issueType: event.maintenance.issueType.trim(),
        description: event.maintenance.description.trim(),
      ),
    );

    if (response.hasError) {
      emit(MaintenanceFailed(message: response.error!));
      return;
    }

    emit(const MaintenanceAddSuccess());
  }
}
