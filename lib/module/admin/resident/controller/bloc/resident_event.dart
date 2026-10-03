part of 'resident_bloc.dart';

abstract class ResidentEvent extends Equatable {
  const ResidentEvent();

  @override
  List<Object?> get props => [];
}

class FetchResidents extends ResidentEvent {
  final String orgId;

  const FetchResidents({required this.orgId});

  @override
  List<Object?> get props => [orgId];
}
