import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/payment.dart';
import '../../repo/payment_repo.dart';

part 'payment_list_event.dart';
part 'payment_list_state.dart';

class PaymentListBloc extends Bloc<PaymentListEvent, PaymentListState> {
  final PaymentRepo _paymentRepo;

  static const int _limit = 6;

  int _currentPage = 1;
  String _orgId = '';
  String? _leaseId;

  List<Payment> _payments = [];

  bool _hasMore = true;
  bool _isLoadingMore = false;

  PaymentListBloc({required PaymentRepo paymentRepo})
    : _paymentRepo = paymentRepo,
      super(const PaymentListInitial()) {
    on<FetchPaymentsEvent>(_onFetchPayments);
    on<LoadMorePayments>(_onLoadMorePayments);
  }

  Future<void> _onFetchPayments(
    FetchPaymentsEvent event,
    Emitter<PaymentListState> emit,
  ) async {
    _orgId = event.orgId.trim();

    final requestedLeaseId = event.leaseId?.trim();

    _leaseId = requestedLeaseId == null || requestedLeaseId.isEmpty
        ? null
        : requestedLeaseId;

    _currentPage = 1;
    _payments = [];
    _hasMore = true;
    _isLoadingMore = false;

    emit(const PaymentListLoading());

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
        ),
      );
    } else {
      emit(
        PaymentListFailed(
          response.error?.toString() ?? 'Failed to fetch payments',
        ),
      );
    }
  }

  Future<void> _onLoadMorePayments(
    LoadMorePayments event,
    Emitter<PaymentListState> emit,
  ) async {
    if (_isLoadingMore || !_hasMore) return;

    if (event.orgId.trim() != _orgId) return;

    final requestedLeaseId = event.leaseId?.trim();

    final normalizedLeaseId =
        requestedLeaseId == null || requestedLeaseId.isEmpty
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

    try {
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

      emit(
        PaymentListLoadSuccess(
          payments: List.unmodifiable(_payments),
          hasMore: _hasMore,
          isLoadingMore: false,
        ),
      );
    } catch (_) {
      emit(
        PaymentListLoadSuccess(
          payments: List.unmodifiable(_payments),
          hasMore: _hasMore,
          isLoadingMore: false,
        ),
      );
    } finally {
      _isLoadingMore = false;
    }
  }
}
