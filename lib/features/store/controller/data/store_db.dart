import 'package:hive_ce/hive.dart';

import '../../../../core/enum/box_types.dart';
import '../../model/store.dart';

class StoreDB {

  static const String currentStoreKey = 'current_store';

  final Box<Store> _box = Hive.box<Store>(BoxType.store.name);

  /// Get current store
  Store? getStore() {
    return _box.get(currentStoreKey);
  }

  /// Save store (create/update)
  Future<void> saveStore(Store store) async {
    await _box.put(currentStoreKey, store);
  }

  /// Delete store
  Future<void> deleteStore() async {
    await _box.delete(currentStoreKey);
  }

  /// Clear all
  Future<void> clearAll() async {
    await _box.clear();
  }

  /// Check if store exists
  bool hasStore() {
    return _box.containsKey(currentStoreKey);
  }
}
