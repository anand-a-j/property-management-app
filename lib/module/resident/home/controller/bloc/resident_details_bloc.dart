import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/resident_lease_details.dart';
import '../repo/resident_details_repo.dart';

part 'resident_details_event.dart';
part 'resident_details_state.dart';

class ResidentDetailsBloc
    extends Bloc<ResidentDetailsEvent, ResidentDetailsState> {
  final ResidentDetailsRepo _repo;

  ResidentDetailsBloc({required ResidentDetailsRepo repo})
    : _repo = repo,
      super(const ResidentDetailsInitial()) {
    on<FetchResidentDetails>(_onFetchResidentDetails);
  }

  Future<void> _onFetchResidentDetails(
    FetchResidentDetails event,
    Emitter<ResidentDetailsState> emit,
  ) async {
    emit(const ResidentDetailsLoading());

    final response = await _repo.fetchResidentLeaseDetails(
      residentId: event.residentId.trim(),
    );

    if (response.hasData) {
      emit(ResidentDetailsSuccess(response.data!));
    } else {
      emit(
        ResidentDetailsFailed(
          response.error ?? 'Failed to fetch resident details',
        ),
      );
    }
  }
}
