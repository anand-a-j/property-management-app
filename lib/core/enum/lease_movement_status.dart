import 'package:json_annotation/json_annotation.dart';

enum LeaseMovementStatus {
  @JsonValue('pending_manager')
  pendingManager,

  @JsonValue('manager_rejected')
  managerRejected,

  @JsonValue('pending_security')
  pendingSecurity,

  @JsonValue('security_rejected')
  securityRejected,

  @JsonValue('completed')
  completed,

  @JsonValue('cancelled')
  cancelled,
}

extension LeaseMovementStatusExtension on LeaseMovementStatus {
  String get label {
    switch (this) {
      case LeaseMovementStatus.pendingManager:
        return 'Pending Manager Approval';
      case LeaseMovementStatus.managerRejected:
        return 'Manager Rejected';
      case LeaseMovementStatus.pendingSecurity:
        return 'Pending Security Check';
      case LeaseMovementStatus.securityRejected:
        return 'Security Rejected';
      case LeaseMovementStatus.completed:
        return 'Completed';
      case LeaseMovementStatus.cancelled:
        return 'Cancelled';
    }
  }
}


