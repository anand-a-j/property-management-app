// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resident_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResidentListResponse _$ResidentListResponseFromJson(
  Map<String, dynamic> json,
) => _ResidentListResponse(
  residentName: json['resident_name'] as String,
  profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
  profileDetails: json['profile_details'] == null
      ? null
      : ProfileDetails.fromJson(
          json['profile_details'] as Map<String, dynamic>,
        ),
  residentStatus: $enumDecode(_$ResidentStatusEnumMap, json['resident_status']),
  currentUnitId: json['current_unit_id'] as String?,
  currentUnitName: json['current_unit_name'] as String?,
  communityId: json['community_id'] as String?,
  communityName: json['community_name'] as String?,
);

Map<String, dynamic> _$ResidentListResponseToJson(
  _ResidentListResponse instance,
) => <String, dynamic>{
  'resident_name': instance.residentName,
  'profile': instance.profile,
  'profile_details': instance.profileDetails,
  'resident_status': _$ResidentStatusEnumMap[instance.residentStatus]!,
  'current_unit_id': instance.currentUnitId,
  'current_unit_name': instance.currentUnitName,
  'community_id': instance.communityId,
  'community_name': instance.communityName,
};

const _$ResidentStatusEnumMap = {
  ResidentStatus.onboarding: 'onboarding',
  ResidentStatus.current: 'current',
  ResidentStatus.exited: 'exited',
};
