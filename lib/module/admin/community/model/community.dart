import 'package:freezed_annotation/freezed_annotation.dart';

part 'community.freezed.dart';
part 'community.g.dart';

@freezed
abstract class Community with _$Community {
  const factory Community({
    String? id,

    @JsonKey(name: 'org_id') String? orgId,

    @JsonKey(name: 'development_type') String? developmentType,

    @JsonKey(name: 'community_type') String? communityType,

    String? name,
    String? address,
    String? description,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,

    @JsonKey(name: 'deleted_at') DateTime? deletedAt,

    // Unit counts
    @JsonKey(name: 'total_units') @Default(0) int? totalUnits,

    @JsonKey(name: 'occupied_units') @Default(0) int? occupiedUnits,

    @JsonKey(name: 'vacant_units') @Default(0) int? vacantUnits,
  }) = _Community;

  factory Community.fromJson(Map<String, dynamic> json) =>
      _$CommunityFromJson(json);
}
