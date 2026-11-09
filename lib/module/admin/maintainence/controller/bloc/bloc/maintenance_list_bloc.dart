import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:naseem/module/admin/maintainence/controller/repo/maintenance_repo.dart'
    show MaintenanceRepo;
import 'package:naseem/module/admin/maintainence/model/maintenance_request.dart';

part 'maintenance_list_event.dart';
part 'maintenance_list_state.dart';

class MaintenanceListBloc
    extends Bloc<MaintenanceListEvent, MaintenanceListState> {
  MaintenanceListBloc({required MaintenanceRepo maintenanceRepo})
    : _maintenanceRepo = maintenanceRepo,
      super(const MaintenanceListInitial()) {
    on<GetMaintenanceListEvent>(_onGetMaintenanceList);
    on<LoadMoreMaintenanceEvent>(_onLoadMoreMaintenance);
  }

  final MaintenanceRepo _maintenanceRepo;

  static const int _limit = 6;

  int _currentPage = 1;
  int _requestVersion = 0;

  String _orgId = '';
  String? _unitId;

  bool _hasMore = true;
  bool _isLoadingMore = false;
  String? _loadMoreError;

  List<MaintenanceRequest> _maintenanceList = [];

  Future<void> _onGetMaintenanceList(
    GetMaintenanceListEvent event,
    Emitter<MaintenanceListState> emit,
  ) async {
    await _loadFirstPage(emit: emit, orgId: event.orgId, unitId: event.unitId);
  }

  Future<void> _loadFirstPage({
    required Emitter<MaintenanceListState> emit,
    required String orgId,
    String? unitId,
  }) async {
    // Invalidate previous requests.
    final requestVersion = ++_requestVersion;

    _orgId = orgId.trim();
    final trimmedUnitId = unitId?.trim();
    _unitId = trimmedUnitId == null || trimmedUnitId.isEmpty
        ? null
        : trimmedUnitId;

    _currentPage = 1;
    _hasMore = true;
    _isLoadingMore = false;
    _loadMoreError = null;
    _maintenanceList = [];

    if (_orgId.isEmpty) {
      emit(
        const MaintenanceListFailed(
          message: 'Unable to identify your organization.',
        ),
      );
      return;
    }

    emit(const MaintenanceListLoading());

    try {
      final response = await _maintenanceRepo.getMaintenanceList(
        orgId: _orgId,
        unitId: _unitId,
        page: 1,
        limit: _limit,
      );

      if (requestVersion != _requestVersion || emit.isDone) return;

      if (!response.hasData) {
        emit(
          MaintenanceListFailed(
            message: response.error ?? 'Unable to load maintenance requests.',
          ),
        );
        return;
      }

      _maintenanceList = response.data ?? [];
      _currentPage = 1;
      _hasMore = _maintenanceList.length == _limit;

      emit(_successState());
    } catch (e) {
      if (requestVersion != _requestVersion || emit.isDone) return;

      emit(
        const MaintenanceListFailed(
          message: 'Unable to load maintenance requests. Please try again.',
        ),
      );
    }
  }

  Future<void> _onLoadMoreMaintenance(
    LoadMoreMaintenanceEvent event,
    Emitter<MaintenanceListState> emit,
  ) async {
    if (_isLoadingMore || !_hasMore) return;

    final requestVersion = _requestVersion;
    final nextPage = _currentPage + 1;

    _isLoadingMore = true;
    _loadMoreError = null;

    emit(_successState());

    try {
      final response = await _maintenanceRepo.getMaintenanceList(
        orgId: _orgId,
        unitId: _unitId,
        page: nextPage,
        limit: _limit,
      );

      if (requestVersion != _requestVersion) return;

      if (!response.hasData) {
        _loadMoreError =
            response.error ?? 'Unable to load more maintenance requests.';
      } else {
        final newItems = response.data ?? [];

        final existingIds = _maintenanceList.map((item) => item.id).toSet();

        _maintenanceList.addAll(
          newItems.where((item) => existingIds.add(item.id)),
        );

        _currentPage = nextPage;
        _hasMore = newItems.length == _limit;
      }
    } catch (e) {
      if (requestVersion != _requestVersion) return;

      _loadMoreError =
          'Unable to load more maintenance requests. Please retry.';
    }

    if (requestVersion != _requestVersion || emit.isDone) return;

    _isLoadingMore = false;

    emit(_successState());
  }

  MaintenanceListSuccess _successState() {
    return MaintenanceListSuccess(
      maintenanceList: List.unmodifiable(_maintenanceList),
      hasMore: _hasMore,
      isLoadingMore: _isLoadingMore,
      loadMoreError: _loadMoreError,
    );
  }
}
