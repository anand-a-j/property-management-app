import 'package:hive_ce/hive.dart';

import '../../../../../core/enum/box_types.dart';
import '../../../model/product.dart';

class ProductDB {
  final Box<Product> _box = Hive.box<Product>(BoxType.products.name);

  Future<void> saveProducts(List<Product> products) async {
    final map = {for (var p in products) p.id: p};
    await _box.putAll(map);
  }

  List<Product> getProducts() {
    return _box.values.toList();
  }

  Future<void> addProduct(Product product) async {
    await _box.put(product.id, product);
  }

  Future<void> deleteProduct(String id) async {
    await _box.delete(id);
  }

  Future<void> clear() async {
    await _box.clear();
  }
}
