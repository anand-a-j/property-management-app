import 'package:flutter/material.dart';

import '../../../../core/utils/error_log.dart';
import '../../../../core/utils/snackbar_manager.dart';
import '../../model/store.dart';
import '../data/store_db.dart';
import '../data/store_repo.dart';

class StoreProvider extends ChangeNotifier {
  final StoreRepo _repo;
  final StoreDB _db;

  StoreProvider(this._repo, this._db);

  bool isLoading = false;
  Store? currentStore;
  
  // Create Store without image
  Future<Store?> createStoreWithoutImage({
    required String name,
    required String slug,
    required String whatsapp,
    required String primaryColor,
    String? description,
  }) async {
    const fn = "StoreProvider.createStoreWithoutImage";

    try {
      isLoading = true;
      notifyListeners();

      final response = await _repo.createStore(
        name: name,
        slug: slug,
        whatsapp: whatsapp,
        description: description,
        logoUrl: null,
        logoPath: null,
        primaryColor: primaryColor,
      );

      if (response.hasError || response.data == null) {
        Snack.error(response.error ?? "Something went wrong");
        return null;
      }

      final store = response.data!;

      /// ✅ update provider state
      currentStore = store;

      /// ✅ cache
      await _db.saveStore(store);

      Snack.success("Store created successfully 🎉");

      return store; // 🔥 IMPORTANT
    } catch (e, stack) {
      errorlog(fn, e, stack);
      Snack.error("Unexpected error occurred");
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// CREATE STORE
  Future<bool> createStore({
    required String name,
    required String slug,
    required String whatsapp,
    required String primaryColor,
    String? description,
    String? logoUrl,
    String? logoPath,
  }) async {
    const fn = "StoreProvider.createStore";

    try {
      isLoading = true;
      notifyListeners();

      final response = await _repo.createStore(
        name: name,
        slug: slug,
        whatsapp: whatsapp,
        description: description,
        logoUrl: logoUrl,
        logoPath: logoPath,
        primaryColor: primaryColor,
      );

      if (response.hasError || response.data == null) {
        Snack.error(response.error ?? "Something went wrong");
        return false;
      }

      currentStore = response.data;

      await _db.saveStore(currentStore!);

      Snack.success("Store created successfully 🎉");
      return true;
    } catch (e, stack) {
      errorlog(fn, e, stack);
      Snack.error("Unexpected error occurred");
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// ✅ UPDATE STORE
  Future<bool> updateStore({
    String? name,
    String? whatsapp,
    String? primaryColor,
    String? description,
    String? logoUrl,
    String? logoPath,
  }) async {
    const fn = "StoreProvider.updateStore";

    try {
      if (currentStore == null) {
        Snack.error("No store found");
        return false;
      }

      isLoading = true;
      notifyListeners();

      final response = await _repo.updateStore(
        storeId: currentStore!.id,
        name: name,
        whatsapp: whatsapp,
        primaryColor: primaryColor,
        description: description,
        logoUrl: logoUrl,
        logoPath: logoPath,
      );

      if (response.hasError || response.data == null) {
        Snack.error(response.error ?? "Update failed");
        return false;
      }

      currentStore = response.data;

      /// ✅ Sync cache
      await _db.saveStore(currentStore!);

      Snack.success("Store updated successfully ✨");
      return true;
    } catch (e, stack) {
      errorlog(fn, e, stack);
      Snack.error("Unexpected error occurred");
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// ✅ UPDATE SLUG
  Future<bool> updateSlug(String newSlug) async {
    const fn = "StoreProvider.updateSlug";

    try {
      if (currentStore == null) {
        Snack.error("No store found");
        return false;
      }

      isLoading = true;
      notifyListeners();

      final response = await _repo.updateStoreSlug(
        storeId: currentStore!.id,
        newSlug: newSlug,
      );

      if (response.hasError || response.data == null) {
        Snack.error(response.error ?? "Slug update failed");
        return false;
      }

      currentStore = response.data;

      await _db.saveStore(currentStore!);

      Snack.success("Store URL updated 🚀");
      return true;
    } catch (e, stack) {
      errorlog(fn, e, stack);
      Snack.error("Unexpected error");
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// LOAD FROM CACHE
  void loadStore() {
    currentStore = _db.getStore();
    notifyListeners();
  }

  /// CLEAR STORE
  Future<void> clearStore() async {
    await _db.deleteStore();
    currentStore = null;
    notifyListeners();
  }

  /// CHECK STORE EXISTS
  bool hasStore() {
    return _db.hasStore();
  }

  /// CHECK SLUG AVAILABILITY
  Future<bool> checkSlug(String slug) async {
    const fn = "StoreProvider.checkSlug";

    try {
      isLoading = true;
      notifyListeners();

      final response = await _repo.isSlugAvailable(slug);

      if (response.hasError) {
        Snack.error(response.error ?? "Something went wrong");
        return false;
      }

      final isAvailable = response.data ?? false;

      if (!isAvailable) {
        Snack.error("Store name already taken");
      }

      return isAvailable;
    } catch (e, stack) {
      errorlog(fn, e, stack);
      Snack.error("Error checking name");
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
