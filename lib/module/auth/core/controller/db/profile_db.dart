
import 'package:hive_ce/hive.dart';

import '../../../../../core/enum/box_types.dart';
import '../../model/profile.dart';

class ProfileDB {
  static const String currentProfileKey = 'current_profile';

  final Box<Profile> _box = Hive.box<Profile>(BoxType.profile.name);

  /// Get current profile
  Profile? getProfile() {
    return _box.get(currentProfileKey);
  }

  /// Save profile
  Future<void> saveProfile(Profile profile) async {
    await _box.put(currentProfileKey, profile);
  }

  /// Delete current profile
  Future<void> deleteProfile() async {
    await _box.delete(currentProfileKey);
  }

  /// Clear all profile data
  Future<void> clearAll() async {
    await _box.clear();
  }

  /// Check if profile exists
  bool hasProfile() {
    return _box.containsKey(currentProfileKey);
  }
}
