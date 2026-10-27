part of 'lease_list_bloc.dart';

abstract class LeaseListState extends Equatable {
  const LeaseListState();

  @override
  List<Object?> get props => [];
}

class LeaseListInitial extends LeaseListState {
  const LeaseListInitial();
}

class LeaseListLoading extends LeaseListState {
  const LeaseListLoading();
}

class LeaseListSuccess extends LeaseListState {
  final List<Lease> leases;
  final bool hasMore;
  final bool isLoadingMore;
  final String? loadMoreError;

  const LeaseListSuccess({
    required this.leases,
    required this.hasMore,
    this.isLoadingMore = false,
    this.loadMoreError,
  });

  @override
  List<Object?> get props => [leases, hasMore, isLoadingMore, loadMoreError];
}

class LeaseListFailed extends LeaseListState {
  final String message;

  const LeaseListFailed(this.message);

  @override
  List<Object?> get props => [message];
}
