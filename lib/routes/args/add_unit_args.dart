import '../../module/admin/community/model/community.dart';
import '../../module/admin/unit/model/unit.dart';

class AddUnitArgs {
  final Community community;
  final Unit? unit;
  final bool isEdit;

  AddUnitArgs({required this.community, this.unit, this.isEdit = false});
}
