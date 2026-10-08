import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

enum UnitStatus {
  @JsonValue('unassigned')
  unassigned,

  @JsonValue('occupied')
  occupied,

  @JsonValue('vacant')
  vacant,

  @JsonValue('maintenance')
  maintenance,
}

extension UnitStatusExtension on UnitStatus {
  String get label {
    switch (this) {
      case UnitStatus.unassigned:
        return 'Unassigned';

      case UnitStatus.occupied:
        return 'Occupied';

      case UnitStatus.vacant:
        return 'Vacant';

      case UnitStatus.maintenance:
        return 'Maintenance';
    }
  }

  Color get color {
    switch (this) {
      case UnitStatus.unassigned:
        return Colors.grey;

      case UnitStatus.occupied:
        return Colors.green;

      case UnitStatus.vacant:
        return Colors.orange;

      case UnitStatus.maintenance:
        return Colors.red;
    }
  }
}
