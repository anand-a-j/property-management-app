// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StoreAdapter extends TypeAdapter<Store> {
  @override
  final typeId = 2;

  @override
  Store read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Store(
      id: fields[0] as String,
      userId: fields[1] as String,
      name: fields[2] as String,
      storeSlug: fields[3] as String,
      logoUrl: fields[4] as String?,
      logoPath: fields[5] as String?,
      description: fields[6] as String?,
      whatsappNumber: fields[7] as String,
      primaryColor: fields[8] == null ? 'f2f3dd' : fields[8] as String,
      createdAt: fields[9] as DateTime,
      deliveryType: fields[10] == null ? 'fixed' : fields[10] as String,
      deliveryCharge: fields[11] == null ? 0 : fields[11] as num,
      freeDeliveryAbove: fields[12] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, Store obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.storeSlug)
      ..writeByte(4)
      ..write(obj.logoUrl)
      ..writeByte(5)
      ..write(obj.logoPath)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.whatsappNumber)
      ..writeByte(8)
      ..write(obj.primaryColor)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.deliveryType)
      ..writeByte(11)
      ..write(obj.deliveryCharge)
      ..writeByte(12)
      ..write(obj.freeDeliveryAbove);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Store _$StoreFromJson(Map<String, dynamic> json) => _Store(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  name: json['name'] as String,
  storeSlug: json['store_slug'] as String,
  logoUrl: json['logo_url'] as String?,
  logoPath: json['logo_path'] as String?,
  description: json['description'] as String?,
  whatsappNumber: json['whatsapp_number'] as String,
  primaryColor: json['primary_color'] as String? ?? "f2f3dd",
  createdAt: DateTime.parse(json['created_at'] as String),
  deliveryType: json['delivery_type'] as String? ?? 'fixed',
  deliveryCharge: json['delivery_charge'] as num? ?? 0,
  freeDeliveryAbove: json['free_delivery_above'] as num?,
);

Map<String, dynamic> _$StoreToJson(_Store instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'name': instance.name,
  'store_slug': instance.storeSlug,
  'logo_url': instance.logoUrl,
  'logo_path': instance.logoPath,
  'description': instance.description,
  'whatsapp_number': instance.whatsappNumber,
  'primary_color': instance.primaryColor,
  'created_at': instance.createdAt.toIso8601String(),
  'delivery_type': instance.deliveryType,
  'delivery_charge': instance.deliveryCharge,
  'free_delivery_above': instance.freeDeliveryAbove,
};
