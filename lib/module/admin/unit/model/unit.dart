import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enum/unit_status.dart';
import 'unit_list_item.dart';

part 'unit.freezed.dart';
part 'unit.g.dart';

@freezed
abstract class Unit with _$Unit {
  const factory Unit({
    String? id,

    @JsonKey(name: 'community_id') String? communityId,

    @JsonKey(name: 'unit_type') String? unitType,

    String? name,
    String? area,
    String? description,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,

    @JsonKey(name: 'deleted_at') DateTime? deletedAt,

    UnitStatus? status,
  }) = _Unit;

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);
}

