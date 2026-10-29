part of 'residient_list_bloc.dart';

abstract class ResidentListEvent extends Equatable {
  const ResidentListEvent();

  @override
  List<Object?> get props => [];
}

class FetchResidents extends ResidentListEvent {
  final String orgId;

  const FetchResidents({required this.orgId});

  @override
  List<Object?> get props => [orgId];
}

class LoadMoreResidents extends ResidentListEvent {
  const LoadMoreResidents();
}

class SearchResidents extends ResidentListEvent {
  final String orgId;
  final String searchQuery;

  const SearchResidents({required this.orgId, required this.searchQuery});

  @override
  List<Object?> get props => [orgId, searchQuery];
}
