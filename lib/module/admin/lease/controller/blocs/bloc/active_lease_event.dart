part of 'active_lease_bloc.dart';

abstract class ActiveLeaseEvent extends Equatable {
  const ActiveLeaseEvent();

  @override
  List<Object?> get props => [];
}

class GetActiveLease extends ActiveLeaseEvent {
  const GetActiveLease({required this.orgId, required this.unitId});

  final String orgId;
  final String unitId;

  @override
  List<Object?> get props => [orgId, unitId];
}
