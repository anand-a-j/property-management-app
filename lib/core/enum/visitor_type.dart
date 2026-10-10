import 'package:json_annotation/json_annotation.dart';

enum VisitType {
  @JsonValue('resident')
  resident,

  @JsonValue('maintenance')
  maintenance,

  @JsonValue('delivery')
  delivery,

  @JsonValue('guest')
  guest,

  @JsonValue('other')
  other,
}

extension VisitTypeExtension on VisitType {
  String get label {
    switch (this) {
      case VisitType.resident:
        return 'Resident Visit';
      case VisitType.maintenance:
        return 'Maintenance';
      case VisitType.delivery:
        return 'Delivery';
      case VisitType.guest:
        return 'Guest';
      case VisitType.other:
        return 'Other';
    }
  }
}

