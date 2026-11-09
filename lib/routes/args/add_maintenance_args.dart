import '../../module/admin/community/model/community.dart';
import '../../module/admin/maintainence/model/add_maintenance.dart';
import '../../module/admin/unit/model/unit.dart';

class AddMaintenanceArgs {
  final Unit? unit;
  final Community? community;
  final bool isEdit;
  final AddMaintenance? maintenance;

  const AddMaintenanceArgs({ this.unit, this.community, required this.isEdit, this.maintenance});
}
