import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enum/resident_status.dart';
import '../../../auth/core/model/profile.dart';
import '../../../auth/core/model/profile_details.dart';

part 'resident_list_response.freezed.dart';
part 'resident_list_response.g.dart';

@freezed
abstract class ResidentListResponse with _$ResidentListResponse {
  const factory ResidentListResponse({
    @JsonKey(name: 'resident_name') required String residentName,

    required Profile profile,

    @JsonKey(name: 'profile_details') ProfileDetails? profileDetails,

    @JsonKey(name: 'resident_status') required ResidentStatus residentStatus,

    @JsonKey(name: 'current_unit_id') String? currentUnitId,

    @JsonKey(name: 'current_unit_name') String? currentUnitName,

    @JsonKey(name: 'community_id') String? communityId,

    @JsonKey(name: 'community_name') String? communityName,
  }) = _ResidentListResponse;

  factory ResidentListResponse.fromJson(Map<String, dynamic> json) =>
      _$ResidentListResponseFromJson(json);
}
