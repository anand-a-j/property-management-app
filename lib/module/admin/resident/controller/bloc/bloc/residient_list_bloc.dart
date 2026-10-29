import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/resident_list_response.dart';
import '../../repo/resident_repo.dart';

part 'residient_list_event.dart';
part 'residient_list_state.dart';

class ResidentListBloc extends Bloc<ResidentListEvent, ResidentListState> {
  final ResidentRepo _repo;

  static const int _limit = 6;

  int _currentPage = 1;
  int _requestVersion = 0;

  String _orgId = '';
  String _searchQuery = '';

  bool _hasMore = true;
  bool _isLoadingMore = false;

  List<ResidentListResponse> _residents = [];

  ResidentListBloc({required ResidentRepo repo})
    : _repo = repo,
      super(const ResidentListInitial()) {
    on<FetchResidents>(_onFetchResidents);
    on<LoadMoreResidents>(_onLoadMoreResidents);
    on<SearchResidents>(_onSearchResidents);
  }

  Future<void> _onFetchResidents(
    FetchResidents event,
    Emitter<ResidentListState> emit,
  ) async {
    await _loadFirstPage(emit: emit, orgId: event.orgId, searchQuery: '');
  }

  Future<void> _onSearchResidents(
    SearchResidents event,
    Emitter<ResidentListState> emit,
  ) async {
    await _loadFirstPage(
      emit: emit,
      orgId: event.orgId,
      searchQuery: event.searchQuery,
    );
  }

  Future<void> _loadFirstPage({
    required Emitter<ResidentListState> emit,
    required String orgId,
    required String searchQuery,
  }) async {
    final requestVersion = ++_requestVersion;

    _orgId = orgId.trim();
    _searchQuery = searchQuery.trim();

    _currentPage = 1;
    _hasMore = true;
    _isLoadingMore = false;
    _residents = [];

    emit(const ResidentListLoading());

    try {
      final response = await _repo.fetchResidents(
        orgId: _orgId,
        searchQuery: _searchQuery.isEmpty ? null : _searchQuery,
        page: 1,
        limit: _limit,
      );

      // Ignore stale requests.
      if (requestVersion != _requestVersion || emit.isDone) return;

      if (!response.hasData) {
        emit(ResidentListFailed(response.error ?? 'Unable to load residents.'));
        return;
      }

      _residents = response.data ?? [];
      _currentPage = 1;
      _hasMore = _residents.length == _limit;

      emit(
        ResidentListSuccess(
          residents: List.unmodifiable(_residents),
          hasMore: _hasMore,
        ),
      );
    } catch (e) {
      if (requestVersion != _requestVersion || emit.isDone) return;

      emit(ResidentListFailed('Unable to load residents. Please try again.'));
    }
  }

  Future<void> _onLoadMoreResidents(
    LoadMoreResidents event,
    Emitter<ResidentListState> emit,
  ) async {
    if (_isLoadingMore || !_hasMore || emit.isDone) return;

    final requestVersion = _requestVersion;
    final nextPage = _currentPage + 1;

    _isLoadingMore = true;

    emit(
      ResidentListSuccess(
        residents: List.unmodifiable(_residents),
        hasMore: _hasMore,
        isLoadingMore: true,
      ),
    );

    try {
      final response = await _repo.fetchResidents(
        orgId: _orgId,
        searchQuery: _searchQuery.isEmpty ? null : _searchQuery,
        page: nextPage,
        limit: _limit,
      );

      // Ignore responses from an older search or fetch.
      if (requestVersion != _requestVersion || emit.isDone) return;

      if (!response.hasData) {
        emit(
          ResidentListSuccess(
            residents: List.unmodifiable(_residents),
            hasMore: _hasMore,
            loadMoreError: response.error ?? 'Unable to load more residents.',
          ),
        );
        return;
      }

      final newResidents = response.data ?? [];

      // Advance only after a successful response.
      _currentPage = nextPage;

      // Prevent duplicate residents using their profile IDs.
      final existingIds = _residents
          .map((resident) => resident.profile.id)
          .toSet();

      final uniqueNewResidents = newResidents
          .where((resident) => existingIds.add(resident.profile.id))
          .toList();

      _residents = [..._residents, ...uniqueNewResidents];

      _hasMore = newResidents.length == _limit;

      emit(
        ResidentListSuccess(
          residents: List.unmodifiable(_residents),
          hasMore: _hasMore,
        ),
      );
    } catch (e) {
      if (requestVersion != _requestVersion || emit.isDone) return;

      emit(
        ResidentListSuccess(
          residents: List.unmodifiable(_residents),
          hasMore: _hasMore,
          loadMoreError: 'Unable to load more residents. Please retry.',
        ),
      );
    } finally {
      // Only reset the flag if this request still owns it.
      if (requestVersion == _requestVersion) {
        _isLoadingMore = false;
      }
    }
  }
}
