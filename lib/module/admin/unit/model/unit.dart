import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enum/unit_status.dart';

part 'unit.freezed.dart';
part 'unit.g.dart';

@freezed
abstract class Unit with _$Unit {
  const factory Unit({
    required String id,

    @JsonKey(name: 'community_id') required String communityId,

    required String name,
    required String area,
    required String description,

    @JsonKey(name: 'created_at') required DateTime createdAt,

    @JsonKey(name: 'updated_at') required DateTime updatedAt,

    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    UnitStatus? status,
  }) = _Unit;

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);
}
