part of 'visitor_bloc.dart';

abstract class VisitorEvent extends Equatable {
  const VisitorEvent();

  @override
  List<Object?> get props => [];
}

class CreateVisitorEvent extends VisitorEvent {
  final CreateVisitor visitor;

  const CreateVisitorEvent({required this.visitor});

  @override
  List<Object?> get props => [visitor];
}

class UpdateVisitorStatusEvent extends VisitorEvent {
  final String id;
  final VisitorStatus status;

  const UpdateVisitorStatusEvent({required this.id, required this.status});

  @override
  List<Object?> get props => [id, status];
}
