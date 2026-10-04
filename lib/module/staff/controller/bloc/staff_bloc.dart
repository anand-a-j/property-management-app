import 'package:bloc/bloc.dart';

import '../../../auth/core/model/profile.dart';
import '../repo/staff_repo.dart';

part 'staff_event.dart';
part 'staff_state.dart';

class StaffBloc extends Bloc<StaffEvent, StaffState> {
  final StaffRepo _repo;

  StaffBloc({required StaffRepo repo})
    : _repo = repo,
      super(const StaffInitial()) {
    on<FetchStaffs>(_onFetchStaffs);
  }

  Future<void> _onFetchStaffs(
    FetchStaffs event,
    Emitter<StaffState> emit,
  ) async {
    emit(const StaffLoading());

    final response = await _repo.fetchStaffs(orgId: event.orgId);

    if (response.hasData) {
      emit(StaffSuccess(response.data ?? []));
    } else {
      emit(StaffFailed(response.error ?? 'Something went wrong'));
    }
  }
}
