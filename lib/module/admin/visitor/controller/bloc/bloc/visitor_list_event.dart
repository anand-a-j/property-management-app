part of 'visitor_list_bloc.dart';

abstract class VisitorListEvent extends Equatable {
  const VisitorListEvent();

  @override
  List<Object?> get props => [];
}

class GetVisitorsEvent extends VisitorListEvent {
  final String orgId;
  final String? unitId;
  final String? residentId;

  const GetVisitorsEvent({required this.orgId, this.unitId, this.residentId});

  @override
  List<Object?> get props => [orgId, unitId, residentId];
}

class LoadMoreVisitorsEvent extends VisitorListEvent {
  final String orgId;
  final String? unitId;
  final String? residentId;

  const LoadMoreVisitorsEvent({
    required this.orgId,
    this.unitId,
    this.residentId,
  });

  @override
  List<Object?> get props => [orgId, unitId, residentId];
}
