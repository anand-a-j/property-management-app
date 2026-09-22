import 'package:habitroot/core/enum/box_types.dart';
import 'package:habitroot/features/product/model/product.dart';
import 'package:habitroot/features/store/model/store.dart';
import 'package:habitroot/features/user/model/app_user.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../old_feature/habit/domain/habit.dart';
import '../../old_feature/notification/domain/reminder.dart';

class HiveService {
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(HabitAdapter());
    }

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ReminderAdapter());
    }

    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(StoreAdapter());
    }

    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(ProductAdapter());
    }

    if (!Hive.isAdapterRegistered(4)) {
      Hive.registerAdapter(AppUserAdapter());
    }

    await Hive.openBox<Habit>(BoxType.habit.name);

    // NEW
    await Hive.openBox<dynamic>(BoxType.settings.name);
    await Hive.openBox<AppUser>(BoxType.user.name);
    await Hive.openBox<Store>(BoxType.store.name);
    await Hive.openBox<Product>(BoxType.products.name);
  }
}
