import '../../module/admin/lease/model/lease.dart';
import '../../module/admin/unit/model/unit.dart';

class AddLeaseArgs {
  final Unit unit;
  final Lease? lease;
  final bool isEdit;

  AddLeaseArgs({required this.unit, this.lease, this.isEdit = false});
}
