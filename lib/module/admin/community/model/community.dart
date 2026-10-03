import 'package:freezed_annotation/freezed_annotation.dart';

part 'community.freezed.dart';
part 'community.g.dart';

@freezed
abstract class Community with _$Community {
  const factory Community({
    required String id,

    @JsonKey(name: 'org_id') required String orgId,

    @JsonKey(name: 'development_type') required String developmentType,

    @JsonKey(name: 'community_type') required String communityType,

    required String name,
    required String address,
    required String description,

    @JsonKey(name: 'created_at') required DateTime createdAt,

    @JsonKey(name: 'updated_at') required DateTime updatedAt,

    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
  }) = _Community;

  factory Community.fromJson(Map<String, dynamic> json) =>
      _$CommunityFromJson(json);
}
