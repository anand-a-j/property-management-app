import 'package:flutter/material.dart';
import 'package:habitroot/features/user/model/app_user.dart';

import '../../../../core/utils/snackbar_manager.dart';

import '../data/db/user_db.dart';
import '../data/user_repo.dart';

class UserProvider extends ChangeNotifier {
  final UserRepo _repo;
  final UserDB _db;

  UserProvider(this._repo, this._db);

  AppUser? user;
  bool isLoading = false;

  Future<bool> loadUserInitial() async {
    try {
      isLoading = true;
      notifyListeners();

      final freshUser = await _repo.getUserProfile();

      if (freshUser.hasData) {
        user = freshUser.data;

        /// 💾 Save to local DB
        await _db.saveUser(user!);

        return true; // ✅ success
      }

      return false; // ❌ no data = invalid session
    } catch (e) {
      /// 🔥 API failed (token expired / refresh failed)
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// LOAD PROFILE
  Future<void> loadUser() async {
    user = _db.getUser();
    notifyListeners();

    try {
      isLoading = true;
      notifyListeners();

      final freshUser = await _repo.getUserProfile();

      if (freshUser.hasData) {
        user = freshUser.data;
        await _db.saveUser(freshUser.data!);
      }
    } catch (e) {
      rethrow; // 🔥 IMPORTANT
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// UPDATE PROFILE
  Future<bool> updateProfile({
    required String name,
    required String email,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      final success = await _repo.updateUser(name: name, email: email);

      if (success.hasData) {
        /// Update local state
        user = user?.copyWith(name: name, email: email);

        /// SAVE to Hive
        if (user != null) {
          await _db.saveUser(user!);
        }
      }

      return true;
    } catch (e) {
      Snack.error(e.toString());
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _db.clearAll();
    user = null;
    notifyListeners();
  }
}
