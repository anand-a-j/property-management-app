import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:naseem/module/admin/maintainence/controller/repo/maintenance_repo.dart' show MaintenanceRepo;
import 'package:naseem/module/admin/maintainence/model/maintenance_request.dart';

part 'maintenance_list_event.dart';
part 'maintenance_list_state.dart';

class MaintenanceListBloc
    extends Bloc<MaintenanceListEvent, MaintenanceListState> {
  final MaintenanceRepo _maintenanceRepo;

  MaintenanceListBloc({required MaintenanceRepo maintenanceRepo})
    : _maintenanceRepo = maintenanceRepo,
      super(const MaintenanceListInitial()) {
    on<GetMaintenanceListEvent>(_onGetMaintenanceList);
  }

  Future<void> _onGetMaintenanceList(
    GetMaintenanceListEvent event,
    Emitter<MaintenanceListState> emit,
  ) async {
    emit(const MaintenanceListLoading());

    final unitId = event.unitId?.trim();

    final response = await _maintenanceRepo.getMaintenanceList(
      orgId: event.orgId.trim(),
      unitId: unitId == null || unitId.isEmpty ? null : unitId,
      page: event.page,
      limit: event.limit,
    );

    if (response.hasData) {
      emit(MaintenanceListSuccess(maintenanceList: response.data!));
      return;
    }

    emit(
      MaintenanceListFailed(
        message: response.error ?? 'Unable to load maintenance requests',
      ),
    );
  }
}
