import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../controller/profile_repo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required this.profileRepo}) : super(ProfileInitial()) {
    on<UpdateProfileEvent>(_onUpdateProfile);
    on<UpdateResidentDetailsEvent>(_onUpdateResidentDetails);
    on<DeleteManagedUserEvent>(_onDeleteManagedUser);
  }

  final ProfileRepo profileRepo;

  Future<void> _onUpdateProfile(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());

    final response = await profileRepo.updateProfile(
      name: event.name.trim(),
      phone: event.phone?.trim(),
    );

    if (response.hasData) {
      emit(const ProfileSuccess(action: ProfileAction.updateProfile));
    } else {
      emit(
        ProfileFailed(message: response.error ?? 'Failed to update profile.'),
      );
    }
  }

  Future<void> _onUpdateResidentDetails(
    UpdateResidentDetailsEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());

    final response = await profileRepo.updateResidentDetails(
      firstName: event.firstName.trim(),
      lastName: event.lastName.trim(),
      nickname: event.nickname?.trim(),
      emiratesId: event.emiratesId?.trim(),
    );

    if (response.hasData) {
      emit(const ProfileSuccess(action: ProfileAction.updateResidentDetails));
    } else {
      emit(
        ProfileFailed(
          message: response.error ?? 'Failed to update resident details.',
        ),
      );
    }
  }

  Future<void> _onDeleteManagedUser(
    DeleteManagedUserEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());

    final response = await profileRepo.deleteManagedUser(
      userId: event.userId.trim(),
    );

    if (response.hasData) {
      emit(const ProfileSuccess(action: ProfileAction.deleteManagedUser));
    } else {
      emit(ProfileFailed(message: response.error ?? 'Failed to delete user.'));
    }
  }
}
