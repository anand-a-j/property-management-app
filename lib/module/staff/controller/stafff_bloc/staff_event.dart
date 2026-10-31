part of 'staff_bloc.dart';

abstract class StaffEvent {
  const StaffEvent();
}

class FetchStaffs extends StaffEvent {
  final String orgId;
  final List<String> roles;

  const FetchStaffs({
    required this.orgId,
    this.roles = const ['security', 'maintenance'],
  });
}
