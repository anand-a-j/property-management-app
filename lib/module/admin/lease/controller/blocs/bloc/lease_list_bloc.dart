import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/lease.dart';
import '../../repo/lease_repo.dart';

part 'lease_list_event.dart';
part 'lease_list_state.dart';

class LeaseListBloc extends Bloc<LeaseListEvent, LeaseListState> {
  final LeaseRepo _leaseRepo;

  static const int _limit = 3;

  int _currentPage = 1;
  int _requestVersion = 0;

  String _orgId = '';
  String? _unitId;
  String? _residentId;
  String _searchQuery = '';
  bool _isDraftOnly = false;

  bool _hasMore = true;
  bool _isLoadingMore = false;

  List<Lease> _leases = [];

  LeaseListBloc({required LeaseRepo leaseRepo})
    : _leaseRepo = leaseRepo,
      super(const LeaseListInitial()) {
    on<GetLeases>(_onGetLeases);
    on<SearchLeases>(_onSearchLeases);
    on<LoadMoreLeases>(_onLoadMoreLeases);
  }

  Future<void> _onGetLeases(
    GetLeases event,
    Emitter<LeaseListState> emit,
  ) async {
    await _loadFirstPage(
      emit: emit,
      orgId: event.orgId,
      unitId: event.unitId,
      residentId: event.residentId,
      searchQuery: event.searchQuery ?? '',
      draftOnly: event.isDraftOnly,
    );
  }

  Future<void> _onSearchLeases(
    SearchLeases event,
    Emitter<LeaseListState> emit,
  ) async {
    await _loadFirstPage(
      emit: emit,
      orgId: event.orgId,
      unitId: event.unitId,
      searchQuery: event.searchQuery,
      draftOnly: event.isDraftOnly,
      residentId: null,
    );
  }

  Future<void> _loadFirstPage({
    required Emitter<LeaseListState> emit,
    required String orgId,
    required String? unitId,
    required String? residentId,
    required String searchQuery,
    required bool draftOnly,
  }) async {
    final requestVersion = ++_requestVersion;

    _orgId = orgId.trim();
    _unitId = unitId?.trim();
    _residentId = residentId?.trim();
    _searchQuery = searchQuery.trim();
    _isDraftOnly = draftOnly;

    _currentPage = 1;
    _hasMore = true;
    _isLoadingMore = false;
    _leases = [];

    emit(const LeaseListLoading());

    final response = await _leaseRepo.getAllLeases(
      orgId: _orgId,
      unitId: _unitId?.isEmpty == true ? null : _unitId,
      residentId: _residentId?.isEmpty == true ? null : _residentId,
      page: 1,
      limit: _limit,
      searchQuery: _searchQuery.isEmpty ? null : _searchQuery,
      draftOnly: _isDraftOnly,
    );

    if (requestVersion != _requestVersion || emit.isDone) return;

    if (!response.hasData) {
      emit(LeaseListFailed(response.error ?? 'Unable to load leases.'));
      return;
    }

    _leases = response.data ?? [];
    _currentPage = 1;
    _hasMore = _leases.length == _limit;

    emit(
      LeaseListSuccess(leases: List.unmodifiable(_leases), hasMore: _hasMore),
    );
  }

  Future<void> _onLoadMoreLeases(
    LoadMoreLeases event,
    Emitter<LeaseListState> emit,
  ) async {
    if (_isLoadingMore || !_hasMore || emit.isDone) return;

    // Capture the version and query for this request.
    final requestVersion = _requestVersion;
    final nextPage = _currentPage + 1;

    _isLoadingMore = true;

    emit(
      LeaseListSuccess(
        leases: List.unmodifiable(_leases),
        hasMore: _hasMore,
        isLoadingMore: true,
      ),
    );

    try {
      final response = await _leaseRepo.getAllLeases(
        orgId: _orgId,
        unitId: _unitId?.isEmpty == true ? null : _unitId,
        residentId: _residentId?.isEmpty == true ? null : _residentId,
        page: nextPage,
        limit: _limit,
        searchQuery: _searchQuery.isEmpty ? null : _searchQuery,
        draftOnly: _isDraftOnly,
      );

      // Ignore a response belonging to an earlier search.
      if (requestVersion != _requestVersion || emit.isDone) return;

      if (!response.hasData) {
        emit(
          LeaseListSuccess(
            leases: List.unmodifiable(_leases),
            hasMore: _hasMore,
            loadMoreError: response.error ?? 'Unable to load more leases.',
          ),
        );
        return;
      }

      final newLeases = response.data ?? [];

      // Advance only after a successful response.
      _currentPage = nextPage;

      // Avoid duplicate records if the response overlaps.
      final existingIds = _leases.map((lease) => lease.id).toSet();
      final uniqueNewLeases = newLeases
          .where((lease) => existingIds.add(lease.id))
          .toList();

      _leases = [..._leases, ...uniqueNewLeases];
      _hasMore = newLeases.length == _limit;

      emit(
        LeaseListSuccess(leases: List.unmodifiable(_leases), hasMore: _hasMore),
      );
    } catch (e) {
      if (requestVersion != _requestVersion || emit.isDone) return;

      emit(
        LeaseListSuccess(
          leases: List.unmodifiable(_leases),
          hasMore: _hasMore,
          loadMoreError: 'Unable to load more leases. Please retry.',
        ),
      );
    } finally {
      // Don't reset the loading flag belonging to a newer request.
      if (requestVersion == _requestVersion) {
        _isLoadingMore = false;
      }
    }
  }
}
