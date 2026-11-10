part of 'change_password_bloc.dart';

abstract class ChangePasswordState extends Equatable {
  const ChangePasswordState();

  @override
  List<Object?> get props => [];
}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState {
  const ChangePasswordSuccess(this.message);

  final String? message;

  @override
  List<Object?> get props => [message];
}

class ChangePasswordFailed extends ChangePasswordState {
  const ChangePasswordFailed(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
