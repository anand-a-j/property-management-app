
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

enum MaintenanceStatus {
  @JsonValue('pending_review')
  pendingReview,

  @JsonValue('rejected')
  rejected,

  @JsonValue('approved')
  approved,

  @JsonValue('assigned')
  assigned,

  @JsonValue('in_progress')
  inProgress,

  @JsonValue('completed')
  completed,

  @JsonValue('closed')
  closed,

  @JsonValue('cancelled')
  cancelled,
}

extension MaintenanceStatusX on MaintenanceStatus {
  String get label {
    switch (this) {
      case MaintenanceStatus.pendingReview:
        return 'Pending Review';
      case MaintenanceStatus.rejected:
        return 'Rejected';
      case MaintenanceStatus.approved:
        return 'Approved';
      case MaintenanceStatus.assigned:
        return 'Assigned';
      case MaintenanceStatus.inProgress:
        return 'In Progress';
      case MaintenanceStatus.completed:
        return 'Completed';
      case MaintenanceStatus.closed:
        return 'Closed';
      case MaintenanceStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color get color {
    switch (this) {
      case MaintenanceStatus.pendingReview:
        return Colors.orange;
      case MaintenanceStatus.rejected:
        return Colors.red;
      case MaintenanceStatus.approved:
        return Colors.blue;
      case MaintenanceStatus.assigned:
        return Colors.indigo;
      case MaintenanceStatus.inProgress:
        return Colors.deepOrange;
      case MaintenanceStatus.completed:
        return Colors.green;
      case MaintenanceStatus.closed:
        return Colors.grey;
      case MaintenanceStatus.cancelled:
        return Colors.grey;
    }
  }
}
