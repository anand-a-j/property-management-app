import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/lease.dart';
import '../../repo/lease_repo.dart';

part 'active_lease_event.dart';
part 'active_lease_state.dart';

class ActiveLeaseBloc extends Bloc<ActiveLeaseEvent, ActiveLeaseState> {
  ActiveLeaseBloc({required LeaseRepo leaseRepo})
    : _leaseRepo = leaseRepo,
      super(const ActiveLeaseInitial()) {
    on<GetActiveLease>(_onGetActiveLease);
  }

  final LeaseRepo _leaseRepo;

  Future<void> _onGetActiveLease(
    GetActiveLease event,
    Emitter<ActiveLeaseState> emit,
  ) async {
    emit(const ActiveLeaseLoading());

    final response = await _leaseRepo.getActiveLease(
      orgId: event.orgId.trim(),
      unitId: event.unitId.trim(),
    );

    if (response.hasError) {
      emit(ActiveLeaseFailed(response.error ?? 'Something went wrong'));
      return;
    }

    emit(ActiveLeaseSuccess(response.data));
  }
}
