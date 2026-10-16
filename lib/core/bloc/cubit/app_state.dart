part of 'app_cubit.dart';

class AppState {
  final int adminDashIndex;
  final int residentDashIndex;

  final String? leaseId;
  final String? unitId;
  final String? communityId;
  final DateTime? leaseStartDate;

  const AppState({
    this.adminDashIndex = 0,
    this.residentDashIndex = 0,
    this.leaseId,
    this.unitId,
    this.communityId,
    this.leaseStartDate,
  });

  AppState copyWith({
    int? adminDashIndex,
    int? residentDashIndex,
    String? leaseId,
    String? unitId,
    String? communityId,
    bool clearLeaseContext = false,
    DateTime? leaseStartDate,
  }) {
    return AppState(
      adminDashIndex: adminDashIndex ?? this.adminDashIndex,
      residentDashIndex: residentDashIndex ?? this.residentDashIndex,
      leaseId: clearLeaseContext ? null : leaseId ?? this.leaseId,
      unitId: clearLeaseContext ? null : unitId ?? this.unitId,
      communityId: clearLeaseContext ? null : communityId ?? this.communityId,
      leaseStartDate: clearLeaseContext
          ? null
          : leaseStartDate ?? this.leaseStartDate,
    );
  }
}
