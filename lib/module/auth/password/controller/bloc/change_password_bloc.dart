import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/controller/repo/auth_repo.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc({required this.authRepo})
    : super(ChangePasswordInitial()) {
    on<ChangePasswordSubmitted>(_onChangePasswordSubmitted);
  }

  final AuthRepo authRepo;

  Future<void> _onChangePasswordSubmitted(
    ChangePasswordSubmitted event,
    Emitter<ChangePasswordState> emit,
  ) async {
    emit(ChangePasswordLoading());

    final response = await authRepo.changePassword(
      newPassword: event.newPassword.trim(),
    );

    if (response.hasData) {
      emit(ChangePasswordSuccess(response.data));
    } else {
      emit(
        ChangePasswordFailed(
          response.error ?? 'Failed to change password. Please try again.',
        ),
      );
    }
  }
}
