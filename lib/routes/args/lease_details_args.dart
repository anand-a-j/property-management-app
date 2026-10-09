import '../../module/admin/community/model/community.dart';
import '../../module/admin/lease/model/lease.dart';
import '../../module/admin/unit/model/unit.dart';

class LeaseDetailsArgs {
  final Lease lease;
  final Unit unit;
  final Community community;

  const LeaseDetailsArgs({
    required this.lease,
    required this.unit,
    required this.community,
  });
}
