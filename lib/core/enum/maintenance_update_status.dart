import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

enum MaintenanceUpdateStatus {
  @JsonValue('assigned')
  assigned,

  @JsonValue('in_progress')
  inProgress,

  @JsonValue('completed')
  completed,
}

extension MaintenanceUpdateStatusX on MaintenanceUpdateStatus {
  String get label {
    switch (this) {
      case MaintenanceUpdateStatus.assigned:
        return 'Assigned';
      case MaintenanceUpdateStatus.inProgress:
        return 'In Progress';
      case MaintenanceUpdateStatus.completed:
        return 'Completed';
    }
  }

  Color get color {
    switch (this) {
      case MaintenanceUpdateStatus.assigned:
        return Colors.indigo;
      case MaintenanceUpdateStatus.inProgress:
        return Colors.deepOrange;
      case MaintenanceUpdateStatus.completed:
        return Colors.green;
    }
  }
}
