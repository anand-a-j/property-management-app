import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/enum/payment_type.dart';
import '../../model/payment.dart';
import '../repo/payment_repo.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentRepo _paymentRepo;

  int _currentPage = 1;

  // Fetch 8 payments per request.
  static const int _limit = 8;

  String _orgId = '';
  String? _leaseId;

  List<Payment> _payments = [];

  bool _hasMore = true;
  bool _isLoadingMore = false;

  PaymentBloc({required PaymentRepo paymentRepo})
    : _paymentRepo = paymentRepo,
      super(const PaymentInitial()) {
    on<CreatePaymentEvent>(_onCreatePayment);
    on<MarkPaymentAsPaidEvent>(_onMarkPaymentAsPaid);
    on<FetchPaymentsEvent>(_onFetchPayments);
    on<LoadMorePayments>(_onLoadMorePayments);
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

  // =========================================================
  // MARK PAYMENT AS PAID
  // =========================================================

  Future<void> _onMarkPaymentAsPaid(
    MarkPaymentAsPaidEvent event,
    Emitter<PaymentState> emit,
  ) async {
    emit(const PaymentLoading());

    final response = await _paymentRepo.markAsPaid(
      orgId: event.orgId.trim(),
      paymentId: event.paymentId.trim(),
      paidDate: event.paidDate,
    );

    if (response.hasData) {
      emit(
        const PaymentSuccess(message: 'Payment marked as paid successfully'),
      );
    } else {
      emit(
        PaymentFailed(
          response.error?.toString() ?? 'Failed to mark payment as paid',
        ),
      );
    }
  }

  // =========================================================
  // FETCH PAYMENTS
  // =========================================================

  Future<void> _onFetchPayments(
    FetchPaymentsEvent event,
    Emitter<PaymentState> emit,
  ) async {
    _orgId = event.orgId.trim();

    final requestedLeaseId = event.leaseId?.trim();
    _leaseId = (requestedLeaseId == null || requestedLeaseId.isEmpty)
        ? null
        : requestedLeaseId;

    _currentPage = 1;
    _payments = [];
    _hasMore = true;
    _isLoadingMore = false;

    emit(const PaymentLoading());

    final response = await _paymentRepo.getAllPayments(
      orgId: _orgId,
      leaseId: _leaseId,
      page: _currentPage,
      limit: _limit,
    );

    if (response.hasData) {
      _payments = response.data ?? [];

      _hasMore = _payments.length == _limit;

      emit(
        PaymentListLoadSuccess(
          payments: List.unmodifiable(_payments),
          hasMore: _hasMore,
          isLoadingMore: false,
        ),
      );
    } else {
      emit(
        PaymentFailed(response.error?.toString() ?? 'Failed to fetch payments'),
      );
    }
  }

  // =========================================================
  // LOAD MORE PAYMENTS
  // =========================================================

  Future<void> _onLoadMorePayments(
    LoadMorePayments event,
    Emitter<PaymentState> emit,
  ) async {
    // Prevent duplicate requests.
    if (_isLoadingMore || !_hasMore) return;

    // Ensure the request belongs to the current organization.
    if (event.orgId.trim() != _orgId) return;

    // Ensure the request belongs to the current lease filter.
    final requestedLeaseId = event.leaseId?.trim();
    final normalizedLeaseId =
        (requestedLeaseId == null || requestedLeaseId.isEmpty)
        ? null
        : requestedLeaseId;

    if (normalizedLeaseId != _leaseId) return;

    _isLoadingMore = true;

    emit(
      PaymentListLoadSuccess(
        payments: List.unmodifiable(_payments),
        hasMore: _hasMore,
        isLoadingMore: true,
      ),
    );

    final nextPage = _currentPage + 1;

    final response = await _paymentRepo.getAllPayments(
      orgId: _orgId,
      leaseId: _leaseId,
      page: nextPage,
      limit: _limit,
    );

    if (response.hasData) {
      final newPayments = response.data ?? [];

      _currentPage = nextPage;
      _payments.addAll(newPayments);
      _hasMore = newPayments.length == _limit;
    }

    _isLoadingMore = false;

    // Preserve the current list even if loading more fails.
    emit(
      PaymentListLoadSuccess(
        payments: List.unmodifiable(_payments),
        hasMore: _hasMore,
        isLoadingMore: false,
      ),
    );
  }
}
