part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object?> get props => [];
}

class PaymentInitial extends PaymentState {
  const PaymentInitial();
}

class PaymentLoading extends PaymentState {
  const PaymentLoading();
}

class PaymentSuccess extends PaymentState {
  final Payment? payment;
  final List<Payment>? payments;
  final String? message;

  const PaymentSuccess({this.payment, this.payments, this.message});

  @override
  List<Object?> get props => [payment, payments, message];
}

class PaymentStatusUpdated extends PaymentState {
  const PaymentStatusUpdated();
}

class PaymentFailed extends PaymentState {
  final String message;

  const PaymentFailed(this.message);

  @override
  List<Object?> get props => [message];
}
