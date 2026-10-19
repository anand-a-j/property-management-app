part of 'security_lease_movement_bloc.dart';

abstract class SecurityLeaseMovementState extends Equatable {
  const SecurityLeaseMovementState();

  @override
  List<Object?> get props => [];
}

class SecurityLeaseMovementInitial extends SecurityLeaseMovementState {
  const SecurityLeaseMovementInitial();
}

class SecurityLeaseMovementLoading extends SecurityLeaseMovementState {
  const SecurityLeaseMovementLoading();
}

class SecurityLeaseMovementSuccess extends SecurityLeaseMovementState {
  final List<SecurityLeaseMovement> movements;

  const SecurityLeaseMovementSuccess({required this.movements});

  @override
  List<Object?> get props => [movements];
}

class SecurityLeaseMovementFailed extends SecurityLeaseMovementState {
  final String message;

  const SecurityLeaseMovementFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
