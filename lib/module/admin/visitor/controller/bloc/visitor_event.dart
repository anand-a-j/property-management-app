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

class GetVisitorsEvent extends VisitorEvent {
  final String orgId;
  final String? unitId;
  final int limit;
  final int offset;

  const GetVisitorsEvent({
    required this.orgId,
    this.unitId,
    this.limit = 20,
    this.offset = 0,
  });

  @override
  List<Object?> get props => [orgId, unitId, limit, offset];
}

class LoadMoreVisitorsEvent extends VisitorEvent {
  final String orgId;
  final String? unitId;

  const LoadMoreVisitorsEvent({required this.orgId, this.unitId});

  @override
  List<Object?> get props => [orgId, unitId];
}
