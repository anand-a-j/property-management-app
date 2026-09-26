import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

@HiveType(typeId: 1)
enum UserRole {
  @HiveField(0)
  @JsonValue('platform_admin')
  platformAdmin,

  @HiveField(1)
  @JsonValue('manager')
  manager,

  @HiveField(2)
  @JsonValue('resident')
  resident,

  @HiveField(3)
  @JsonValue('security')
  security,

  @HiveField(4)
  @JsonValue('maintenance')
  maintenance,
}

class UserRoleAdapter extends TypeAdapter<UserRole> {
  @override
  final int typeId = 1;

  @override
  UserRole read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UserRole.platformAdmin;
      case 1:
        return UserRole.manager;
      case 2:
        return UserRole.resident;
      case 3:
        return UserRole.security;
      case 4:
        return UserRole.maintenance;
      default:
        throw StateError('Unknown UserRole value');
    }
  }

  @override
  void write(BinaryWriter writer, UserRole obj) {
    switch (obj) {
      case UserRole.platformAdmin:
        writer.writeByte(0);
      case UserRole.manager:
        writer.writeByte(1);
      case UserRole.resident:
        writer.writeByte(2);
      case UserRole.security:
        writer.writeByte(3);
      case UserRole.maintenance:
        writer.writeByte(4);
    }
  }
}

extension UserRoleX on UserRole {
  String get value {
    switch (this) {
      case UserRole.platformAdmin:
        return 'platform_admin';
      case UserRole.manager:
        return 'manager';
      case UserRole.resident:
        return 'resident';
      case UserRole.security:
        return 'security';
      case UserRole.maintenance:
        return 'maintenance';
    }
  }
}
