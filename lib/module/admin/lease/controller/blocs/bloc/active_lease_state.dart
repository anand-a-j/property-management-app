part of 'active_lease_bloc.dart';

abstract class ActiveLeaseState extends Equatable {
  const ActiveLeaseState();

  @override
  List<Object?> get props => [];
}

class ActiveLeaseInitial extends ActiveLeaseState {
  const ActiveLeaseInitial();
}

class ActiveLeaseLoading extends ActiveLeaseState {
  const ActiveLeaseLoading();
}

class ActiveLeaseSuccess extends ActiveLeaseState {
  const ActiveLeaseSuccess(this.lease);

  final Lease? lease;

  @override
  List<Object?> get props => [lease];
}

class ActiveLeaseFailed extends ActiveLeaseState {
  const ActiveLeaseFailed(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
