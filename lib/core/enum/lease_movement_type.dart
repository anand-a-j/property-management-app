import 'package:json_annotation/json_annotation.dart';

enum LeaseMovementType {
  @JsonValue('move_in')
  moveIn,

  @JsonValue('move_out')
  moveOut,
}

extension LeaseMovementTypeExtension on LeaseMovementType {
  String get label {
    switch (this) {
      case LeaseMovementType.moveIn:
        return 'Move In';
      case LeaseMovementType.moveOut:
        return 'Move Out';
    }
  }
}
