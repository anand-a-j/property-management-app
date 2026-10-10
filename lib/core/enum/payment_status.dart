import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

enum PaymentStatus {
  @JsonValue('pending')
  pending,

  @JsonValue('paid')
  paid,

  @JsonValue('overdue')
  overdue,

  @JsonValue('cancelled')
  cancelled,
}

extension PaymentStatusX on PaymentStatus {
  String get label {
    switch (this) {
      case PaymentStatus.pending:
        return 'Pending';
      case PaymentStatus.paid:
        return 'Paid';
      case PaymentStatus.overdue:
        return 'Overdue';
      case PaymentStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color get color {
    switch (this) {
      case PaymentStatus.pending:
        return Colors.orange;
      case PaymentStatus.paid:
        return Colors.green;
      case PaymentStatus.overdue:
        return Colors.red;
      case PaymentStatus.cancelled:
        return Colors.grey;
    }
  }
}
