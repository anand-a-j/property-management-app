import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/staff_maintenance_overview.dart';
import '../repo/maintaince_staff_repo.dart';

part 'maintenance_staff_event.dart';
part 'maintenance_staff_state.dart';

class MaintenanceStaffBloc
    extends Bloc<MaintenanceStaffEvent, MaintenanceStaffState> {
  final MaintainceStaffRepo _repo;

  static const int _limit = 10;

  int _currentPage = 1;

  String _orgId = '';

  StaffMaintenanceOverview? _overview;

  bool _hasMore = true;
  bool _isLoadingMore = false;

  MaintenanceStaffBloc({required MaintainceStaffRepo repo})
    : _repo = repo,
      super(const MaintenanceStaffInitial()) {
    on<FetchStaffMaintenanceList>(_onFetchStaffMaintenanceList);
    on<LoadMoreStaffMaintenanceList>(_onLoadMoreStaffMaintenanceList);
  }

  // =========================================================
  // FETCH MAINTENANCE LIST
  // =========================================================

  Future<void> _onFetchStaffMaintenanceList(
    FetchStaffMaintenanceList event,
    Emitter<MaintenanceStaffState> emit,
  ) async {
    _orgId = event.orgId.trim();
    _currentPage = 1;

    _overview = null;
    _hasMore = true;
    _isLoadingMore = false;

    if (_orgId.isEmpty) {
      emit(
        const MaintenanceStaffFailed(message: 'Organization ID is required.'),
      );
      return;
    }

    emit(const MaintenanceStaffLoading());

    try {
      final response = await _repo.getStaffMaintenanceList(
        orgId: _orgId,
        page: _currentPage,
        limit: _limit,
      );

      if (response.hasData) {
        _overview = response.data!;

        _hasMore = _overview!.maintenanceList.length == _limit;

        emit(
          MaintenanceStaffSuccess(
            overview: _overview!,
            hasMore: _hasMore,
            isLoadingMore: false,
          ),
        );
      } else {
        emit(
          MaintenanceStaffFailed(
            message:
                response.error?.toString() ??
                'Failed to fetch maintenance requests.',
          ),
        );
      }
    } catch (e) {
      emit(MaintenanceStaffFailed(message: e.toString()));
    }
  }

  // =========================================================
  // LOAD MORE MAINTENANCE
  // =========================================================

  Future<void> _onLoadMoreStaffMaintenanceList(
    LoadMoreStaffMaintenanceList event,
    Emitter<MaintenanceStaffState> emit,
  ) async {
    if (_isLoadingMore || !_hasMore || _overview == null) {
      return;
    }

    final orgId = event.orgId.trim();

    if (orgId.isEmpty || orgId != _orgId) {
      return;
    }

    _isLoadingMore = true;

    emit(
      MaintenanceStaffSuccess(
        overview: _overview!,
        hasMore: _hasMore,
        isLoadingMore: true,
      ),
    );

    final nextPage = _currentPage + 1;

    try {
      final response = await _repo.getStaffMaintenanceList(
        orgId: _orgId,
        page: nextPage,
        limit: _limit,
      );

      if (response.hasData) {
        final nextOverview = response.data!;
        final newTickets = nextOverview.maintenanceList;

        _currentPage = nextPage;

        _hasMore = newTickets.length == _limit;

        _overview = _overview!.copyWith(
          maintenanceList: [..._overview!.maintenanceList, ...newTickets],
        );
      }

      _isLoadingMore = false;

      emit(
        MaintenanceStaffSuccess(
          overview: _overview!,
          hasMore: _hasMore,
          isLoadingMore: false,
        ),
      );
    } catch (_) {
      _isLoadingMore = false;

      emit(
        MaintenanceStaffSuccess(
          overview: _overview!,
          hasMore: _hasMore,
          isLoadingMore: false,
        ),
      );
    }
  }
}
