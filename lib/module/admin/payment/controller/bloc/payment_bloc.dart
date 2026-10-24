import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:naseem/core/enum/payment_status.dart';

import '../../../../../core/enum/payment_type.dart';
import '../../model/payment.dart';
import '../repo/payment_repo.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentRepo _paymentRepo;

  PaymentBloc({required PaymentRepo paymentRepo})
    : _paymentRepo = paymentRepo,
      super(const PaymentInitial()) {
    on<CreatePaymentEvent>(_onCreatePayment);
    on<UpdatePaymentStatusEvent>(_onUpdatePaymentStatus);
  }

  // =========================================================
  // CREATE PAYMENT
  // =========================================================

  Future<void> _onCreatePayment(
    CreatePaymentEvent event,
    Emitter<PaymentState> emit,
  ) async {
    emit(const PaymentLoading());

    final response = await _paymentRepo.createPayment(
      orgId: event.orgId.trim(),
      leaseId: event.leaseId.trim(),
      paymentNumber: event.paymentNumber.trim(),
      dueDate: event.dueDate,
      amount: event.amount,
      paymentType: event.paymentType,
      chequeNumber: event.chequeNumber?.trim(),
      description: event.description?.trim(),
      chequeCopyPath: event.chequeCopyPath?.trim(),
      status: event.status,
    );

    if (response.hasData) {
      emit(
        PaymentSuccess(
          payment: response.data,
          message: 'Payment created successfully',
        ),
      );
    } else {
      emit(
        PaymentFailed(response.error?.toString() ?? 'Failed to create payment'),
      );
    }
  }

  Future<void> _onUpdatePaymentStatus(
    UpdatePaymentStatusEvent event,
    Emitter<PaymentState> emit,
  ) async {
    emit(const PaymentLoading());

    final response = await _paymentRepo.updatePaymentStatus(
      paymentId: event.paymentId.trim(),
      currentStatus: event.currentStatus,
      newStatus: event.newStatus,
      paidDate: event.paidDate,
      bounceReason: event.bounceReason?.trim(),
    );

    if (response.hasError) {
      emit(
        PaymentFailed(
          response.error?.toString() ?? 'Failed to update payment status',
        ),
      );
      return;
    }

    emit(const PaymentStatusUpdated());
  }
}
