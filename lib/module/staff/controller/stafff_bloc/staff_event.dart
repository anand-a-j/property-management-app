part of 'staff_bloc.dart';

abstract class StaffEvent {
  const StaffEvent();
}

class FetchStaffs extends StaffEvent {
  final String orgId;

  const FetchStaffs({required this.orgId});
}
