part of 'visitor_list_bloc.dart';

abstract class VisitorListEvent extends Equatable {
  const VisitorListEvent();

  @override
  List<Object?> get props => [];
}

class GetVisitorsEvent extends VisitorListEvent {
  final String orgId;
  final String? unitId;

  const GetVisitorsEvent({required this.orgId, this.unitId});

  @override
  List<Object?> get props => [orgId, unitId];
}

class LoadMoreVisitorsEvent extends VisitorListEvent {
  final String orgId;
  final String? unitId;

  const LoadMoreVisitorsEvent({required this.orgId, this.unitId});

  @override
  List<Object?> get props => [orgId, unitId];
}
