import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive_ce.dart';

import '../../../../core/enum/user_role.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
@HiveType(typeId: 3, adapterName: 'ProfileAdapter')
abstract class Profile with _$Profile {
  const factory Profile({
    @HiveField(0) required String id,

    @HiveField(1) required String name,

    @HiveField(2) required String email,

    @HiveField(3) String? phone,

    @HiveField(4) required UserRole role,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
