import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/api/data_response.dart';
import '../../../../core/utils/error_log.dart';

class ProfileRepo {
  final SupabaseClient _client = Supabase.instance.client;

  // --------------------------------------------------
  // UPDATE BASIC PROFILE
  // Available for all logged-in roles.
  // Users can update only their own profile.
  // --------------------------------------------------x

  Future<DataResponse<String>> updateProfile({
    required String userId,
    required String name,
    String? phone,
  }) async {
    try {
      final normalizedName = name.trim();

      if (normalizedName.isEmpty) {
        return DataResponse(error: 'Name cannot be empty.');
      }

      await _client
          .from('profiles')
          .update({
            'name': normalizedName,
            'phone': phone?.trim().isNotEmpty == true ? phone!.trim() : null,
            'updated_at': DateTime.now().toUtc().toIso8601String(),
          })
          .eq('id', userId);

      return DataResponse(data: 'success');
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('ProfileRepo.updateProfile', e, stack),
      );
    }
  }

  // --------------------------------------------------
  // UPDATE RESIDENT DETAILS
  // Only residents can update their own details.
  // --------------------------------------------------

  Future<DataResponse<void>> updateResidentDetails({
    required String firstName,
    required String lastName,
    String? nickname,
    String? emiratesId,
  }) async {
    try {
      final user = _client.auth.currentUser;

      if (user == null) {
        return DataResponse(error: 'User is not logged in.');
      }

      final normalizedFirstName = firstName.trim();
      final normalizedLastName = lastName.trim();

      if (normalizedFirstName.isEmpty || normalizedLastName.isEmpty) {
        return DataResponse(error: 'First name and last name are required.');
      }

      // Verify resident role.
      final profile = await _client
          .from('profiles')
          .select('role')
          .eq('id', user.id)
          .maybeSingle();

      if (profile == null || profile['role'] != 'resident') {
        return DataResponse(
          error: 'Only residents can update resident details.',
        );
      }

      await _client.from('profile_details').upsert({
        'profile_id': user.id,
        'first_name': normalizedFirstName,
        'last_name': normalizedLastName,
        'nickname': nickname?.trim().isNotEmpty == true
            ? nickname!.trim()
            : null,
        'emirates_id': emiratesId?.trim().isNotEmpty == true
            ? emiratesId!.trim()
            : null,
        'updated_at': DateTime.now().toUtc().toIso8601String(),
      }, onConflict: 'profile_id');

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('ProfileRepo.updateResidentDetails', e, stack),
      );
    }
  }

  // --------------------------------------------------
  // DELETE MANAGED USER
  // Manager only.
  // Permanently deletes Auth user and related profile.
  // --------------------------------------------------

  Future<DataResponse<String>> deleteManagedUser({required String userId}) async {
    try {
  
      final response = await _client.functions.invoke(
        'delete-managed-user',
        body: {'user_id': userId},
      );

      if (response.status < 200 || response.status >= 300) {
        final data = response.data;

        final message = data is Map ? data['error']?.toString() : null;

        return DataResponse(error: message ?? 'Failed to delete user.');
      }

      return DataResponse(data: "success");
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('ProfileRepo.deleteManagedUser', e, stack),
      );
    }
  }
}
