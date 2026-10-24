import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:naseem/module/admin/lease/controller/repo/lease_repo.dart';

import '../../../model/lease.dart';

part 'lease_event.dart';
part 'lease_state.dart';

class LeaseBloc extends Bloc<LeaseEvent, LeaseState> {
  final LeaseRepo _leaseRepo;

  LeaseBloc({required LeaseRepo leaseRepo})
    : _leaseRepo = leaseRepo,
      super(const LeaseInitial()) {
    on<AddLease>(_onAddLease);
    on<UpdateLease>(_onUpdateLease);
  
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
}
