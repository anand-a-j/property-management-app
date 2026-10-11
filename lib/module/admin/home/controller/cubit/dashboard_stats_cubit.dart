import 'package:bloc/bloc.dart';

import '../../model/dashboard_stats.dart';
import '../repo/dashboard_stats_repo.dart';

part 'dashboard_stats_state.dart';

class DashboardStatsCubit extends Cubit<DashboardStatsState> {
  final DashboardStatsRepo _dashboardStatsRepo;

  DashboardStatsCubit({required DashboardStatsRepo dashboardStatsRepo})
    : _dashboardStatsRepo = dashboardStatsRepo,
      super(const DashboardStatsState());

  Future<void> fetchDashboardStats({required String orgId}) async {
    emit(state.copyWith(isLoading: true, hasError: false, errorMessage: ''));

    try {
      final response = await _dashboardStatsRepo.fetchDashboardStats(
        orgId: orgId,
      );

      if (response.data != null) {
        emit(
          state.copyWith(
            isLoading: false,
            hasError: false,
            stats: response.data!,
          ),
        );
      } else {
        emit(
          state.copyWith(
            isLoading: false,
            hasError: true,
            errorMessage:
                response.error ?? 'Failed to load dashboard statistics.',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          hasError: true,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> refresh({required String orgId}) {
    return fetchDashboardStats(orgId: orgId);
  }
}
