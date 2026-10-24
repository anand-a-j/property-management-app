import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naseem/module/admin/unit/model/unit_list_item.dart';

import '../../../model/unit.dart';
import '../../repo/unit_repo.dart';

part 'unit_list_event.dart';
part 'unit_list_state.dart';

class UnitListBloc extends Bloc<UnitListEvent, UnitListState> {
  final UnitRepo _unitRepo;

  int _currentPage = 1;

  static const int _limit = 8;

  String _communityId = '';
  String _searchQuery = '';

  List<UnitListItem> _units = [];

  bool _hasMore = true;
  bool _isLoadingMore = false;

  UnitListBloc({required UnitRepo unitRepo})
    : _unitRepo = unitRepo,
      super(const UnitListInitial()) {
    on<GetUnits>(_onGetUnits);
    on<LoadMoreUnits>(_onLoadMoreUnits);
    on<SearchUnits>(_onSearchUnits);
  }

  // =========================================================
  // GET UNITS
  // =========================================================

  Future<void> _onGetUnits(
    GetUnits event,
    Emitter<UnitListState> emit,
  ) async {
    _communityId = event.communityId.trim();
    _searchQuery = event.searchQuery?.trim() ?? '';

    _currentPage = 1;
    _units = [];
    _hasMore = true;
    _isLoadingMore = false;

    emit(const UnitListLoading());

    final response = await _unitRepo.getUnits(
      communityId: _communityId,
      page: _currentPage,
      limit: _limit,
      searchQuery: _searchQuery.isEmpty ? null : _searchQuery,
    );

    if (response.hasData) {
      _units = response.data ?? [];
      _hasMore = _units.length == _limit;

      emit(
        UnitLoadSuccess(
          units: List.unmodifiable(_units),
          hasMore: _hasMore,
          isLoadingMore: false,
        ),
      );
    } else {
      emit(UnitListFailed(response.error ?? 'Something went wrong'));
    }
  }

  // =========================================================
  // LOAD MORE
  // =========================================================

  Future<void> _onLoadMoreUnits(
    LoadMoreUnits event,
    Emitter<UnitListState> emit,
  ) async {
    if (_isLoadingMore || !_hasMore) return;

    final communityId = event.communityId.trim();

    // Ignore pagination events for another community.
    if (communityId != _communityId) return;

    _isLoadingMore = true;

    emit(
      UnitLoadSuccess(
        units: List.unmodifiable(_units),
        hasMore: _hasMore,
        isLoadingMore: true,
      ),
    );

    final nextPage = _currentPage + 1;

    final response = await _unitRepo.getUnits(
      communityId: _communityId,
      page: nextPage,
      limit: _limit,
      searchQuery: _searchQuery.isEmpty ? null : _searchQuery,
    );

    if (response.hasData) {
      final newUnits = response.data ?? [];

      _currentPage = nextPage;
      _units.addAll(newUnits);
      _hasMore = newUnits.length == _limit;
    }

    _isLoadingMore = false;

    if (response.hasError) {
      // Preserve the already loaded units on pagination failure.
      emit(
        UnitLoadSuccess(
          units: List.unmodifiable(_units),
          hasMore: _hasMore,
          isLoadingMore: false,
        ),
      );
      return;
    }

    emit(
      UnitLoadSuccess(
        units: List.unmodifiable(_units),
        hasMore: _hasMore,
        isLoadingMore: false,
      ),
    );
  }

  // =========================================================
  // SEARCH UNITS
  // =========================================================

  Future<void> _onSearchUnits(
    SearchUnits event,
    Emitter<UnitListState> emit,
  ) async {
    _communityId = event.communityId.trim();
    _searchQuery = event.searchQuery.trim();

    // Reset pagination for the new search.
    _currentPage = 1;
    _hasMore = true;
    _isLoadingMore = false;
    _units = [];

    emit(const UnitListLoading());

    final response = await _unitRepo.getUnits(
      communityId: _communityId,
      page: _currentPage,
      limit: _limit,
      searchQuery: _searchQuery.isEmpty ? null : _searchQuery,
    );

    if (response.hasData) {
      _units = response.data ?? [];
      _hasMore = _units.length == _limit;

      emit(
        UnitLoadSuccess(
          units: List.unmodifiable(_units),
          hasMore: _hasMore,
          isLoadingMore: false,
        ),
      );
    } else {
      emit(UnitListFailed(response.error ?? 'Something went wrong'));
    }
  }
}
