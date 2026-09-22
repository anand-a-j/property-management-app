import 'package:flutter/material.dart';
import 'package:habitroot/core/utils/snackbar_manager.dart' show Snack;
import 'package:habitroot/features/storage/controller/storage_service.dart';

import '../../model/product.dart';
import '../data/product_repo.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepo _repo;
  final StorageService _storageService;

  ProductProvider(this._repo, this._storageService);

  bool isLoading = false;
  bool isLoadingMore = false;
  bool hasMore = true;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  bool isDeleting = false;

  List<Product> products = [];

  int _totalProductCount = 0;
  int get totalProductCount => _totalProductCount;

  int _offset = 0;
  final int _limit = 6;

  String currentSearch = '';

  // product details
  Product? selectedProduct;
  bool isDetailsLoading = false;

  /// INITIAL LOAD
  Future<void> loadInitial(String storeId) async {
    if (_isLoaded) return;

    _isLoaded = true; // ✅ IMPORTANT (add this)

    _offset = 0;
    hasMore = true;
    products.clear();

    isLoading = true;
    notifyListeners();

    final response = await _repo.getProducts(
      storeId: storeId,
      limit: _limit,
      offset: _offset,
    );

    isLoading = false;

    if (response.error != null) {
      _isLoaded = false; // 🔥 allow retry if failed
      Snack.error(response.error!);
      notifyListeners();
      return;
    }

    final list = response.data!;
    _totalProductCount = response.data?.totalCount ?? 0;

    products = List<Product>.from(list.products);
    _offset += list.products.length;

    if (list.products.length < _limit) hasMore = false;

    notifyListeners();
  }

  /// LOAD MORE
  Future<void> loadMore(String storeId) async {
    if (!hasMore || isLoadingMore) return;

    isLoadingMore = true;
    notifyListeners();

    final response = await _repo.getProducts(
      storeId: storeId,
      limit: _limit,
      offset: _offset,
      search: currentSearch,
    );

    isLoadingMore = false;

    if (response.error != null) {
      Snack.error(response.error!);
      notifyListeners();
      return;
    }

    final list = response.data!;
    _totalProductCount = response.data?.totalCount ?? 0;

    products.addAll(list.products);
    _offset += list.products.length;

    hasMore = products.length < _totalProductCount;

    notifyListeners();
  }

  /// SEARCH
  Future<void> search(String storeId, String query) async {
    currentSearch = query;
    _offset = 0;
    hasMore = true;

    isLoading = true;
    notifyListeners();

    final response = await _repo.getProducts(
      storeId: storeId,
      limit: _limit,
      offset: 0,
      search: query,
    );

    isLoading = false;

    if (response.error != null) {
      Snack.error(response.error!);
      notifyListeners();
      return;
    }

    final list = response.data!;
    _totalProductCount = list.totalCount;

    products = list.products;
    _offset += list.products.length;

    hasMore = products.length < _totalProductCount;

    notifyListeners();
  }

  /// ADD PRODUCT
  Future<bool> addProduct({
    required String storeId,
    required String name,
    required double price,
    double? salePrice,
    String? description,
    String? imageUrl,
    String? imagePath,
    int sortOrder = 0,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await _repo.addProduct(
        storeId: storeId,
        name: name,
        price: price,
        imagePath: imagePath,
        imageUrl: imageUrl,
        description: description,
        salePrice: salePrice,
        sortOrder: sortOrder,
      );

      isLoading = false;

      if (response.error != null) {
        Snack.error(response.error!);
        notifyListeners();
        return false;
      }

      final product = response.data!;
      products.add(product);

      Snack.success("Product added ✅");
      notifyListeners();

      return true;
    } catch (e) {
      isLoading = false;
      Snack.error("Something went wrong");
      notifyListeners();
      return false;
    }
  }

  /// UPDATE PRODUCT
  Future<bool> updateProduct({
    required String id,
    required String name,
    required double price,
    double? salePrice,
    String? description,
    String? imageUrl,
    String? imagePath,
    int? sortOrder,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await _repo.updateProduct(
        id: id,
        name: name,
        price: price,
        description: description,
        imageUrl: imageUrl,
        imagePath: imagePath,
        salePrice: salePrice,
        sortOrder: sortOrder,
      );

      isLoading = false;

      if (response.error != null) {
        Snack.error(response.error!);
        notifyListeners();
        return false;
      }

      final updated = response.data!;

      final index = products.indexWhere((e) => e.id == id);
      if (index != -1) {
        products[index] = updated;
      }

      Snack.success("Updated ✅");
      notifyListeners();

      return true;
    } catch (e) {
      isLoading = false;
      Snack.error("Error updating");
      notifyListeners();
      return false;
    }
  }

  /// DELETE PRODUCT
  Future<bool> deleteProduct(Product product) async {
    if (isDeleting) return false;

    try {
      isDeleting = true;
      notifyListeners();

      /// 1. DELETE IMAGE FIRST
      if (product.imagePath != null && product.imagePath!.isNotEmpty) {
        final imageRes = await _storageService.deleteImage(product.imagePath);

        if (imageRes.error != null) {
          Snack.error(imageRes.error!);
          return false;
        }
      }

      /// 2. DELETE PRODUCT FROM DB
      final response = await _repo.deleteProduct(product.id!);

      if (response.error != null) {
        Snack.error(response.error!);
        return false;
      }

      /// 3. UPDATE LOCAL LIST
      products.removeWhere((e) => e.id == product.id);

      notifyListeners();

      Snack.success("Deleted 🗑");

      return true;
    } catch (e) {
      Snack.error("Delete failed");
      return false;
    } finally {
      isDeleting = false;
      notifyListeners();
    }
  }

  /// 🔎 LOAD SINGLE PRODUCT (FOR EDIT)
  Future<void> loadProductDetails(String productId) async {
    try {
      isDetailsLoading = true;
      notifyListeners();

      final response = await _repo.getProductDetails(productId);

      isDetailsLoading = false;

      if (response.error != null) {
        Snack.error(response.error!);
        notifyListeners();
        return;
      }

      selectedProduct = response.data;
      notifyListeners();
    } catch (e) {
      isDetailsLoading = false;
      Snack.error("Failed to load product");
      notifyListeners();
    }
  }

  Future<void> refresh(String storeId) async {
    _isLoaded = false;
    _offset = 0;
    hasMore = true;
    currentSearch = '';

    products = [];

    notifyListeners();

    await loadInitial(storeId);
  }
}
