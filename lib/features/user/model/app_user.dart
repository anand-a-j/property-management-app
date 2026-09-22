import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
@HiveType(typeId: 4, adapterName: 'AppUserAdapter')
abstract class AppUser with _$AppUser {
  const factory AppUser({
    @HiveField(0) required String id,
    @HiveField(1) String? name,
    @HiveField(2) String? email,
    @HiveField(3) @Default('store_admin') String role,
    @HiveField(4) DateTime? createdAt,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
