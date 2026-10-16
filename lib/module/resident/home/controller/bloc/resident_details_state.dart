part of 'resident_details_bloc.dart';

abstract class ResidentDetailsState extends Equatable {
  const ResidentDetailsState();

  @override
  List<Object?> get props => [];
}

class ResidentDetailsInitial extends ResidentDetailsState {
  const ResidentDetailsInitial();
}

class ResidentDetailsLoading extends ResidentDetailsState {
  const ResidentDetailsLoading();
}

class ResidentDetailsSuccess extends ResidentDetailsState {
  final List<ResidentLeaseDetails> details;

  const ResidentDetailsSuccess(this.details);

  @override
  List<Object?> get props => [details];
}

class ResidentDetailsFailed extends ResidentDetailsState {
  final String message;

  const ResidentDetailsFailed(this.message);

  @override
  List<Object?> get props => [message];
}
