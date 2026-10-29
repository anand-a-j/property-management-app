part of 'residient_list_bloc.dart';

abstract class ResidentListState extends Equatable {
  const ResidentListState();

  @override
  List<Object?> get props => [];
}

class ResidentListInitial extends ResidentListState {
  const ResidentListInitial();
}

class ResidentListLoading extends ResidentListState {
  const ResidentListLoading();
}

class ResidentListFailed extends ResidentListState {
  final String message;

  const ResidentListFailed(this.message);

  @override
  List<Object?> get props => [message];
}

class ResidentListSuccess extends ResidentListState {
  final List<ResidentListResponse> residents;
  final bool hasMore;
  final bool isLoadingMore;
  final String? loadMoreError;

  const ResidentListSuccess({
    required this.residents,
    required this.hasMore,
    this.isLoadingMore = false,
    this.loadMoreError,
  });

  @override
  List<Object?> get props => [residents, hasMore, isLoadingMore, loadMoreError];
}
