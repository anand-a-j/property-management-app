// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Payment _$PaymentFromJson(Map<String, dynamic> json) => _Payment(
  id: json['id'] as String,
  paymentNumber: json['payment_number'] as String,
  leaseId: json['lease_id'] as String,
  dueDate: DateTime.parse(json['due_date'] as String),
  amount: (json['amount'] as num).toDouble(),
  paymentType: $enumDecode(_$PaymentTypeEnumMap, json['payment_type']),
  status:
      $enumDecodeNullable(_$PaymentStatusEnumMap, json['status']) ??
      PaymentStatus.draft,
  paidDate: json['paid_date'] == null
      ? null
      : DateTime.parse(json['paid_date'] as String),
  chequeNumber: json['cheque_number'] as String?,
  chequeCopyPath: json['cheque_copy_path'] as String?,
  chequeSubmittedAt: json['cheque_submitted_at'] == null
      ? null
      : DateTime.parse(json['cheque_submitted_at'] as String),
  bounceReason: json['bounce_reason'] as String?,
  description: json['description'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
  lease: json['lease'] == null
      ? null
      : LeasePaymentDetails.fromJson(json['lease'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PaymentToJson(_Payment instance) => <String, dynamic>{
  'id': instance.id,
  'payment_number': instance.paymentNumber,
  'lease_id': instance.leaseId,
  'due_date': instance.dueDate.toIso8601String(),
  'amount': instance.amount,
  'payment_type': _$PaymentTypeEnumMap[instance.paymentType]!,
  'status': _$PaymentStatusEnumMap[instance.status]!,
  'paid_date': instance.paidDate?.toIso8601String(),
  'cheque_number': instance.chequeNumber,
  'cheque_copy_path': instance.chequeCopyPath,
  'cheque_submitted_at': instance.chequeSubmittedAt?.toIso8601String(),
  'bounce_reason': instance.bounceReason,
  'description': instance.description,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
  'lease': instance.lease,
};

const _$PaymentTypeEnumMap = {PaymentType.cheque: 'cheque'};

const _$PaymentStatusEnumMap = {
  PaymentStatus.draft: 'draft',
  PaymentStatus.pending: 'pending',
  PaymentStatus.paid: 'paid',
  PaymentStatus.bounced: 'bounced',
  PaymentStatus.cancelled: 'cancelled',
};
