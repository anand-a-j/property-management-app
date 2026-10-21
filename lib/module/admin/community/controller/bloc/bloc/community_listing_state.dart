part of 'community_listing_bloc.dart';

abstract class CommunityListingState extends Equatable {
  const CommunityListingState();

  @override
  List<Object?> get props => [];
}

class CommunityListingInitial extends CommunityListingState {
  const CommunityListingInitial();
}

class CommunityListingLoading extends CommunityListingState {
  const CommunityListingLoading();
}

class CommunityListingSuccess extends CommunityListingState {
  final List<Community> communities;

  const CommunityListingSuccess({required this.communities});

  @override
  List<Object?> get props => [communities];
}

class CommunityListingFailed extends CommunityListingState {
  final String message;

  const CommunityListingFailed(this.message);

  @override
  List<Object?> get props => [message];
}
