import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:naseem/module/admin/unit/model/unit_list_item.dart';

import '../../repo/unit_repo.dart';

part 'unit_list_event.dart';
part 'unit_list_state.dart';

class UnitListBloc extends Bloc<UnitListEvent, UnitListState> {
  UnitListBloc({required UnitRepo unitRepo})
    : _unitRepo = unitRepo,
      super(const UnitListInitial()) {
    on<GetUnits>(_onGetUnits);
    on<SearchUnits>(_onSearchUnits);
    on<LoadMoreUnits>(_onLoadMoreUnits);
  }

  final UnitRepo _unitRepo;

  static const int _limit = 6;

  int _currentPage = 1;
  int _requestVersion = 0;

  String _communityId = '';
  String _searchQuery = '';

  bool _hasMore = true;
  bool _isLoadingMore = false;
  String? _loadMoreError;

  List<UnitListItem> _units = [];

  Future<void> _onGetUnits(GetUnits event, Emitter<UnitListState> emit) async {
    await _loadFirstPage(
      emit: emit,
      communityId: event.communityId,
      searchQuery: event.searchQuery ?? '',
    );
  }

  Future<void> _onSearchUnits(
    SearchUnits event,
    Emitter<UnitListState> emit,
  ) async {
    await _loadFirstPage(
      emit: emit,
      communityId: event.communityId,
      searchQuery: event.searchQuery,
    );
  }

  Future<void> _loadFirstPage({
    required Emitter<UnitListState> emit,
    required String communityId,
    required String searchQuery,
  }) async {
    // Invalidate requests from older searches and pagination.
    final requestVersion = ++_requestVersion;

    _communityId = communityId.trim();
    _searchQuery = searchQuery.trim();

    _currentPage = 1;
    _hasMore = true;
    _isLoadingMore = false;
    _loadMoreError = null;
    _units = [];

    emit(const UnitListLoading());

    try {
      final response = await _unitRepo.getUnits(
        communityId: _communityId,
        page: 1,
        limit: _limit,
        searchQuery: _searchQuery.isEmpty ? null : _searchQuery,
      );

      if (requestVersion != _requestVersion || emit.isDone) return;

      if (!response.hasData) {
        emit(UnitListFailed(response.error ?? 'Unable to load units.'));
        return;
      }

      _units = response.data ?? [];
      _currentPage = 1;
      _hasMore = (response.data ?? []).length == _limit;

      emit(_successState());
    } catch (e) {
      if (requestVersion != _requestVersion || emit.isDone) return;

      emit(UnitListFailed('Unable to load units. Please try again.'));
    }
  }

  Future<void> _onLoadMoreUnits(
    LoadMoreUnits event,
    Emitter<UnitListState> emit,
  ) async {
    if (_isLoadingMore || !_hasMore) return;
    if (event.communityId.trim() != _communityId) return;

    final requestVersion = _requestVersion;
    final nextPage = _currentPage + 1;

    _isLoadingMore = true;
    _loadMoreError = null;
    emit(_successState());

    try {
      final response = await _unitRepo.getUnits(
        communityId: _communityId,
        page: nextPage,
        limit: _limit,
        searchQuery: _searchQuery.isEmpty ? null : _searchQuery,
      );

      if (requestVersion != _requestVersion) return;

      if (!response.hasData) {
        _loadMoreError = response.error ?? 'Unable to load more units.';
      } else {
        final newUnits = response.data ?? [];
        final existingIds = _units.map((u) => u.id).toSet();

        _units.addAll(newUnits.where((u) => existingIds.add(u.id)));
        _currentPage = nextPage;
        _hasMore = newUnits.length == _limit;
      }
    } catch (e) {
      if (requestVersion != _requestVersion) return;
      _loadMoreError = 'Unable to load more units. Please retry.';
    }

    if (requestVersion != _requestVersion || emit.isDone) return;

    _isLoadingMore = false;
    emit(_successState());
  }

  UnitLoadSuccess _successState() {
    return UnitLoadSuccess(
      units: List.unmodifiable(_units),
      hasMore: _hasMore,
      isLoadingMore: _isLoadingMore,
      loadMoreError: _loadMoreError,
    );
  }
}
