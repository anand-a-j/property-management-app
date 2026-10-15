import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

enum ResidentStatus {
  @JsonValue('onboarding')
  onboarding,

  @JsonValue('current')
  current,

  @JsonValue('exited')
  exited,
}

extension ResidentStatusX on ResidentStatus {
  String get label {
    switch (this) {
      case ResidentStatus.onboarding:
        return 'Onboarding';
      case ResidentStatus.current:
        return 'Current';
      case ResidentStatus.exited:
        return 'Exited';
    }
  }

  Color get color {
    switch (this) {
      case ResidentStatus.onboarding:
        return Colors.orange;
      case ResidentStatus.current:
        return Colors.green;
      case ResidentStatus.exited:
        return Colors.grey;
    }
  }
}
