part of 'staff_bloc.dart';

abstract class StaffState {
  const StaffState();
}

class StaffInitial extends StaffState {
  const StaffInitial();
}

class StaffLoading extends StaffState {
  const StaffLoading();
}

class StaffSuccess extends StaffState {
  final List<Profile> staffs;

  const StaffSuccess(this.staffs);
}

class StaffFailed extends StaffState {
  final String error;

  const StaffFailed(this.error);
}
