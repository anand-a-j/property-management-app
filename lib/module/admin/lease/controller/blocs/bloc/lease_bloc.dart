import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:naseem/module/admin/lease/controller/repo/lease_repo.dart';

import '../../../model/lease.dart';

part 'lease_event.dart';
part 'lease_state.dart';

class LeaseBloc extends Bloc<LeaseEvent, LeaseState> {
  final LeaseRepo _leaseRepo;

  int _currentPage = 1;
  final int _limit = 15;

  String _orgId = '';
  String _unitId = '';
  String _searchQuery = '';

  List<Lease> _leases = [];

  bool _hasMore = true;
  bool _isLoadingMore = false;

  LeaseBloc({required LeaseRepo leaseRepo})
    : _leaseRepo = leaseRepo,
      super(const LeaseInitial()) {
    on<AddLease>(_onAddLease);
    on<UpdateLease>(_onUpdateLease);
  
    on<GetLeases>(_onGetLeases);
    on<LoadMoreLeases>(_onLoadMoreLeases);
    on<SearchLeases>(_onSearchLeases);
  }

  Future<void> _onAddLease(AddLease event, Emitter<LeaseState> emit) async {
    emit(const LeaseLoading());

    final response = await _leaseRepo.createLease(
      orgId: event.orgId.trim(),
      unitId: event.unitId.trim(),
      residentId: event.residentId.trim(),
      leaseNumber: event.leaseNumber.trim(),
      startDate: event.startDate,
      endDate: event.endDate,
      annualRent: event.annualRent,
      securityDeposit: event.securityDeposit,
      paymentFrequency: event.paymentFrequency.trim(),
      numberOfCheques: event.numberOfCheques,
      description: event.description?.trim(),
      status: event.status.trim(),
    );

    if (response.hasData) {
      emit(LeaseAddSuccess(response.data!));
    } else {
      emit(LeaseFailed(response.error ?? 'Something went wrong'));
    }
  }

  Future<void> _onUpdateLease(
    UpdateLease event,
    Emitter<LeaseState> emit,
  ) async {
    emit(const LeaseLoading());

    final response = await _leaseRepo.updateLease(
      leaseId: event.leaseId.trim(),
      residentId: event.residentId?.trim(),
      leaseNumber: event.leaseNumber?.trim(),
      startDate: event.startDate,
      endDate: event.endDate,
      annualRent: event.annualRent,
      securityDeposit: event.securityDeposit,
      paymentFrequency: event.paymentFrequency?.trim(),
      numberOfCheques: event.numberOfCheques,
      status: event.status?.trim(),
      description: event.description?.trim(),
    );

    if (response.hasData) {
      emit(LeaseUpdateSuccess(response.data!));
    } else {
      emit(LeaseFailed(response.error ?? 'Something went wrong'));
    }
  }



  Future<void> _onGetLeases(GetLeases event, Emitter<LeaseState> emit) async {
    _orgId = event.orgId.trim();
    _unitId = event.unitId?.trim() ?? '';
    _currentPage = 1;
    _searchQuery = event.searchQuery?.trim() ?? '';

    emit(const LeasesLoading());

    final response = await _leaseRepo.getAllLeases(
      orgId: _orgId,
      unitId: _unitId.isEmpty ? null : _unitId,
      page: _currentPage,
      limit: _limit,
      searchQuery: _searchQuery.isEmpty ? null : _searchQuery,
    );

    if (response.hasData) {
      _leases = response.data ?? [];
      _hasMore = _leases.length == _limit;

      emit(LeasesSuccess(leases: _leases, hasMore: _hasMore));
    } else {
      emit(LeasesFailed(response.error ?? 'Something went wrong'));
    }
  }

  Future<void> _onLoadMoreLeases(
    LoadMoreLeases event,
    Emitter<LeaseState> emit,
  ) async {
    if (_isLoadingMore || !_hasMore) return;

    _isLoadingMore = true;

    emit(
      LeasesSuccess(leases: _leases, hasMore: _hasMore, isLoadingMore: true),
    );

    final nextPage = _currentPage + 1;

    final response = await _leaseRepo.getAllLeases(
      orgId: _orgId,
      unitId: _unitId.isEmpty ? null : _unitId,
      page: nextPage,
      limit: _limit,
      searchQuery: _searchQuery.isEmpty ? null : _searchQuery,
    );

    if (response.hasData) {
      final newLeases = response.data ?? [];

      _currentPage = nextPage;
      _leases.addAll(newLeases);

      _hasMore = newLeases.length == _limit;
      _isLoadingMore = false;

      emit(
        LeasesSuccess(leases: _leases, hasMore: _hasMore, isLoadingMore: false),
      );
    } else {
      _isLoadingMore = false;

      emit(
        LeasesSuccess(leases: _leases, hasMore: _hasMore, isLoadingMore: false),
      );
    }
  }

  Future<void> _onSearchLeases(
    SearchLeases event,
    Emitter<LeaseState> emit,
  ) async {
    _orgId = event.orgId.trim();
    _unitId = event.unitId?.trim() ?? '';
    _searchQuery = event.searchQuery.trim();
    _currentPage = 1;
    _hasMore = true;
    _leases = [];

    emit(const LeasesLoading());

    final response = await _leaseRepo.getAllLeases(
      orgId: _orgId,
      unitId: _unitId.isEmpty ? null : _unitId,
      page: 1,
      limit: _limit,
      searchQuery: _searchQuery.isEmpty ? null : _searchQuery,
    );

    if (response.hasData) {
      final leases = response.data ?? [];

      _leases = leases;
      _hasMore = leases.length == _limit;

      emit(LeasesSuccess(leases: _leases, hasMore: _hasMore));
    } else {
      emit(LeasesFailed(response.error ?? 'Something went wrong'));
    }
  }
}
