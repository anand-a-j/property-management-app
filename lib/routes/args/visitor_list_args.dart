class VisitorListArgs {
  final String orgId;
  final String? unitId;
  final bool isFromResident;

  const VisitorListArgs({
    required this.orgId,
    this.unitId,
    this.isFromResident = false,
  });
}
