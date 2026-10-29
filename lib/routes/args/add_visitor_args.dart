import '../../module/admin/visitor/model/visitor.dart';

class AddVisitorArgs {
  final bool isResident;
  final bool isEdit;
  final String? unitId;
  final String? leaseId;
  final String? residentId;
  final Visitor? visitor;

  AddVisitorArgs({
    required this.isResident,
    this.isEdit = false,
    this.unitId,
    this.leaseId,
    this.residentId,
    this.visitor,
  }) : assert(
         !isResident ||
             (unitId != null && leaseId != null && residentId != null),
         'unitId, leaseId and residentId are required when isResident is true',
       ),
       assert(
         !isEdit || visitor != null,
         'visitor is required when isEdit is true',
       );
}
