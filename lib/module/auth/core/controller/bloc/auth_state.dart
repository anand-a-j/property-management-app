import 'package:equatable/equatable.dart';

import '../../model/profile.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccess extends AuthState {
  final Profile? profile;

  const AuthSuccess({this.profile});

  @override
  List<Object?> get props => [profile];
}

class AuthFailed extends AuthState {
  final String message;

  const AuthFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
