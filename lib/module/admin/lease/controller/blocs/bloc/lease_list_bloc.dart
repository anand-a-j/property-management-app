import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/lease.dart';
import '../../repo/lease_repo.dart';

part 'lease_list_event.dart';
part 'lease_list_state.dart';

class LeaseListBloc extends Bloc<LeaseListEvent, LeaseListState> {
  final LeaseRepo _leaseRepo;

  static const int _limit = 15;

  int _currentPage = 1;

  String _orgId = '';
  String? _unitId;
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
    _orgId = event.orgId.trim();
    _unitId = event.unitId?.trim();
    _searchQuery = event.searchQuery?.trim() ?? '';
    _isDraftOnly = event.isDraftOnly;

    _currentPage = 1;
    _hasMore = true;
    _isLoadingMore = false;
    _leases = [];

    emit(const LeaseListLoading());

    await _fetchLeases(emit);
  }

  Future<void> _onSearchLeases(
    SearchLeases event,
    Emitter<LeaseListState> emit,
  ) async {
    _orgId = event.orgId.trim();
    _unitId = event.unitId?.trim();
    _searchQuery = event.searchQuery.trim();
    _isDraftOnly = event.isDraftOnly;

    _currentPage = 1;
    _hasMore = true;
    _isLoadingMore = false;
    _leases = [];

    emit(const LeaseListLoading());

    await _fetchLeases(emit);
  }

  Future<void> _onLoadMoreLeases(
    LoadMoreLeases event,
    Emitter<LeaseListState> emit,
  ) async {
    if (_isLoadingMore || !_hasMore) return;

    _isLoadingMore = true;

    emit(
      LeaseListSuccess(
        leases: List.unmodifiable(_leases),
        hasMore: _hasMore,
        isLoadingMore: true,
      ),
    );

    final nextPage = _currentPage + 1;

    final response = await _leaseRepo.getAllLeases(
      orgId: _orgId,
      unitId: _unitId?.isEmpty == true ? null : _unitId,
      page: nextPage,
      limit: _limit,
      searchQuery: _searchQuery.isEmpty ? null : _searchQuery,
      draftOnly: _isDraftOnly,
    );

    _isLoadingMore = false;

    if (response.hasData) {
      final newLeases = response.data ?? [];

      _currentPage = nextPage;
      _leases = [..._leases, ...newLeases];
      _hasMore = newLeases.length == _limit;

      emit(
        LeaseListSuccess(leases: List.unmodifiable(_leases), hasMore: _hasMore),
      );
    } else {
      emit(
        LeaseListSuccess(leases: List.unmodifiable(_leases), hasMore: _hasMore),
      );
    }
  }

  Future<void> _fetchLeases(Emitter<LeaseListState> emit) async {
    final response = await _leaseRepo.getAllLeases(
      orgId: _orgId,
      unitId: _unitId?.isEmpty == true ? null : _unitId,
      page: 1,
      limit: _limit,
      searchQuery: _searchQuery.isEmpty ? null : _searchQuery,
      draftOnly: _isDraftOnly,
    );

    if (response.hasData) {
      _leases = response.data ?? [];
      _hasMore = _leases.length == _limit;

      emit(
        LeaseListSuccess(leases: List.unmodifiable(_leases), hasMore: _hasMore),
      );
    } else {
      emit(LeaseListFailed(response.error ?? 'Something went wrong'));
    }
  }
}
