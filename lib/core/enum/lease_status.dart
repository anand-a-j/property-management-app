import 'package:json_annotation/json_annotation.dart';

enum LeaseStatus {
  @JsonValue('draft')
  draft,

  @JsonValue('active')
  active,

  @JsonValue('expired')
  expired,

  @JsonValue('terminated')
  terminated,

  @JsonValue('cancelled')
  cancelled,
}
