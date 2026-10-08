// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lease.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Lease _$LeaseFromJson(Map<String, dynamic> json) => _Lease(
  id: json['id'] as String,
  leaseNumber: json['lease_number'] as String,
  unitId: json['unit_id'] as String,
  residentId: json['resident_id'] as String,
  startDate: DateTime.parse(json['start_date'] as String),
  endDate: DateTime.parse(json['end_date'] as String),
  annualRent: (json['annual_rent'] as num).toDouble(),
  securityDeposit: (json['security_deposit'] as num?)?.toDouble() ?? 0,
  paymentFrequency: $enumDecode(
    _$PaymentFrequencyEnumMap,
    json['payment_frequency'],
  ),
  numberOfCheques: (json['number_of_cheques'] as num?)?.toInt() ?? 1,
  status:
      $enumDecodeNullable(_$LeaseStatusEnumMap, json['status']) ??
      LeaseStatus.draft,
  description: json['description'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
  resident: json['resident'] == null
      ? null
      : Profile.fromJson(json['resident'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LeaseToJson(_Lease instance) => <String, dynamic>{
  'id': instance.id,
  'lease_number': instance.leaseNumber,
  'unit_id': instance.unitId,
  'resident_id': instance.residentId,
  'start_date': instance.startDate.toIso8601String(),
  'end_date': instance.endDate.toIso8601String(),
  'annual_rent': instance.annualRent,
  'security_deposit': instance.securityDeposit,
  'payment_frequency': _$PaymentFrequencyEnumMap[instance.paymentFrequency]!,
  'number_of_cheques': instance.numberOfCheques,
  'status': _$LeaseStatusEnumMap[instance.status]!,
  'description': instance.description,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
  'resident': instance.resident,
};

const _$PaymentFrequencyEnumMap = {
  PaymentFrequency.monthly: 'monthly',
  PaymentFrequency.quarterly: 'quarterly',
  PaymentFrequency.semiAnnual: 'semi_annual',
  PaymentFrequency.annual: 'annual',
};

const _$LeaseStatusEnumMap = {
  LeaseStatus.draft: 'draft',
  LeaseStatus.active: 'active',
  LeaseStatus.expired: 'expired',
  LeaseStatus.terminated: 'terminated',
  LeaseStatus.cancelled: 'cancelled',
};
