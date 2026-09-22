import 'package:flutter/material.dart';
import 'package:habitroot/core/utils/snackbar_manager.dart';

import '../../../store/controller/data/store_db.dart';
import '../../../store/controller/data/store_repo.dart';
import '../../../user/controller/data/db/user_db.dart';
import '../../../user/controller/data/user_repo.dart';
import '../../../user/model/app_user.dart';
import '../data/auth_repo.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepo _repo;
  final UserRepo _profileRepo;
  final UserDB _userDB;
  final StoreRepo _storeRepo;
  final StoreDB _storeDb;

  AuthProvider({
    required AuthRepo repo,
    required UserRepo profileRepo,
    required UserDB userDB,
    required StoreRepo storeRepo,
    required StoreDB storeDb,
  }) : _repo = repo,
       _profileRepo = profileRepo,
       _userDB = userDB,
       _storeRepo = storeRepo,
       _storeDb = storeDb;

  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;

  // SIGN UP
  Future<bool> signUp({required String email, required String password}) async {
    _setLoading(true);
    _error = null;

    final response = await _repo.signUp(
      email: email.trim(),
      password: password.trim(),
    );

    if (response.hasError) {
      _setLoading(false);
      _error = response.error;
      Snack.error(_error ?? "Signup failed");
      return false;
    }

    final user = _repo.getCurrentUser();

    if (user == null) {
      _setLoading(false);
      return false;
    }

    /// 1. Create profile in DB
    final profileRes = await _profileRepo.createUserProfile(
      id: user.id,
      email: user.email,
    );

    if (profileRes.hasError) {
      _setLoading(false);
      Snack.error(profileRes.error ?? "Profile creation failed");
      return false;
    }

    /// 2. Save locally (Hive)
    await _userDB.saveUser(
      AppUser(
        id: user.id,
        email: user.email ?? "",
        name: "",

        createdAt: DateTime.now(),
      ),
    );

    _setLoading(false);
    return true;
  }

  // SIGN IN
  Future<bool> signIn({required String email, required String password}) async {
    _setLoading(true);
    _error = null;

    final response = await _repo.signIn(
      email: email.trim(),
      password: password.trim(),
    );

    if (response.hasError) {
      _setLoading(false);
      _error = response.error;
      Snack.error(_error ?? "Login failed");
      return false;
    }

    /// ✅ 1. Fetch profile
    final profileRes = await _profileRepo.getUserProfile();

    if (profileRes.hasError) {
      _setLoading(false);
      Snack.error(profileRes.error ?? "Failed to fetch user");
      return false;
    }

    final user = profileRes.data!;

    /// ✅ 2. Fetch store
    final storeRes = await _storeRepo.getMyStore();

    if (storeRes.hasError) {
      _setLoading(false);
      Snack.error(storeRes.error ?? "Failed to fetch store");
      return false;
    }

    /// ✅ 3. Save user locally
    await _userDB.saveUser(
      AppUser(
        id: user.id,
        email: user.email,
        name: user.name,
        createdAt: DateTime.now(),
      ),
    );

    /// ✅ 4. Save store locally (if exists)
    if (storeRes.data != null) {
      await _storeDb.saveStore(storeRes.data!);
    }

    _setLoading(false);
    return true;
  }

  // SIGN OUT
  Future<void> signOut() async {
    _setLoading(true);
    _error = null;

    final response = await _repo.signOut();

    if (!response.hasError) {
      await _userDB.clearAll();
    }

    _setLoading(false);

    if (response.hasError) {
      _error = response.error;
      Snack.error(_error ?? "Logout failed");
    }
  }

  // SESSION CHECK
  bool isLoggedIn() {
    return _repo.isLoggedIn();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// ❌ DELETE ACCOUNT
  Future<bool> deleteAccount() async {
    _setLoading(true);
    _error = null;

    final response = await _repo.deleteAccount();

    if (response.hasError) {
      _setLoading(false);
      _error = response.error;

      Snack.error(_error ?? "Failed to delete account");
      return false;
    }

    try {
      /// 🧹 Clear ALL local data
      await _userDB.clearAll();
      await _storeDb.clearAll();

      _setLoading(false);

      Snack.success("Account deleted successfully 🗑️");

      return true;
    } catch (e, stack) {
      _setLoading(false);
      debugPrint("AuthProvider.deleteAccount.localCleanup $e $stack");

      Snack.error("Deleted account but failed to clean local data");
      return false;
    }
  }
}
