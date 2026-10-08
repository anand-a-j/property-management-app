import '../../module/admin/community/model/community.dart';
import '../../module/admin/unit/model/unit.dart';

class UnitDetailsArgs {
  final Unit unit;
  final Community community;

  const UnitDetailsArgs({required this.unit, required this.community});
}
