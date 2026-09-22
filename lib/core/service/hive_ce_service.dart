import 'package:naseem/core/enum/box_types.dart';

import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);



    // NEW
    await Hive.openBox<dynamic>(BoxType.settings.name);

  }
}
