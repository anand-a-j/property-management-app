part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class UpdateProfileEvent extends ProfileEvent {
  const UpdateProfileEvent({required this.name, this.phone, required this.id,});

  final String id;
  final String name;
  final String? phone;

  @override
  List<Object?> get props => [name, phone, id];
}

class UpdateResidentDetailsEvent extends ProfileEvent {
  const UpdateResidentDetailsEvent({
    required this.firstName,
    required this.lastName,
    this.nickname,
    this.emiratesId,
  });

  final String firstName;
  final String lastName;
  final String? nickname;
  final String? emiratesId;

  @override
  List<Object?> get props => [firstName, lastName, nickname, emiratesId];
}

class DeleteManagedUserEvent extends ProfileEvent {
  const DeleteManagedUserEvent({required this.userId});

  final String userId;

  @override
  List<Object?> get props => [userId];
}
