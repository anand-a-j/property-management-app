// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resident_lease_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResidentLeaseDetails _$ResidentLeaseDetailsFromJson(
  Map<String, dynamic> json,
) => _ResidentLeaseDetails(
  leaseId: json['lease_id'] as String,
  leaseNumber: json['lease_number'] as String,
  residentId: json['resident_id'] as String,
  leaseStatus: $enumDecode(_$LeaseStatusEnumMap, json['lease_status']),
  startDate: DateTime.parse(json['start_date'] as String),
  endDate: DateTime.parse(json['end_date'] as String),
  annualRent: (json['annual_rent'] as num).toDouble(),
  securityDeposit: (json['security_deposit'] as num).toDouble(),
  paymentFrequency: json['payment_frequency'] as String,
  numberOfCheques: (json['number_of_cheques'] as num).toInt(),
  leaseDescription: json['lease_description'] as String?,
  unitId: json['unit_id'] as String,
  unitName: json['unit_name'] as String,
  communityId: json['community_id'] as String,
  communityName: json['community_name'] as String,
);

Map<String, dynamic> _$ResidentLeaseDetailsToJson(
  _ResidentLeaseDetails instance,
) => <String, dynamic>{
  'lease_id': instance.leaseId,
  'lease_number': instance.leaseNumber,
  'resident_id': instance.residentId,
  'lease_status': _$LeaseStatusEnumMap[instance.leaseStatus]!,
  'start_date': instance.startDate.toIso8601String(),
  'end_date': instance.endDate.toIso8601String(),
  'annual_rent': instance.annualRent,
  'security_deposit': instance.securityDeposit,
  'payment_frequency': instance.paymentFrequency,
  'number_of_cheques': instance.numberOfCheques,
  'lease_description': instance.leaseDescription,
  'unit_id': instance.unitId,
  'unit_name': instance.unitName,
  'community_id': instance.communityId,
  'community_name': instance.communityName,
};

const _$LeaseStatusEnumMap = {
  LeaseStatus.draft: 'draft',
  LeaseStatus.active: 'active',
  LeaseStatus.expired: 'expired',
  LeaseStatus.terminated: 'terminated',
  LeaseStatus.cancelled: 'cancelled',
};
