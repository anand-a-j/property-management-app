part of 'manager_bloc.dart';

abstract class ManagerState extends Equatable {
  const ManagerState();

  @override
  List<Object?> get props => [];
}

class ManagerInitial extends ManagerState {
  const ManagerInitial();
}

class ManagerLoading extends ManagerState {
  const ManagerLoading();
}

class ManagerSuccess extends ManagerState {
  final ManagerResponse response;

  const ManagerSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class ManagerFailed extends ManagerState {
  final String error;

  const ManagerFailed(this.error);

  @override
  List<Object?> get props => [error];
}
