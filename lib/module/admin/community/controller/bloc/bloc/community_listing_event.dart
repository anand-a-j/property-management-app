part of 'community_listing_bloc.dart';

abstract class CommunityListingEvent extends Equatable {
  const CommunityListingEvent();

  @override
  List<Object?> get props => [];
}

class GetCommunities extends CommunityListingEvent {
  const GetCommunities({this.searchQuery});

  final String? searchQuery;

  @override
  List<Object?> get props => [searchQuery];
}

class SearchCommunities extends CommunityListingEvent {
  const SearchCommunities({required this.searchQuery});

  final String searchQuery;

  @override
  List<Object?> get props => [];
}

class LoadMoreCommunities extends CommunityListingEvent {

  @override
  List<Object?> get props => [];
}
