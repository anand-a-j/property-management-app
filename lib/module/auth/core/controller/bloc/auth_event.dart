import 'package:equatable/equatable.dart';
import 'package:naseem/module/auth/core/model/profile.dart';

import '../../../../../core/enum/user_role.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthSignUp extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String? phone;
  final UserRole role;

  const AuthSignUp({
    required this.email,
    required this.password,
    required this.name,
    this.phone, required this.role,
  });

  @override
  List<Object?> get props => [email, password, name, phone, role];
}

class AuthSignIn extends AuthEvent {
  final String email;
  final String password;

  const AuthSignIn({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class AuthSignOut extends AuthEvent {
  const AuthSignOut();
}

class AuthGetProfile extends AuthEvent {
  const AuthGetProfile();
}

class AuthUpdateProfile extends AuthEvent {
  final String name;
  final String? phone;

  const AuthUpdateProfile({required this.name, this.phone});

  @override
  List<Object?> get props => [name, phone];
}
