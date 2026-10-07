import 'package:json_annotation/json_annotation.dart';

enum PaymentFrequency {
  @JsonValue('monthly')
  monthly,

  @JsonValue('quarterly')
  quarterly,

  @JsonValue('semi_annual')
  semiAnnual,

  @JsonValue('annual')
  annual,
}

extension PaymentFrequencyLabel on PaymentFrequency {
  String get label {
    switch (this) {
      case PaymentFrequency.monthly:
        return 'Monthly';

      case PaymentFrequency.quarterly:
        return 'Quarterly';

      case PaymentFrequency.semiAnnual:
        return 'Semi Annual';

      case PaymentFrequency.annual:
        return 'Annual';
    }
  }
}
