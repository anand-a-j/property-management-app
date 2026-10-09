import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/lease_movement.dart';
import '../../repo/lease_movement_repo.dart';

part 'lease_movement_event.dart';
part 'lease_movement_state.dart';

class LeaseMovementBloc extends Bloc<LeaseMovementEvent, LeaseMovementState> {
  final LeaseMovementRepo _repository;

  LeaseMovementBloc({required LeaseMovementRepo repository})
    : _repository = repository,
      super(const LeaseMovementInitial()) {
    on<CreateMovementEvent>(_onCreateMovement);
    on<FetchMovementsEvent>(_onFetchMovements);
    on<FetchMovementByIdEvent>(_onFetchMovementById);
    on<ApproveMovementByManagerEvent>(_onApproveByManager);
    on<RejectMovementByManagerEvent>(_onRejectByManager);
    on<RejectMovementBySecurityEvent>(_onRejectBySecurity);
    on<CompleteMovementBySecurityEvent>(_onCompleteBySecurity);
  }

  Future<void> _onCreateMovement(
    CreateMovementEvent event,
    Emitter<LeaseMovementState> emit,
  ) async {
    emit(const LeaseMovementLoading());

    final response = await _repository.createMovement(
      leaseId: event.leaseId.trim(),
      movementType: event.movementType.trim(),
      requestedBy: event.requestedBy.trim(),
    );

    if (response.hasData) {
      emit(
        LeaseMovementSuccess<LeaseMovement>(
          data: response.data!,
          message: 'Movement request created successfully',
        ),
      );
    } else {
      emit(LeaseMovementFailed(message: response.error.toString()));
    }
  }

  Future<void> _onFetchMovements(
    FetchMovementsEvent event,
    Emitter<LeaseMovementState> emit,
  ) async {
    emit(const LeaseMovementLoading());

    final response = await _repository.getMovements(
      leaseId: event.leaseId.trim(),
    );

    if (response.hasData) {
      emit(LeaseMovementSuccess<List<LeaseMovement>>(data: response.data!));
    } else {
      emit(LeaseMovementFailed(message: response.error.toString()));
    }
  }

  Future<void> _onFetchMovementById(
    FetchMovementByIdEvent event,
    Emitter<LeaseMovementState> emit,
  ) async {
    emit(const LeaseMovementLoading());

    final response = await _repository.getMovementById(
      movementId: event.movementId.trim(),
    );

    if (response.hasData) {
      emit(LeaseMovementSuccess<LeaseMovement>(data: response.data!));
    } else {
      emit(LeaseMovementFailed(message: response.error.toString()));
    }
  }

  Future<void> _onApproveByManager(
    ApproveMovementByManagerEvent event,
    Emitter<LeaseMovementState> emit,
  ) async {
    emit(const LeaseMovementLoading());

    final response = await _repository.approveByManager(
      movementId: event.movementId.trim(),
      managerId: event.managerId.trim(),
    );

    if (response.hasError) {
      emit(LeaseMovementFailed(message: response.error.toString()));
    } else {
      emit(
        const LeaseMovementSuccess<void>(
          data: null,
          message: 'Movement approved by manager',
        ),
      );
    }
  }

  Future<void> _onRejectByManager(
    RejectMovementByManagerEvent event,
    Emitter<LeaseMovementState> emit,
  ) async {
    emit(const LeaseMovementLoading());

    final response = await _repository.rejectByManager(
      movementId: event.movementId.trim(),
      managerId: event.managerId.trim(),
      reason: event.reason.trim(),
    );

    if (response.hasError) {
      emit(LeaseMovementFailed(message: response.error.toString()));
    } else {
      emit(
        const LeaseMovementSuccess<void>(
          data: null,
          message: 'Movement rejected by manager',
        ),
      );
    }
  }

  Future<void> _onRejectBySecurity(
    RejectMovementBySecurityEvent event,
    Emitter<LeaseMovementState> emit,
  ) async {
    emit(const LeaseMovementLoading());

    final response = await _repository.rejectBySecurity(
      movementId: event.movementId.trim(),
      securityId: event.securityId.trim(),
      reason: event.reason.trim(),
    );

    if (response.hasError) {
      emit(LeaseMovementFailed(message: response.error.toString()));
    } else {
      emit(
        const LeaseMovementSuccess<void>(
          data: null,
          message: 'Movement rejected by security',
        ),
      );
    }
  }

  Future<void> _onCompleteBySecurity(
    CompleteMovementBySecurityEvent event,
    Emitter<LeaseMovementState> emit,
  ) async {
    emit(const LeaseMovementLoading());

    final response = await _repository.completeBySecurity(
      movementId: event.movementId.trim(),
      securityId: event.securityId.trim(),
    );

    if (response.hasError) {
      emit(LeaseMovementFailed(message: response.error.toString()));
    } else {
      emit(
        const LeaseMovementSuccess<void>(
          data: null,
          message: 'Movement completed successfully',
        ),
      );
    }
  }
}
