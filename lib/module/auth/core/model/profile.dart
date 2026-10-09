import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive_ce.dart';

import '../../../../core/enum/user_role.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
@HiveType(typeId: 3, adapterName: 'ProfileAdapter')
abstract class Profile with _$Profile {
  const factory Profile({
    @HiveField(0) required String id,

    @HiveField(1) required String name,

    @HiveField(2) required String email,

    @HiveField(3) String? phone,

    @HiveField(4) required UserRole role,

    @HiveField(5) @JsonKey(name: 'created_at') DateTime? createdAt,

    @HiveField(6) @JsonKey(name: 'updated_at') DateTime? updatedAt,

    @HiveField(7) @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    @HiveField(8) @JsonKey(name: 'org_id') String? orgId,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
