import 'package:naseem/module/auth/core/model/profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../../../../core/api/global_error.dart';
import '../../../../../core/enum/user_role.dart';
import '../../../../../core/utils/error_log.dart';

class AuthRepo {
  final SupabaseClient _client = Supabase.instance.client;

  // SIGN UP
  Future<DataResponse<void>> signUp({
    required String email,
    required String password,
    required String name,
    String? phone,
    required UserRole role,
  }) async {
    try {
      final response = await _client.auth.signUp(
        email: email.trim(),
        password: password,
        data: {
          'name': name.trim(),
          'role': role.value,
          if (phone != null && phone.trim().isNotEmpty) 'phone': phone.trim(),
        },
      );

      if (response.user == null) {
        return DataResponse(error: globalError('Signup failed'));
      }

      // Profile is automatically created by
      // public.handle_new_user() trigger.

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(error: errorlog('AuthRepo.signUp', e, stack));
    }
  }

  // SIGN IN
  Future<DataResponse<void>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email.trim(),
        password: password,
      );

      if (response.user == null) {
        return DataResponse(error: globalError('Invalid email or password'));
      }

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(error: errorlog('AuthRepo.signIn', e, stack));
    }
  }

  // SIGN OUT
  Future<DataResponse<void>> signOut() async {
    try {
      await _client.auth.signOut();

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(error: errorlog('AuthRepo.signOut', e, stack));
    }
  }

  // CURRENT USER
  User? getCurrentUser() {
    return _client.auth.currentUser;
  }

  // CURRENT SESSION
  Session? getCurrentSession() {
    return _client.auth.currentSession;
  }

  // SESSION CHECK
  bool isLoggedIn() {
    return _client.auth.currentSession != null;
  }

  // GET CURRENT PROFILE
  Future<DataResponse<Map<String, dynamic>>> getCurrentProfile() async {
    try {
      final user = _client.auth.currentUser;

      if (user == null) {
        return DataResponse(error: 'User is not logged in');
      }

      final data = await _client
          .from('profiles')
          .select()
          .eq('id', user.id)
          .maybeSingle();

      if (data == null) {
        return DataResponse(error: 'Profile not found');
      }

      return DataResponse(data: data);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('AuthRepo.getCurrentProfile', e, stack),
      );
    }
  }

  // UPDATE CURRENT PROFILE
  Future<DataResponse<void>> updateProfile({
    required String name,
    String? phone,
  }) async {
    try {
      final user = _client.auth.currentUser;

      if (user == null) {
        return DataResponse(error: 'User is not logged in');
      }

      await _client
          .from('profiles')
          .update({
            'name': name.trim(),
            'phone': phone?.trim(),
            'updated_at': DateTime.now().toUtc().toIso8601String(),
          })
          .eq('id', user.id);

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(error: errorlog('AuthRepo.updateProfile', e, stack));
    }
  }

  // DELETE ACCOUNT
  Future<DataResponse<bool>> deleteAccount() async {
    const fn = 'AuthRepo.deleteAccount';

    try {
      final response = await _client.functions.invoke('delete-user');

      if (response.status != 200) {
        return DataResponse(
          error: 'Delete failed (${response.status}): ${response.data}',
        );
      }

      final data = response.data;

      if (data == null || data['success'] != true) {
        return DataResponse(error: 'Unexpected response from server');
      }

      await _client.auth.signOut();

      return DataResponse(data: true);
    } catch (e, stack) {
      return DataResponse(error: errorlog(fn, e, stack));
    }
  }
}
