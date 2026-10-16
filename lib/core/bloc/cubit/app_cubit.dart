import 'package:bloc/bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  void setAdminDashIndex(int index) {
    emit(state.copyWith(adminDashIndex: index));
  }

  void setResidentDashIndex(int index) {
    emit(state.copyWith(residentDashIndex: index));
  }

  void setResidentLeaseContext({
    required String leaseId,
    required String unitId,
    required String communityId,
    required DateTime leaseStartDate,
  }) {
    emit(
      state.copyWith(
        leaseId: leaseId,
        unitId: unitId,
        communityId: communityId,
        leaseStartDate: leaseStartDate
      ),
    );
  }

  void clearResidentLeaseContext() {
    emit(state.copyWith(clearLeaseContext: true));
  }
}
