import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/api/data_response.dart';
import '../../../../core/api/global_error.dart';
import '../../../../core/utils/error_log.dart';

class AuthRepo {
  final SupabaseClient _client = Supabase.instance.client;

  // SIGN UP
  Future<DataResponse<void>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user == null) {
        return DataResponse(error: "Signup failed. Try again");
      }

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(error: errorlog("AuthService.signUp", e, stack));
    }
  }

  // SIGN IN
  Future<DataResponse<void>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        return DataResponse(error: "Invalid email or password");
      }

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(error: errorlog("AuthService.signIn", e, stack));
    }
  }

  // SIGN OUT
  Future<DataResponse<void>> signOut() async {
    try {
      await _client.auth.signOut();
      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(error: errorlog("AuthService.signOut", e, stack));
    }
  }

  // CURRENT USER
  User? getCurrentUser() {
    return _client.auth.currentUser;
  }

  // SESSION CHECK
  bool isLoggedIn() {
    return _client.auth.currentSession != null;
  }

  /// ❌ DELETE ACCOUNT (FULL CLEANUP)
  Future<DataResponse<bool>> deleteAccount() async {
    const fn = "AccountRepo.deleteAccount";

    try {
      final res = await _client.functions.invoke('delete-user');

      // 🔍 Handle HTTP-level errors
      if (res.status != 200) {
        return DataResponse(
          error: "Delete failed (${res.status}): ${res.data}",
        );
      }

      // ✅ Optional: validate response body
      final data = res.data;
      if (data == null || data['success'] != true) {
        return DataResponse(error: "Unexpected response from server");
      }

      // 🔓 Logout after delete
      await _client.auth.signOut();

      return DataResponse(data: true);
    } catch (e, stack) {
      return DataResponse(error: errorlog(fn, e, stack));
    }
  }

  
}
