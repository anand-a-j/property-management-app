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

  const VisitorListSuccess({
    required this.visitors,
    required this.hasMore,
    this.isLoadingMore = false,
  });

  @override
  List<Object?> get props => [visitors, hasMore, isLoadingMore];
}

class VisitorListFailed extends VisitorListState {
  final String message;

  const VisitorListFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
