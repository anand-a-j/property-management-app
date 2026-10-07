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
