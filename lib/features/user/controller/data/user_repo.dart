import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/api/data_response.dart';
import '../../../../core/utils/error_log.dart';
import '../../model/app_user.dart';

class UserRepo {
  final SupabaseClient _client = Supabase.instance.client;

  /// CREATE USER PROFILE (call after signup)
  Future<DataResponse<bool>> createUserProfile({
    required String id,
    String? name,
    String? email,
    String? phone,
  }) async {
    const fn = "UserRepo.createUserProfile";

    try {
      await _client.from('users').insert({
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
      });

      return DataResponse(data: true);
    } catch (e, stack) {
      return DataResponse(error: errorlog(fn, e, stack));
    }
  }

  /// GET USER PROFILE
  Future<DataResponse<AppUser?>> getUserProfile() async {
    const fn = "UserRepo.getUserProfile";

    try {
      final userId = _client.auth.currentUser?.id;

      if (userId == null) {
        return DataResponse(error: "User not found");
      }

      final data = await _client
          .from('users')
          .select()
          .eq('id', userId)
          .maybeSingle();

      if (data == null) {
        return DataResponse(error: "User not found");
      }

      return DataResponse(data: AppUser.fromJson(data));
    } catch (e, stack) {
      return DataResponse(error: errorlog(fn, e, stack));
    }
  }

  /// UPDATE USER PROFILE
  Future<DataResponse<bool>> updateUser({
    required String name,
    required String email,
  }) async {
    const fn = "UserRepo.updateUser";

    try {
      final userId = _client.auth.currentUser?.id;

      if (userId == null) {
        return DataResponse(error: "User not found");
      }

      await _client
          .from('users')
          .update({'name': name, 'email': email})
          .eq('id', userId);

      return DataResponse(data: true);
    } catch (e, stack) {
      return DataResponse(error: errorlog(fn, e, stack));
    }
  }
}
