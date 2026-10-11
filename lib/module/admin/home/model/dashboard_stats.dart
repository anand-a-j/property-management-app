import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_stats.freezed.dart';
part 'dashboard_stats.g.dart';

@freezed
abstract class DashboardStats with _$DashboardStats {
  const factory DashboardStats({
    @Default(0) int totalUnits,
    @Default(0) int occupied,
    @Default(0) int vacant,
    @Default(0) int maintenance,
    @Default(0) int rentCollected,
    @Default(0) int overdueCount,
    @Default(0.0) double rentDueTotal,
  }) = _DashboardStats;

  factory DashboardStats.fromJson(Map<String, dynamic> json) =>
      _$DashboardStatsFromJson(json);
}
