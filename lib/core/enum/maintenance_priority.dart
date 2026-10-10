import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

enum MaintenancePriority {
  @JsonValue('low')
  low,

  @JsonValue('medium')
  medium,

  @JsonValue('high')
  high,

  @JsonValue('important')
  important,
}

extension MaintenancePriorityX on MaintenancePriority {
  String get label {
    switch (this) {
      case MaintenancePriority.low:
        return 'Low';
      case MaintenancePriority.medium:
        return 'Medium';
      case MaintenancePriority.high:
        return 'High';
      case MaintenancePriority.important:
        return 'Important';
    }
  }

  Color get color {
    switch (this) {
      case MaintenancePriority.low:
        return Colors.green;
      case MaintenancePriority.medium:
        return Colors.blue;
      case MaintenancePriority.high:
        return Colors.orange;
      case MaintenancePriority.important:
        return Colors.red;
    }
  }
}
