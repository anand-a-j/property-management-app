import 'package:json_annotation/json_annotation.dart';

enum PaymentType {
  @JsonValue('cheque')
  cheque,
}

extension PaymentTypeX on PaymentType {
  String get label {
    switch (this) {
      case PaymentType.cheque:
        return 'Cheque';
    }
  }
}
