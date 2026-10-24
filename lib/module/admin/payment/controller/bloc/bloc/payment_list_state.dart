part of 'payment_list_bloc.dart';

abstract class PaymentListState extends Equatable {
  const PaymentListState();

  @override
  List<Object?> get props => [];
}

class PaymentListInitial extends PaymentListState {
  const PaymentListInitial();
}

class PaymentListLoading extends PaymentListState {
  const PaymentListLoading();
}

class PaymentListLoadSuccess extends PaymentListState {
  final List<Payment> payments;
  final bool hasMore;
  final bool isLoadingMore;

  const PaymentListLoadSuccess({
    required this.payments,
    required this.hasMore,
    this.isLoadingMore = false,
  });

  @override
  List<Object?> get props => [payments, hasMore, isLoadingMore];
}

class PaymentListFailed extends PaymentListState {
  final String message;

  const PaymentListFailed(this.message);

  @override
  List<Object?> get props => [message];
}
