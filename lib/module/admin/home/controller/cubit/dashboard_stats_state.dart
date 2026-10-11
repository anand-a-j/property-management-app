part of 'dashboard_stats_cubit.dart';

class DashboardStatsState {
  final bool isLoading;
  final bool hasError;
  final String errorMessage;
  final DashboardStats stats;

  const DashboardStatsState({
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage = '',
    this.stats = const DashboardStats(),
  });

  DashboardStatsState copyWith({
    bool? isLoading,
    bool? hasError,
    String? errorMessage,
    DashboardStats? stats,
  }) {
    return DashboardStatsState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      stats: stats ?? this.stats,
    );
  }
}
