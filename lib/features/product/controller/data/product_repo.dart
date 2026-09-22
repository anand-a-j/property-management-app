import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/api/data_response.dart';
import '../../../../core/utils/error_log.dart';
import '../../model/product.dart';
import '../../model/product_response.dart';

class ProductRepo {
  final SupabaseClient _client = Supabase.instance.client;



  /// 📦 GET PRODUCTS (LIST - OPTIMIZED)
  Future<DataResponse<ProductResponse>> getProducts({
    required String storeId,
    int limit = 6,
    int offset = 0,
    String? search,
  }) async {
    const fn = "ProductRepo.getProducts";

    try {
      var query = _client
          .from('products')
          .select(
            'id,name,price,sale_price,image_url',
           
          )
          .eq('store_id', storeId);

      /// 🔍 SEARCH
      if (search != null && search.isNotEmpty) {
        query = query.ilike('name', '%$search%');
      }

      /// 📦 ORDER + PAGINATION
      final response = await query
          .order('created_at', ascending: false)
          .range(offset, offset + limit - 1)
          .count(CountOption.exact);

      final list = (response.data as List)
          .map((e) => Product.fromJson(e))
          .toList();

      return DataResponse(
        data: ProductResponse(
          products: list,
          totalCount: response.count,
        ),
      );
    } catch (e, stack) {
      return DataResponse(error: errorlog(fn, e, stack));
    }
  }

  /// 🔎 GET SINGLE PRODUCT (FULL DETAILS)
  Future<DataResponse<Product>> getProductDetails(String productId) async {
    const fn = "ProductRepo.getProductDetails";

    try {
      final response = await _client
          .from('products')
          .select()
          .eq('id', productId)
          .single();

      final product = Product.fromJson(response);

      return DataResponse(data: product);
    } catch (e, stack) {
      return DataResponse(error: errorlog(fn, e, stack));
    }
  }

  /// ADD PRODUCT
  Future<DataResponse<Product>> addProduct({
    required String storeId,
    required String name,
    required double price,
    required double? salePrice,
    required String? description,
    required String? imageUrl,
    required String? imagePath,
    required int? sortOrder,
  }) async {
    const fn = "ProductRepo.addProduct";

    try {
      final response = await _client
          .from('products')
          .insert({
            'store_id': storeId,
            'name': name,
            'description': description,
            'price': price,
            'sale_price': salePrice,
            'image_url': imageUrl,
            'image_path': imagePath,
            'sort_order': sortOrder,
          })
          .select()
          .single();

      return DataResponse(data: Product.fromJson(response));
    } catch (e, stack) {
      return DataResponse(error: errorlog(fn, e, stack));
    }
  }

  /// UPDATE PRODUCT
  Future<DataResponse<Product>> updateProduct({
    required String id,
    required String name,
    required double price,
    required double? salePrice,
    required String? description,
    required String? imageUrl,
    required String? imagePath,
    required int? sortOrder,
  }) async {
    const fn = "ProductRepo.updateProduct";

    try {
      final response = await _client
          .from('products')
          .update({
            'name': name,
            'description': description,
            'price': price,
            'sale_price': salePrice,
            'image_url': imageUrl,
            'image_path': imagePath,
            'sort_order': sortOrder,
          })
          .eq('id', id)
          .select()
          .single();

      return DataResponse(data: Product.fromJson(response));
    } catch (e, stack) {
      return DataResponse(error: errorlog(fn, e, stack));
    }
  }

  /// DELETE PRODUCT
  Future<DataResponse<bool>> deleteProduct(String id) async {
    const fn = "ProductRepo.deleteProduct";

    try {
      await _client.from('products').delete().eq('id', id);
      return DataResponse(data: true);
    } catch (e, stack) {
      return DataResponse(error: errorlog(fn, e, stack));
    }
  }
}
