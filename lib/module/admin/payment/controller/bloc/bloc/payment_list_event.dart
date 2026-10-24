part of 'payment_list_bloc.dart';

abstract class PaymentListEvent extends Equatable {
  const PaymentListEvent();

  @override
  List<Object?> get props => [];
}

class FetchPaymentsEvent extends PaymentListEvent {
  final String orgId;
  final String? leaseId;

  const FetchPaymentsEvent({required this.orgId, this.leaseId});

  @override
  List<Object?> get props => [orgId, leaseId];
}

class LoadMorePayments extends PaymentListEvent {
  final String orgId;
  final String? leaseId;

  const LoadMorePayments({required this.orgId, this.leaseId});

  @override
  List<Object?> get props => [orgId, leaseId];
}
