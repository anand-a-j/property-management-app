part of 'resident_bloc.dart';

abstract class ResidentState extends Equatable {
  const ResidentState();

  @override
  List<Object?> get props => [];
}

class ResidentInitial extends ResidentState {
  const ResidentInitial();
}

class ResidentLoading extends ResidentState {
  const ResidentLoading();
}

class ResidentSuccess extends ResidentState {
  final List<Profile> residents;

  const ResidentSuccess(this.residents);

  @override
  List<Object> get props => [residents];
}

class ResidentFailed extends ResidentState {
  final String error;

  const ResidentFailed(this.error);

  @override
  List<Object?> get props => [error];
}
