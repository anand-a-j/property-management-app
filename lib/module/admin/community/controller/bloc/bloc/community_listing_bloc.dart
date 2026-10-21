import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../auth/core/controller/service/auth_service.dart';
import '../../../model/community.dart';
import '../../repo/community_repo.dart';

part 'community_listing_event.dart';
part 'community_listing_state.dart';

class CommunityListingBloc
    extends Bloc<CommunityListingEvent, CommunityListingState> {
  final CommunityRepo _communityRepo;

  CommunityListingBloc({required CommunityRepo communityRepo})
    : _communityRepo = communityRepo,
      super(const CommunityListingInitial()) {
    on<GetCommunities>(_onGetCommunities);
  }

  Future<void> _onGetCommunities(
    GetCommunities event,
    Emitter<CommunityListingState> emit,
  ) async {
    emit(const CommunityListingLoading());

    final response = await _communityRepo.getCommunities(
      orgId: authentication.profile?.orgId ?? '',
    );

    if (response.hasData) {
      emit(CommunityListingSuccess(communities: response.data ?? []));
    } else {
      emit(
        CommunityListingFailed(response.error ?? 'Failed to fetch communities'),
      );
    }
  }
}
