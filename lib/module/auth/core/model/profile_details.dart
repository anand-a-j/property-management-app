import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'profile_details.freezed.dart';
part 'profile_details.g.dart';

@freezed
@HiveType(typeId: 4, adapterName: 'ProfileDetailsAdapter')
abstract class ProfileDetails with _$ProfileDetails {
  const factory ProfileDetails({
    @HiveField(0) @JsonKey(name: 'profile_id') String? profileId,

    @HiveField(1) @JsonKey(name: 'first_name') @Default('') String firstName,

    @HiveField(2) @JsonKey(name: 'last_name') @Default('') String lastName,

    @HiveField(3) String? nickname,

    @HiveField(4) @JsonKey(name: 'emirates_id') String? emiratesId,

    @HiveField(5) @JsonKey(name: 'created_at') DateTime? createdAt,

    @HiveField(6) @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ProfileDetails;

  factory ProfileDetails.fromJson(Map<String, dynamic> json) =>
      _$ProfileDetailsFromJson(json);
}
