import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/add_maintenance.dart';
import '../repo/maintenance_repo.dart';

part 'maintenance_event.dart';
part 'maintenance_state.dart';

class MaintenanceBloc extends Bloc<MaintenanceEvent, MaintenanceState> {
  final MaintenanceRepo _maintenanceRepo;

  MaintenanceBloc({required MaintenanceRepo maintenanceRepo})
    : _maintenanceRepo = maintenanceRepo,
      super(const MaintenanceInitial()) {
    on<AddMaintenanceEvent>(_onAddMaintenance);
    on<UpdateMaintenanceEvent>(_onUpdateMaintenance);
    on<DeleteMaintenanceEvent>(_onDeleteMaintenance);
  }

  // ADD MAINTENANCE

  Future<void> _onAddMaintenance(
    AddMaintenanceEvent event,
    Emitter<MaintenanceState> emit,
  ) async {
    emit(const MaintenanceLoading());

    final response = await _maintenanceRepo.addMaintenance(
      maintenance: event.maintenance,
    );

    if (response.hasError) {
      emit(MaintenanceFailed(message: response.error!));
      return;
    }

    emit(const MaintenanceAddSuccess());
  }

  // UPDATE MAINTENANCE

  Future<void> _onUpdateMaintenance(
    UpdateMaintenanceEvent event,
    Emitter<MaintenanceState> emit,
  ) async {
    emit(const MaintenanceLoading());

    final response = await _maintenanceRepo.updateMaintenance(
      maintenanceId: event.maintenanceId,
      maintenance: event.maintenance,
    );

    if (response.hasError) {
      emit(MaintenanceFailed(message: response.error!));
      return;
    }

    emit(const MaintenanceAddSuccess());
  }

  // DELETE MAINTENANCE

  Future<void> _onDeleteMaintenance(
    DeleteMaintenanceEvent event,
    Emitter<MaintenanceState> emit,
  ) async {
    emit(const MaintenanceLoading());

    final response = await _maintenanceRepo.deleteMaintenance(
      maintenanceId: event.maintenanceId,
    );

    if (response.hasError) {
      emit(MaintenanceFailed(message: response.error!));
      return;
    }

    emit(const MaintenanceAddSuccess());
  }
}
