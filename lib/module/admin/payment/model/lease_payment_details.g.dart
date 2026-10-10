// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lease_payment_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeasePaymentDetails _$LeasePaymentDetailsFromJson(Map<String, dynamic> json) =>
    _LeasePaymentDetails(
      id: json['id'] as String,
      unit: json['unit'] == null
          ? null
          : UnitPaymentDetails.fromJson(json['unit'] as Map<String, dynamic>),
      resident: json['resident'] == null
          ? null
          : ResidentPaymentDetails.fromJson(
              json['resident'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$LeasePaymentDetailsToJson(
  _LeasePaymentDetails instance,
) => <String, dynamic>{
  'id': instance.id,
  'unit': instance.unit,
  'resident': instance.resident,
};

_UnitPaymentDetails _$UnitPaymentDetailsFromJson(Map<String, dynamic> json) =>
    _UnitPaymentDetails(name: json['name'] as String);

Map<String, dynamic> _$UnitPaymentDetailsToJson(_UnitPaymentDetails instance) =>
    <String, dynamic>{'name': instance.name};

_ResidentPaymentDetails _$ResidentPaymentDetailsFromJson(
  Map<String, dynamic> json,
) => _ResidentPaymentDetails(name: json['name'] as String);

Map<String, dynamic> _$ResidentPaymentDetailsToJson(
  _ResidentPaymentDetails instance,
) => <String, dynamic>{'name': instance.name};
