part of 'community_listing_bloc.dart';

abstract class CommunityListingEvent extends Equatable {
  const CommunityListingEvent();

  @override
  List<Object?> get props => [];
}

class GetCommunities extends CommunityListingEvent {
  const GetCommunities();
}
