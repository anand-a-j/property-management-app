part of 'lease_movement_bloc.dart';

abstract class LeaseMovementEvent extends Equatable {
  const LeaseMovementEvent();

  @override
  List<Object?> get props => [];
}

class CreateMovementEvent extends LeaseMovementEvent {
  final String leaseId;
  final String movementType;
  final String requestedBy;

  const CreateMovementEvent({
    required this.leaseId,
    required this.movementType,
    required this.requestedBy,
  });

  @override
  List<Object?> get props => [leaseId, movementType, requestedBy];
}

class FetchMovementsEvent extends LeaseMovementEvent {
  final String leaseId;

  const FetchMovementsEvent({required this.leaseId});

  @override
  List<Object?> get props => [leaseId];
}

class FetchMovementByIdEvent extends LeaseMovementEvent {
  final String movementId;

  const FetchMovementByIdEvent({required this.movementId});

  @override
  List<Object?> get props => [movementId];
}

class ApproveMovementByManagerEvent extends LeaseMovementEvent {
  final String movementId;
  final String managerId;

  const ApproveMovementByManagerEvent({
    required this.movementId,
    required this.managerId,
  });

  @override
  List<Object?> get props => [movementId, managerId];
}

class RejectMovementByManagerEvent extends LeaseMovementEvent {
  final String movementId;
  final String managerId;
  final String reason;

  const RejectMovementByManagerEvent({
    required this.movementId,
    required this.managerId,
    required this.reason,
  });

  @override
  List<Object?> get props => [movementId, managerId, reason];
}

class RejectMovementBySecurityEvent extends LeaseMovementEvent {
  final String movementId;
  final String securityId;
  final String reason;

  const RejectMovementBySecurityEvent({
    required this.movementId,
    required this.securityId,
    required this.reason,
  });

  @override
  List<Object?> get props => [movementId, securityId, reason];
}

class CompleteMovementBySecurityEvent extends LeaseMovementEvent {
  final String movementId;
  final String securityId;

  const CompleteMovementBySecurityEvent({
    required this.movementId,
    required this.securityId,
  });

  @override
  List<Object?> get props => [movementId, securityId];
}
