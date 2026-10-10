part of 'visitor_bloc.dart';

abstract class VisitorState extends Equatable {
  const VisitorState();

  @override
  List<Object?> get props => [];
}

class VisitorInitial extends VisitorState {
  const VisitorInitial();
}

class VisitorLoading extends VisitorState {
  const VisitorLoading();
}

class VisitorCreateSuccess extends VisitorState {
  const VisitorCreateSuccess();
}

class VisitorListSuccess extends VisitorState {
  final List<Visitor> visitors;
  final bool hasMore;
  final bool isLoadingMore;

  const VisitorListSuccess({
    required this.visitors,
    this.hasMore = false,
    this.isLoadingMore = false,
  });

  @override
  List<Object?> get props => [visitors, hasMore, isLoadingMore];
}

class VisitorFailed extends VisitorState {
  final String message;

  const VisitorFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
