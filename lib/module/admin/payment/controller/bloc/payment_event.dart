part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object?> get props => [];
}

class CreatePaymentEvent extends PaymentEvent {
  final String orgId;
  final String leaseId;
  final String paymentNumber;
  final DateTime dueDate;
  final double amount;
  final PaymentType paymentType;
  final String? chequeNumber;
  final String? description;
  final String? chequeCopyPath;

  const CreatePaymentEvent({
    required this.orgId,
    required this.leaseId,
    required this.paymentNumber,
    required this.dueDate,
    required this.amount,
    required this.paymentType,
    this.chequeNumber,
    this.description,
    this.chequeCopyPath,
  });

  @override
  List<Object?> get props => [
    orgId,
    leaseId,
    paymentNumber,
    dueDate,
    amount,
    paymentType,
    chequeNumber,
    description,
    chequeCopyPath,
  ];
}

class MarkPaymentAsPaidEvent extends PaymentEvent {
  final String orgId;
  final String paymentId;
  final DateTime? paidDate;

  const MarkPaymentAsPaidEvent({
    required this.orgId,
    required this.paymentId,
    this.paidDate,
  });

  @override
  List<Object?> get props => [orgId, paymentId, paidDate];
}

class FetchPaymentsEvent extends PaymentEvent {
  final String orgId;
  final String? leaseId;

  const FetchPaymentsEvent({required this.orgId, this.leaseId});

  @override
  List<Object?> get props => [orgId, leaseId];
}

class LoadMorePayments extends PaymentEvent {
  final String orgId;
  final String? leaseId;

  const LoadMorePayments({required this.orgId, this.leaseId});

  @override
  List<Object?> get props => [orgId, leaseId];
}
