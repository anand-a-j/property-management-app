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
  const CommunityListingSuccess({
    required this.communities,
    required this.hasMore,
    required this.isLoadingMore,
    this.loadMoreError,
  });

  final List<Community> communities;
  final bool hasMore;
  final bool isLoadingMore;
  final String? loadMoreError;

  @override
  List<Object?> get props => [
    communities,
    hasMore,
    isLoadingMore,
    loadMoreError,
  ];
}

class CommunityListingFailed extends CommunityListingState {
  final String message;

  const CommunityListingFailed(this.message);

  @override
  List<Object?> get props => [message];
}
