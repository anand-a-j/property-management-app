import 'package:hive_ce/hive.dart';

import '../../../../../core/enum/box_types.dart';
import '../../../model/app_user.dart';

class UserDB {
  static const String currentUserKey = 'current_user';

  final Box<AppUser> _box = Hive.box<AppUser>(BoxType.user.name);

  /// Get current user
  AppUser? getUser() {
    return _box.get(currentUserKey);
  }

  /// Save user (create/update)
  Future<void> saveUser(AppUser user) async {
    await _box.put(currentUserKey, user);
  }

  /// Delete user
  Future<void> deleteUser() async {
    await _box.delete(currentUserKey);
  }

  /// Clear all
  Future<void> clearAll() async {
    await _box.clear();
  }

  /// Check if user exists
  bool hasUser() {
    return _box.containsKey(currentUserKey);
  }
}
