import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

enum VisitorStatus {
  @JsonValue('pending')
  pending,

  @JsonValue('checked_in')
  checkedIn,

  @JsonValue('checked_out')
  checkedOut,

  @JsonValue('cancelled')
  cancelled,
}

extension VisitorStatusExtension on VisitorStatus {
  String get dbValue {
    switch (this) {
      case VisitorStatus.pending:
        return 'pending';
      case VisitorStatus.checkedIn:
        return 'checked_in';
      case VisitorStatus.checkedOut:
        return 'checked_out';
      case VisitorStatus.cancelled:
        return 'cancelled';
    }
  }

  String get label {
    switch (this) {
      case VisitorStatus.pending:
        return 'Pending';
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
      case VisitorStatus.checkedIn:
        return Colors.green;
      case VisitorStatus.checkedOut:
        return Colors.teal;
      case VisitorStatus.cancelled:
        return Colors.grey;
    }
  }

  List<VisitorStatus> nextStatuses() {
   
      switch (this) {
        case VisitorStatus.pending:
          return [VisitorStatus.checkedIn];

        case VisitorStatus.checkedIn:
          return [VisitorStatus.checkedOut];

        case VisitorStatus.checkedOut:
        case VisitorStatus.cancelled:
          return [];
      }



  }
}
