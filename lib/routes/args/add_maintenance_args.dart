import '../../module/admin/community/model/community.dart';
import '../../module/admin/unit/model/unit.dart';

class AddMaintenanceArgs {
  final Unit unit;
  final Community community;

  const AddMaintenanceArgs({required this.unit, required this.community});
}
