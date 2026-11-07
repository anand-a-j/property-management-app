part of 'residient_list_bloc.dart';

abstract class ResidentListEvent extends Equatable {
  const ResidentListEvent();

  @override
  List<Object?> get props => [];
}

class FetchResidents extends ResidentListEvent {
  const FetchResidents({required this.orgId, this.isSelectionMode = false});

  final String orgId;
  final bool isSelectionMode;

  @override
  List<Object?> get props => [orgId, isSelectionMode];
}

class LoadMoreResidents extends ResidentListEvent {
  const LoadMoreResidents();
}

class SearchResidents extends ResidentListEvent {
  const SearchResidents({
    required this.orgId,
    required this.searchQuery,
    this.isSelectionMode = false,
  });

  final String orgId;
  final String searchQuery;
  final bool isSelectionMode;

  @override
  List<Object?> get props => [orgId, searchQuery, isSelectionMode];
}
