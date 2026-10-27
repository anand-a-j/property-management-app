part of 'visitor_list_bloc.dart';

abstract class VisitorListState extends Equatable {
  const VisitorListState();

  @override
  List<Object?> get props => [];
}

class VisitorListInitial extends VisitorListState {
  const VisitorListInitial();
}

class VisitorListLoading extends VisitorListState {
  const VisitorListLoading();
}

class VisitorListSuccess extends VisitorListState {
  final List<Visitor> visitors;
  final bool hasMore;
  final bool isLoadingMore;
  final String? loadMoreError;

  const VisitorListSuccess({
    required this.visitors,
    required this.hasMore,
    this.isLoadingMore = false,
    this.loadMoreError,
  });

  @override
  List<Object?> get props => [visitors, hasMore, isLoadingMore, loadMoreError];
}

class VisitorListFailed extends VisitorListState {
  final String message;

  const VisitorListFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
