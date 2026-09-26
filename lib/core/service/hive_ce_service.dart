import 'package:naseem/core/enum/box_types.dart';

import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../module/auth/core/model/profile.dart';

class HiveService {
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    // Register adapters
    // Hive.registerAdapter(UserRoleAdapter());
    // Hive.registerAdapter(ProfileAdapter());

    // Open boxes
    await Hive.openBox<dynamic>(BoxType.settings.name);

    await Hive.openBox<Profile>(BoxType.profile.name);
  }
}
