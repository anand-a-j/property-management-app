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

class VisitorSuccess extends VisitorState {
  const VisitorSuccess();
}

class VisitorFailed extends VisitorState {
  final String message;

  const VisitorFailed({required this.message});

  @override
  List<Object?> get props => [message];
}

class VisitorStatusUpdating extends VisitorState {}

class VisitorStatusUpdated extends VisitorState {}

class VisitorStatusUpdateFailed extends VisitorState {
  final String message;

  const VisitorStatusUpdateFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
