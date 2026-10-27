class AddVisitorArgs {
  final bool isResident;
  final String? unitId;
  final String? leaseId;
  final String? residentId;

  AddVisitorArgs({
    required this.isResident,
    this.unitId,
    this.leaseId,
    this.residentId,
  }) : assert(
         !isResident ||
             (unitId != null && leaseId != null && residentId != null),
         'unitId, leaseId and residentId are required when isResident is true',
       );
}
