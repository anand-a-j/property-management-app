part of 'app_cubit.dart';

class AppState {
  final int adminDashIndex;
  final int residentDashIndex;

  const AppState({
    this.adminDashIndex = 0,
    this.residentDashIndex = 0,
  });

  AppState copyWith({
    int? adminDashIndex,
    int? residentDashIndex,
  }) {
    return AppState(
      adminDashIndex: adminDashIndex ?? this.adminDashIndex,
      residentDashIndex: residentDashIndex ?? this.residentDashIndex,
    );
  }
}