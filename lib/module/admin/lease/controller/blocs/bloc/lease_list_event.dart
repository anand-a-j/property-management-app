part of 'lease_list_bloc.dart';

abstract class LeaseListEvent extends Equatable {
  const LeaseListEvent();

  @override
  List<Object?> get props => [];
}

class GetLeases extends LeaseListEvent {
  final String orgId;
  final String? unitId;
  final String? searchQuery;
  final bool isDraftOnly;

  const GetLeases({
    required this.orgId,
    this.unitId,
    this.searchQuery,
    this.isDraftOnly = false,
  });

  @override
  List<Object?> get props => [orgId, unitId, searchQuery, isDraftOnly];
}

class LoadMoreLeases extends LeaseListEvent {
  const LoadMoreLeases();
}

class SearchLeases extends LeaseListEvent {
  final String orgId;
  final String? unitId;
  final String searchQuery;
  final bool isDraftOnly;

  const SearchLeases({
    required this.orgId,
    this.unitId,
    required this.searchQuery,
    this.isDraftOnly = false,
  });

  @override
  List<Object?> get props => [orgId, unitId, searchQuery, isDraftOnly];
}
