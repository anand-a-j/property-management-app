import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/unit.dart';
import '../repo/unit_repo.dart';

part 'unit_event.dart';
part 'unit_state.dart';

class UnitBloc extends Bloc<UnitEvent, UnitState> {
  final UnitRepo _unitRepo;

  int _currentPage = 1;
  final int _limit = 20;

  String _communityId = '';
  String _searchQuery = '';

  List<Unit> _units = [];

  bool _hasMore = true;
  bool _isLoadingMore = false;

  UnitBloc({required UnitRepo unitRepo})
    : _unitRepo = unitRepo,
      super(const UnitInitial()) {
    on<AddUnit>(_onAddUnit);
    on<UpdateUnit>(_onUpdateUnit);
    on<DeleteUnit>(_onDeleteUnit);
    on<GetUnits>(_onGetUnits);
    on<LoadMoreUnits>(_onLoadMoreUnits);
    on<SearchUnits>(_onSearchUnits);
  }

  Future<void> _onGetUnits(GetUnits event, Emitter<UnitState> emit) async {
    _communityId = event.communityId.trim();
    _currentPage = 1;
    _searchQuery = event.searchQuery?.trim() ?? '';

    emit(const UnitLoading());

    final response = await _unitRepo.getUnits(
      communityId: _communityId,
      page: _currentPage,
      limit: _limit,
      searchQuery: _searchQuery.isEmpty ? null : _searchQuery,
    );

    if (response.hasData) {
      _units = response.data ?? [];

      // If returned items < limit, there is no next page.
      _hasMore = _units.length == _limit;

      emit(UnitLoadSuccess(units: _units, hasMore: _hasMore));
    } else {
      emit(UnitFailed(response.error ?? 'Something went wrong'));
    }
  }

  Future<void> _onLoadMoreUnits(
    LoadMoreUnits event,
    Emitter<UnitState> emit,
  ) async {
    if (_isLoadingMore || !_hasMore) return;

    _isLoadingMore = true;

    emit(
      UnitLoadSuccess(units: _units, hasMore: _hasMore, isLoadingMore: true),
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
      _isLoadingMore = false;

      emit(
        UnitLoadSuccess(units: _units, hasMore: _hasMore, isLoadingMore: false),
      );
    } else {
      _isLoadingMore = false;

      emit(
        UnitLoadSuccess(units: _units, hasMore: _hasMore, isLoadingMore: false),
      );
    }
  }

  Future<void> _onSearchUnits(
    SearchUnits event,
    Emitter<UnitState> emit,
  ) async {
    // Search is basically a new pagination session.
    _searchQuery = event.searchQuery.trim();
    _currentPage = 1;
    _hasMore = true;
    _units = [];

    emit(const UnitLoading());

    final response = await _unitRepo.getUnits(
      communityId: event.communityId.trim(),
      page: 1,
      limit: _limit,
      searchQuery: _searchQuery.isEmpty ? null : _searchQuery,
    );

    if (response.hasData) {
      final units = response.data ?? [];

      _units = units;
      _hasMore = units.length == _limit;

      emit(UnitLoadSuccess(units: _units, hasMore: _hasMore));
    } else {
      emit(UnitFailed(response.error ?? 'Something went wrong'));
    }
  }

  Future<void> _onAddUnit(AddUnit event, Emitter<UnitState> emit) async {
    emit(const UnitLoading());

    final response = await _unitRepo.createUnit(
      communityId: event.communityId.trim(),
      name: event.name.trim(),
      area: event.area.trim(),
      description: event.description.trim(),
    );

    if (response.hasData) {
      emit(UnitAddSuccess(response.data!));
    } else {
      emit(UnitFailed(response.error ?? 'Something went wrong'));
    }
  }

  Future<void> _onUpdateUnit(UpdateUnit event, Emitter<UnitState> emit) async {
    emit(const UnitLoading());

    final response = await _unitRepo.updateUnit(
      unitId: event.unitId.trim(),
      communityId: event.communityId.trim(),
      name: event.name.trim(),
      area: event.area.trim(),
      description: event.description.trim(),
    );

    if (response.hasData) {
      emit(UnitUpdateSuccess(response.data!));
    } else {
      emit(UnitFailed(response.error ?? 'Something went wrong'));
    }
  }

  Future<void> _onDeleteUnit(DeleteUnit event, Emitter<UnitState> emit) async {
    emit(const UnitLoading());

    final response = await _unitRepo.deleteUnit(
      unitId: event.unitId.trim(),
      communityId: event.communityId.trim(),
    );

    if (response.hasError) {
      emit(UnitFailed(response.error ?? 'Something went wrong'));
      return;
    }

    emit(const UnitDeleteSuccess());
  }
}
