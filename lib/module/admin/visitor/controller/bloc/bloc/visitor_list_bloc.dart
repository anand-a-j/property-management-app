import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/visitor.dart';
import '../../repo/visitor_repo.dart';

part 'visitor_list_event.dart';
part 'visitor_list_state.dart';

class VisitorListBloc extends Bloc<VisitorListEvent, VisitorListState> {
  final VisitorRepo _visitorRepo;

  static const int _limit = 8;

  int _currentPage = 1;

  String _orgId = '';
  String? _unitId;

  List<Visitor> _visitors = [];

  bool _hasMore = true;
  bool _isLoadingMore = false;

  VisitorListBloc({required VisitorRepo visitorRepo})
    : _visitorRepo = visitorRepo,
      super(const VisitorListInitial()) {
    on<GetVisitorsEvent>(_onGetVisitors);
    on<LoadMoreVisitorsEvent>(_onLoadMoreVisitors);
  }

  Future<void> _onGetVisitors(
    GetVisitorsEvent event,
    Emitter<VisitorListState> emit,
  ) async {
    _orgId = event.orgId.trim();
    _unitId = event.unitId?.trim();

    if (_unitId?.isEmpty ?? false) {
      _unitId = null;
    }

    _currentPage = 1;
    _visitors = [];
    _hasMore = true;
    _isLoadingMore = false;

    emit(const VisitorListLoading());

    final response = await _visitorRepo.getVisitors(
      orgId: _orgId,
      unitId: _unitId,
      limit: _limit,
      offset: 0,
    );

    if (response.hasError) {
      emit(
        VisitorListFailed(
          message: response.error?.toString() ?? 'Failed to fetch visitors',
        ),
      );
      return;
    }

    _visitors = response.data ?? [];
    _hasMore = _visitors.length == _limit;

    emit(
      VisitorListSuccess(
        visitors: List.unmodifiable(_visitors),
        hasMore: _hasMore,
      ),
    );
  }

  Future<void> _onLoadMoreVisitors(
    LoadMoreVisitorsEvent event,
    Emitter<VisitorListState> emit,
  ) async {
    if (_isLoadingMore || !_hasMore) return;

    final requestedOrgId = event.orgId.trim();
    final requestedUnitId = event.unitId?.trim();

    final normalizedUnitId = requestedUnitId == null || requestedUnitId.isEmpty
        ? null
        : requestedUnitId;

    if (requestedOrgId != _orgId || normalizedUnitId != _unitId) {
      return;
    }

    _isLoadingMore = true;

    emit(
      VisitorListSuccess(
        visitors: List.unmodifiable(_visitors),
        hasMore: _hasMore,
        isLoadingMore: true,
      ),
    );

    final nextPage = _currentPage + 1;

    final response = await _visitorRepo.getVisitors(
      orgId: _orgId,
      unitId: _unitId,
      limit: _limit,
      offset: (nextPage - 1) * _limit,
    );

    if (response.hasError) {
      _isLoadingMore = false;

      // Preserve the currently loaded visitors.
      emit(
        VisitorListSuccess(
          visitors: List.unmodifiable(_visitors),
          hasMore: _hasMore,
          isLoadingMore: false,
        ),
      );
      return;
    }

    final newVisitors = response.data ?? [];

    _visitors.addAll(newVisitors);
    _currentPage = nextPage;
    _hasMore = newVisitors.length == _limit;
    _isLoadingMore = false;

    emit(
      VisitorListSuccess(
        visitors: List.unmodifiable(_visitors),
        hasMore: _hasMore,
        isLoadingMore: false,
      ),
    );
  }
}
