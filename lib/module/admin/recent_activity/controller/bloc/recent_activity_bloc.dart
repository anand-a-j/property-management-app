import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/recent_activity.dart';
import '../repo/recent_activity_repo.dart';

part 'recent_activity_event.dart';
part 'recent_activity_state.dart';

class RecentActivityBloc
    extends Bloc<RecentActivityEvent, RecentActivityState> {
  RecentActivityBloc({required RecentActivityRepo recentActivityRepo})
    : _recentActivityRepo = recentActivityRepo,
      super(const RecentActivityInitial()) {
    on<GetRecentActivities>(_onGetRecentActivities);
    on<RefreshRecentActivities>(_onRefreshRecentActivities);
  }

  final RecentActivityRepo _recentActivityRepo;

  static const int _limit = 20;

  int _requestVersion = 0;

  Future<void> _onGetRecentActivities(
    GetRecentActivities event,
    Emitter<RecentActivityState> emit,
  ) async {
    await _loadActivities(emit);
  }

  Future<void> _onRefreshRecentActivities(
    RefreshRecentActivities event,
    Emitter<RecentActivityState> emit,
  ) async {
    await _loadActivities(emit);
  }

  Future<void> _loadActivities(Emitter<RecentActivityState> emit) async {
    final requestVersion = ++_requestVersion;

    emit(const RecentActivityLoading());

    try {
      final response = await _recentActivityRepo.getRecentActivities(
        limit: _limit,
      );

      if (requestVersion != _requestVersion || emit.isDone) {
        return;
      }

      if (!response.hasData) {
        emit(
          RecentActivityFailed(
            response.error ?? 'Unable to load recent activities.',
          ),
        );
        return;
      }

      emit(
        RecentActivitySuccess(
          activities: List.unmodifiable(response.data ?? []),
        ),
      );
    } catch (e) {
      if (requestVersion != _requestVersion || emit.isDone) {
        return;
      }

      emit(
        const RecentActivityFailed(
          'Unable to load recent activities. Please try again.',
        ),
      );
    }
  }
}
