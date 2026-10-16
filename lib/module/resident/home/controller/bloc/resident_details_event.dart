part of 'resident_details_bloc.dart';

abstract class ResidentDetailsEvent extends Equatable {
  const ResidentDetailsEvent();

  @override
  List<Object?> get props => [];
}

class FetchResidentDetails extends ResidentDetailsEvent {
  final String residentId;

  const FetchResidentDetails({required this.residentId});

  @override
  List<Object?> get props => [residentId];
}
