// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileAdapter extends TypeAdapter<Profile> {
  @override
  final typeId = 3;

  @override
  Profile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Profile(
      id: fields[0] as String,
      name: fields[1] as String,
      email: fields[2] as String,
      phone: fields[3] as String?,
      role: fields[4] as UserRole,
      createdAt: fields[5] as DateTime?,
      updatedAt: fields[6] as DateTime?,
      deletedAt: fields[7] as DateTime?,
      orgId: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Profile obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.role)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt)
      ..writeByte(7)
      ..write(obj.deletedAt)
      ..writeByte(8)
      ..write(obj.orgId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Profile _$ProfileFromJson(Map<String, dynamic> json) => _Profile(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String?,
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
  orgId: json['org_id'] as String?,
);

Map<String, dynamic> _$ProfileToJson(_Profile instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'role': _$UserRoleEnumMap[instance.role]!,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
  'org_id': instance.orgId,
};

const _$UserRoleEnumMap = {
  UserRole.platformAdmin: 'platform_admin',
  UserRole.manager: 'manager',
  UserRole.resident: 'resident',
  UserRole.security: 'security',
  UserRole.maintenance: 'maintenance',
};
