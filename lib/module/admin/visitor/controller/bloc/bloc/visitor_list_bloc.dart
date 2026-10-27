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
  int _requestVersion = 0;

  String _orgId = '';
  String? _unitId;
  String? _residentId;

  List<Visitor> _visitors = [];

  bool _hasMore = true;
  bool _isLoadingMore = false;

  VisitorListBloc({required VisitorRepo visitorRepo})
    : _visitorRepo = visitorRepo,
      super(const VisitorListInitial()) {
    on<GetVisitorsEvent>(_onGetVisitors);
    on<LoadMoreVisitorsEvent>(_onLoadMoreVisitors);
  }

  String? _normalizeId(String? id) {
    final value = id?.trim();
    return value == null || value.isEmpty ? null : value;
  }

  Future<void> _onGetVisitors(
    GetVisitorsEvent event,
    Emitter<VisitorListState> emit,
  ) async {
    final version = ++_requestVersion;

    _orgId = event.orgId.trim();
    _unitId = _normalizeId(event.unitId);
    _residentId = _normalizeId(event.residentId);

    _currentPage = 1;
    _visitors = [];
    _hasMore = true;
    _isLoadingMore = false;

    emit(const VisitorListLoading());

    try {
      final response = await _visitorRepo.getVisitors(
        orgId: _orgId,
        unitId: _unitId,
        residentId: _residentId,
        limit: _limit,
        offset: 0,
      );

      if (version != _requestVersion || emit.isDone) return;

      if (response.hasError) {
        emit(
          VisitorListFailed(
            message: response.error?.toString() ?? 'Failed to fetch visitors',
          ),
        );
        return;
      }

      _visitors = response.data ?? [];
      _currentPage = 1;
      _hasMore = _visitors.length == _limit;

      emit(
        VisitorListSuccess(
          visitors: List.unmodifiable(_visitors),
          hasMore: _hasMore,
        ),
      );
    } catch (e) {
      if (version != _requestVersion || emit.isDone) return;

      emit(
        VisitorListFailed(message: 'Failed to fetch visitors. Please retry.'),
      );
    }
  }

  Future<void> _onLoadMoreVisitors(
    LoadMoreVisitorsEvent event,
    Emitter<VisitorListState> emit,
  ) async {
    if (_isLoadingMore || !_hasMore || emit.isDone) return;

    final requestedOrgId = event.orgId.trim();
    final requestedUnitId = _normalizeId(event.unitId);
    final requestedResidentId = _normalizeId(event.residentId);

    if (requestedOrgId != _orgId ||
        requestedUnitId != _unitId ||
        requestedResidentId != _residentId) {
      return;
    }

    final version = _requestVersion;
    final nextPage = _currentPage + 1;

    _isLoadingMore = true;

    emit(
      VisitorListSuccess(
        visitors: List.unmodifiable(_visitors),
        hasMore: _hasMore,
        isLoadingMore: true,
      ),
    );

    try {
      final response = await _visitorRepo.getVisitors(
        orgId: _orgId,
        unitId: _unitId,
        residentId: _residentId,
        limit: _limit,
        offset: (nextPage - 1) * _limit,
      );

      if (version != _requestVersion || emit.isDone) return;

      if (response.hasError) {
        emit(
          VisitorListSuccess(
            visitors: List.unmodifiable(_visitors),
            hasMore: _hasMore,
            loadMoreError:
                response.error?.toString() ?? 'Failed to load more visitors.',
          ),
        );
        return;
      }

      final newVisitors = response.data ?? [];

      // Avoid duplicates when pages overlap.
      final existingIds = _visitors.map((visitor) => visitor.id).toSet();
      final uniqueVisitors = newVisitors
          .where((visitor) => existingIds.add(visitor.id))
          .toList();

      _visitors = [..._visitors, ...uniqueVisitors];
      _currentPage = nextPage;
      _hasMore = newVisitors.length == _limit;

      emit(
        VisitorListSuccess(
          visitors: List.unmodifiable(_visitors),
          hasMore: _hasMore,
        ),
      );
    } catch (e) {
      if (version != _requestVersion || emit.isDone) return;

      emit(
        VisitorListSuccess(
          visitors: List.unmodifiable(_visitors),
          hasMore: _hasMore,
          loadMoreError: 'Failed to load more visitors. Please retry.',
        ),
      );
    } finally {
      if (version == _requestVersion) {
        _isLoadingMore = false;
      }
    }
  }
}
