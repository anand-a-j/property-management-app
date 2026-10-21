import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/community.dart';
import '../repo/community_repo.dart';

part 'community_event.dart';
part 'community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  final CommunityRepo _communityRepo;

  CommunityBloc({required CommunityRepo communityRepo})
    : _communityRepo = communityRepo,
      super(const CommunityInitial()) {
    on<CreateCommunity>(_onCreateCommunity);
    on<UpdateCommunity>(_onUpdateCommunity);
  }

  Future<void> _onCreateCommunity(
    CreateCommunity event,
    Emitter<CommunityState> emit,
  ) async {
    emit(const CommunityLoading());

    final response = await _communityRepo.createCommunity(
      orgId: event.orgId.trim(),
      developmentType: event.developmentType.trim(),
      communityType: event.communityType.trim(),
      name: event.name.trim(),
      address: event.address.trim(),
      description: event.description.trim(),
    );

    if (response.hasData) {
      emit(AddUpdateCommunitySuccess());
    } else {
      emit(CommunityFailed(response.error ?? 'Failed to create community'));
    }
  }

  Future<void> _onUpdateCommunity(
    UpdateCommunity event,
    Emitter<CommunityState> emit,
  ) async {
    emit(const CommunityLoading());

    final response = await _communityRepo.updateCommunity(
      id: event.id.trim(),
      developmentType: event.developmentType.trim(),
      communityType: event.communityType.trim(),
      name: event.name.trim(),
      address: event.address.trim(),
      description: event.description.trim(),
    );

    if (response.hasData) {
      emit(AddUpdateCommunitySuccess());
    } else {
      emit(CommunityFailed(response.error ?? 'Failed to update community'));
    }
  }
}
