import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/manager_response.dart';
import '../repo/manager_repo.dart';
part 'manager_event.dart';
part 'manager_state.dart';

class ManagerBloc extends Bloc<ManagerEvent, ManagerState> {
  final ManagerRepo _repo;

  ManagerBloc({required ManagerRepo repo})
    : _repo = repo,
      super(const ManagerInitial()) {
    on<FetchManagers>(_onFetchManagers);
  }

  Future<void> _onFetchManagers(
    FetchManagers event,
    Emitter<ManagerState> emit,
  ) async {
    emit(const ManagerLoading());

    final response = await _repo.fetchManagers();

    if (response.hasData) {
      emit(ManagerSuccess(response.data!));
    } else {
      emit(ManagerFailed(response.error ?? 'Something went wrong'));
    }
  }
}
