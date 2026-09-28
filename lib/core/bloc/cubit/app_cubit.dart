import 'package:bloc/bloc.dart';

part 'app_state.dart';


class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  void setAdminDashIndex(int index) {
    emit(
      state.copyWith(
        adminDashIndex: index,
      ),
    );
  }

  void setResidentDashIndex(int index) {
    emit(
      state.copyWith(
        residentDashIndex: index,
      ),
    );
  }
}