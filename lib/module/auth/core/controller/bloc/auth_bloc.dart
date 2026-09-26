// auth_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc({AuthService? authService})
    : authService = authService ?? AuthService.instance,
      super(const AuthInitial()) {
    on<AuthSignUp>(_onSignUp);
    on<AuthSignIn>(_onSignIn);
    on<AuthSignOut>(_onSignOut);
    on<AuthGetProfile>(_onGetProfile);
    on<AuthUpdateProfile>(_onUpdateProfile);
  }

  // ---------------------------------------------------------------------------
  // SIGN UP
  // ---------------------------------------------------------------------------

  Future<void> _onSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());

    final response = await authService.signUp(
      email: event.email.trim(),
      password: event.password,
      name: event.name.trim(),
      phone: event.phone?.trim(),
      role: event.role,
    );

    if (response.error != null) {
      emit(AuthFailed(message: response.error ?? 'Something went wrong'));
      return;
    }

    emit(AuthSuccess(profile: authService.profile));
  }

  // ---------------------------------------------------------------------------
  // SIGN IN
  // ---------------------------------------------------------------------------

  Future<void> _onSignIn(AuthSignIn event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());

    final response = await authService.signIn(
      email: event.email.trim(),
      password: event.password,
    );

    if (response.error != null) {
      emit(AuthFailed(message: response.error ?? 'Something went wrong'));
      return;
    }

    emit(AuthSuccess(profile: authService.profile));
  }

  // ---------------------------------------------------------------------------
  // SIGN OUT
  // ---------------------------------------------------------------------------

  Future<void> _onSignOut(AuthSignOut event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());

    final response = await authService.signOut();

    if (response.error != null) {
      emit(AuthFailed(message: response.error ?? 'Something went wrong'));
      return;
    }

    emit(const AuthSuccess());
  }

  // ---------------------------------------------------------------------------
  // GET PROFILE
  // ---------------------------------------------------------------------------

  Future<void> _onGetProfile(
    AuthGetProfile event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final response = await authService.refreshProfile();

    if (response.error != null) {
      emit(AuthFailed(message: response.error ?? 'Something went wrong'));
      return;
    }

    emit(AuthSuccess(profile: response.data));
  }

  // ---------------------------------------------------------------------------
  // UPDATE PROFILE
  // ---------------------------------------------------------------------------

  Future<void> _onUpdateProfile(
    AuthUpdateProfile event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final response = await authService.updateProfile(
      name: event.name.trim(),
      phone: event.phone?.trim(),
    );

    if (response.error != null) {
      emit(AuthFailed(message: response.error ?? 'Something went wrong'));
      return;
    }

    emit(AuthSuccess(profile: authService.profile));
  }
}
