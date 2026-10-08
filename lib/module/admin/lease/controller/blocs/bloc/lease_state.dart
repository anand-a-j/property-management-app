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

class LeaseAssignSuccess extends LeaseState {
  const LeaseAssignSuccess();
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

class LeasesSuccess extends LeaseState {
  final List<Lease> leases;
  final bool hasMore;
  final bool isLoadingMore;

  const LeasesSuccess({
    required this.leases,
    required this.hasMore,
    this.isLoadingMore = false,
  });

  @override
  List<Object?> get props => [leases, hasMore, isLoadingMore];
}

class LeasesFailed extends LeaseState {
  final String message;

  const LeasesFailed(this.message);

  @override
  List<Object?> get props => [message];
}
