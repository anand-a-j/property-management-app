part of 'lease_bloc.dart';

abstract class LeaseState extends Equatable {
  const LeaseState();

  @override
  List<Object?> get props => [];
}

class LeaseInitial extends LeaseState {
  const LeaseInitial();
}

class LeaseLoading extends LeaseState {
  const LeaseLoading();
}

class LeaseAddSuccess extends LeaseState {
  final Lease lease;

  const LeaseAddSuccess(this.lease);

  @override
  List<Object?> get props => [lease];
}

class LeaseUpdateSuccess extends LeaseState {
  final Lease lease;

  const LeaseUpdateSuccess(this.lease);

  @override
  List<Object?> get props => [lease];
}

class LeaseFailed extends LeaseState {
  final String message;

  const LeaseFailed(this.message);

  @override
  List<Object?> get props => [message];
}

class LeasesLoading extends LeaseState {
  const LeasesLoading();
}

class LeasesFailed extends LeaseState {
  final String message;

  const LeasesFailed(this.message);

  @override
  List<Object?> get props => [message];
}
