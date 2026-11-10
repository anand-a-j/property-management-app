part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

enum ProfileAction { updateProfile, updateResidentDetails, deleteManagedUser }

class ProfileSuccess extends ProfileState {
  const ProfileSuccess({required this.action});

  final ProfileAction action;

  @override
  List<Object?> get props => [action];
}

class ProfileFailed extends ProfileState {
  const ProfileFailed({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
