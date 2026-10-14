import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../../../../core/api/global_error.dart';
import '../../../../../core/enum/user_role.dart';
import '../../../../../core/utils/error_log.dart';
import '../../model/profile_details.dart';

class AuthRepo {
  final SupabaseClient _client = Supabase.instance.client;

  // SIGN UP
  Future<DataResponse<void>> signUp({
    required String email,
    required String password,
    required String name,
    String? phone,
    required UserRole role,
    String? orgId,
    ProfileDetails? profileDetails,
  }) async {
    try {
      final response = await _client.auth.signUp(
        email: email.trim(),
        password: password,
        data: {
          'name': name.trim(),
          'role': role.value,
          if (phone != null && phone.trim().isNotEmpty) 'phone': phone.trim(),
          if (orgId != null && orgId.isNotEmpty) 'org_id': orgId,

          // Additional resident details
          if (role == UserRole.resident && profileDetails != null) ...{
            'first_name': profileDetails.firstName.trim(),
            'last_name': profileDetails.lastName.trim(),
            if (profileDetails.nickname?.trim().isNotEmpty == true)
              'nickname': profileDetails.nickname!.trim(),
            if (profileDetails.emiratesId?.trim().isNotEmpty == true)
              'emirates_id': profileDetails.emiratesId!.trim(),
          },
        },
      );

      if (response.user == null) {
        return DataResponse(error: globalError('Signup failed'));
      }

      // Profile and profile_details are created by handle_new_user().
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
      log("email : ${email} password : ${password}");
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
