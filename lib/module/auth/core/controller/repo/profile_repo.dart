import 'package:naseem/module/auth/core/model/profile_details.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../../../../core/utils/error_log.dart';

class ProfileRepo {
  final SupabaseClient _client = Supabase.instance.client;

  /// Get profile details by profile ID
  Future<DataResponse<ProfileDetails?>> getProfileDetails({
    required String profileId,
  }) async {
    try {
      final data = await _client
          .from('profile_details')
          .select()
          .eq('profile_id', profileId)
          .maybeSingle();

      final profileDetails = ProfileDetails.fromJson(
        data as Map<String, dynamic>,
      );

      return DataResponse(data: profileDetails);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('ProfileRepo.getProfileDetails', e, stack),
      );
    }
  }
}
