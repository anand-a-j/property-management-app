import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

enum LeaseStatus {
  @JsonValue('draft')
  draft,

  @JsonValue('active')
  active,

  @JsonValue('expired')
  expired,

  @JsonValue('terminated')
  terminated,

  @JsonValue('cancelled')
  cancelled,
}

extension LeaseStatusExtension on LeaseStatus {
  String get label {
    switch (this) {
      case LeaseStatus.draft:
        return 'Draft';
      case LeaseStatus.active:
        return 'Active';
      case LeaseStatus.expired:
        return 'Expired';
      case LeaseStatus.terminated:
        return 'Terminated';
      case LeaseStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color get color {
    switch (this) {
      case LeaseStatus.draft:
        return Colors.blueGrey;
      case LeaseStatus.active:
        return Colors.green;
      case LeaseStatus.expired:
        return Colors.orange;
      case LeaseStatus.terminated:
        return Colors.red;
      case LeaseStatus.cancelled:
        return Colors.grey;
    }
  }
}
