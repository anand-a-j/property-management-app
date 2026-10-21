part of 'unit_list_bloc.dart';

abstract class UnitListEvent extends Equatable {
  const UnitListEvent();

  @override
  List<Object?> get props => [];
}


class GetUnits extends UnitListEvent {
  final String communityId;
  final int page;
  final int limit;
  final String? searchQuery;

  const GetUnits({
    required this.communityId,
    this.page = 1,
    this.limit = 20,
    this.searchQuery,
  });

  @override
  List<Object?> get props => [communityId, page, limit, searchQuery];
}

class LoadMoreUnits extends UnitListEvent {
  const LoadMoreUnits({required this.communityId});

  final String communityId;

  @override
  List<Object?> get props => [communityId];
}

class SearchUnits extends UnitListEvent {
  final String communityId;
  final String searchQuery;

  const SearchUnits({required this.communityId, required this.searchQuery});

  @override
  List<Object?> get props => [communityId, searchQuery];
}
