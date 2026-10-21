import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/unit.dart';
import '../repo/unit_repo.dart';

part 'unit_event.dart';
part 'unit_state.dart';

class UnitBloc extends Bloc<UnitEvent, UnitState> {
  final UnitRepo _unitRepo;

  UnitBloc({required UnitRepo unitRepo})
    : _unitRepo = unitRepo,
      super(const UnitInitial()) {
    on<AddUnit>(_onAddUnit);
    on<UpdateUnit>(_onUpdateUnit);
    on<DeleteUnit>(_onDeleteUnit);
  }

  // =========================================================
  // ADD UNIT
  // =========================================================

  Future<void> _onAddUnit(AddUnit event, Emitter<UnitState> emit) async {
    emit(const UnitLoading());

    final response = await _unitRepo.createUnit(
      communityId: event.communityId.trim(),
      name: event.name.trim(),
      area: event.area.trim(),
      description: event.description.trim(),
      unitType: event.unitType,
    );

    if (response.hasData) {
      emit(UnitAddSuccess(response.data!));
    } else {
      emit(UnitFailed(response.error ?? 'Something went wrong'));
    }
  }

  // =========================================================
  // UPDATE UNIT
  // =========================================================

  Future<void> _onUpdateUnit(UpdateUnit event, Emitter<UnitState> emit) async {
    emit(const UnitLoading());

    final response = await _unitRepo.updateUnit(
      unitId: event.unitId.trim(),
      communityId: event.communityId.trim(),
      name: event.name.trim(),
      area: event.area.trim(),
      description: event.description.trim(),
      unitType: event.unitType,
    );

    if (response.hasData) {
      emit(UnitUpdateSuccess(response.data!));
    } else {
      emit(UnitFailed(response.error ?? 'Something went wrong'));
    }
  }

  // =========================================================
  // DELETE UNIT
  // =========================================================

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
