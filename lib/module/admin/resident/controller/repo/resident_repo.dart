import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../../../../core/utils/error_log.dart';
import '../../../../auth/core/model/profile.dart';

class ResidentRepo {
  final SupabaseClient _client = Supabase.instance.client;

  Future<DataResponse<List<Profile>>> fetchResidents({
    required String orgId,
  }) async {
    try {
      final data = await _client
          .from('profiles')
          .select()
          .eq('org_id', orgId)
          .eq('role', 'resident')
          .limit(20);

      final residents = (data as List)
          .map((e) => Profile.fromJson(e as Map<String, dynamic>))
          .toList();

      return DataResponse<List<Profile>>(data: residents);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog("ResidentRepo.fetchResidents", e, stack),
      );
    }
  }
}
