part of 'security_lease_movement_bloc.dart';

abstract class SecurityLeaseMovementEvent extends Equatable {
  const SecurityLeaseMovementEvent();

  @override
  List<Object?> get props => [];
}

class FetchSecurityLeaseMovements extends SecurityLeaseMovementEvent {
  final String orgId;

  const FetchSecurityLeaseMovements({required this.orgId});

  @override
  List<Object?> get props => [orgId];
}
