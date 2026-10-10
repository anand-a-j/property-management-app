import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

enum VisitorStatus {
  @JsonValue('pending')
  pending,

  @JsonValue('approved')
  approved,

  @JsonValue('rejected')
  rejected,

  @JsonValue('checked_in')
  checkedIn,

  @JsonValue('checked_out')
  checkedOut,

  @JsonValue('cancelled')
  cancelled,
}

extension VisitorStatusExtension on VisitorStatus {
  String get label {
    switch (this) {
      case VisitorStatus.pending:
        return 'Pending';
      case VisitorStatus.approved:
        return 'Approved';
      case VisitorStatus.rejected:
        return 'Rejected';
      case VisitorStatus.checkedIn:
        return 'Checked In';
      case VisitorStatus.checkedOut:
        return 'Checked Out';
      case VisitorStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color get color {
    switch (this) {
      case VisitorStatus.pending:
        return Colors.orange;
      case VisitorStatus.approved:
        return Colors.green;
      case VisitorStatus.rejected:
        return Colors.red;
      case VisitorStatus.checkedIn:
        return Colors.blue;
      case VisitorStatus.checkedOut:
        return Colors.teal;
      case VisitorStatus.cancelled:
        return Colors.grey;
    }
  }
}
