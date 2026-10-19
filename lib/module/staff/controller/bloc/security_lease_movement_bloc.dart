import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/security_lease_movement.dart';
import '../repo/security_lease_movement_repo.dart';

part 'security_lease_movement_event.dart';
part 'security_lease_movement_state.dart';

class SecurityLeaseMovementBloc
    extends Bloc<SecurityLeaseMovementEvent, SecurityLeaseMovementState> {
  final SecurityLeaseMovementRepo _repo;

  SecurityLeaseMovementBloc({required SecurityLeaseMovementRepo repo})
    : _repo = repo,
      super(const SecurityLeaseMovementInitial()) {
    on<FetchSecurityLeaseMovements>(_onFetchSecurityLeaseMovements);
  }

  Future<void> _onFetchSecurityLeaseMovements(
    FetchSecurityLeaseMovements event,
    Emitter<SecurityLeaseMovementState> emit,
  ) async {
    emit(const SecurityLeaseMovementLoading());

    final response = await _repo.fetchSecurityLeaseMovements(
      orgId: event.orgId.trim(),
    );

    if (response.hasData) {
      emit(SecurityLeaseMovementSuccess(movements: response.data!));
    } else {
      emit(
        SecurityLeaseMovementFailed(
          message: response.error ?? 'Failed to fetch lease movements',
        ),
      );
    }
  }
}
