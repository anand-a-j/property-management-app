import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

enum PaymentStatus {
  @JsonValue('draft')
  draft,

  @JsonValue('pending')
  pending,

  @JsonValue('paid')
  paid,

  @JsonValue('bounced')
  bounced,

  @JsonValue('cancelled')
  cancelled,
}

extension PaymentStatusX on PaymentStatus {
  String get label {
    switch (this) {
      case PaymentStatus.draft:
        return 'Draft';
      case PaymentStatus.pending:
        return 'Pending';
      case PaymentStatus.paid:
        return 'Paid';
      case PaymentStatus.bounced:
        return 'Bounced';
      case PaymentStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color get color {
    switch (this) {
      case PaymentStatus.draft:
        return Colors.blueGrey;
      case PaymentStatus.pending:
        return Colors.orange;
      case PaymentStatus.paid:
        return Colors.green;
      case PaymentStatus.bounced:
        return Colors.red;
      case PaymentStatus.cancelled:
        return Colors.grey;
    }
  }
}
