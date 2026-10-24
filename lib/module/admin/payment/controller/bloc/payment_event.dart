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
  final PaymentStatus status;

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
    required this.status,
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
    status,
  ];
}

class UpdatePaymentStatusEvent extends PaymentEvent {
  final String paymentId;
  final PaymentStatus currentStatus;
  final PaymentStatus newStatus;
  final DateTime? paidDate;
  final String? bounceReason;

  const UpdatePaymentStatusEvent({
    required this.paymentId,
    required this.currentStatus,
    required this.newStatus,
    this.paidDate,
    this.bounceReason,
  });

  @override
  List<Object?> get props => [
    paymentId,
    currentStatus,
    newStatus,
    paidDate,
    bounceReason,
  ];
}
