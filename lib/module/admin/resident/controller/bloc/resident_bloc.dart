import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../auth/core/model/profile.dart';
import '../repo/resident_repo.dart';

part 'resident_event.dart';
part 'resident_state.dart';

class ResidentBloc extends Bloc<ResidentEvent, ResidentState> {
  final ResidentRepo _repo;

  ResidentBloc({required ResidentRepo repo})
    : _repo = repo,
      super(const ResidentInitial()) {
    on<FetchResidents>(_onFetchResidents);
  }

  Future<void> _onFetchResidents(
    FetchResidents event,
    Emitter<ResidentState> emit,
  ) async {
    emit(const ResidentLoading());

    final response = await _repo.fetchResidents(orgId: event.orgId);

    if (response.hasData) {
      emit(ResidentSuccess(response.data??[]));
    } else {
      emit(ResidentFailed(response.error ?? 'Something went wrong'));
    }
  }
}
