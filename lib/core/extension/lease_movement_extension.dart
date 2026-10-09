import '../../module/admin/lease/model/lease_movement.dart';
import '../enum/lease_movement_status.dart';
import '../enum/lease_movement_type.dart';

extension LeaseMovementX on LeaseMovement {
  bool get isMoveIn => movementType == LeaseMovementType.moveIn;

  /// Movement ended without completing
  bool get isFailed =>
      status == LeaseMovementStatus.managerRejected ||
      status == LeaseMovementStatus.securityRejected ||
      status == LeaseMovementStatus.cancelled;

  bool get isInProgress =>
      status == LeaseMovementStatus.pendingManager ||
      status == LeaseMovementStatus.pendingSecurity;
}
