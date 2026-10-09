part of 'lease_movement_bloc.dart';

abstract class LeaseMovementState extends Equatable {
  const LeaseMovementState();

  @override
  List<Object?> get props => [];
}

class LeaseMovementInitial extends LeaseMovementState {
  const LeaseMovementInitial();
}

class LeaseMovementLoading extends LeaseMovementState {
  const LeaseMovementLoading();
}

class LeaseMovementSuccess<T> extends LeaseMovementState {
  final T data;
  final String? message;

  const LeaseMovementSuccess({required this.data, this.message});

  @override
  List<Object?> get props => [data, message];
}

class LeaseMovementFailed extends LeaseMovementState {
  final String message;

  const LeaseMovementFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
