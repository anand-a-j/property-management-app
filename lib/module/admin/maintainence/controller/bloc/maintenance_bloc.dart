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
    on<GetMaintenanceListEvent>(_onGetMaintenanceList);
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

  Future<void> _onGetMaintenanceList(
    GetMaintenanceListEvent event,
    Emitter<MaintenanceState> emit,
  ) async {
    emit(const MaintenanceLoading());

    final response = await _maintenanceRepo.getMaintenanceList(
      orgId: event.orgId.trim(),
      unitId: event.unitId?.trim().isEmpty ?? true
          ? null
          : event.unitId!.trim(),
      page: event.page,
      limit: event.limit,
    );

    if (response.hasData) {
      emit(MaintenanceListSuccess(maintenanceList: response.data!));
      return;
    }

    emit(
      MaintenanceFailed(
        message: response.error ?? 'Unable to load maintenance requests',
      ),
    );
  }
}
