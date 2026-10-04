import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/api/data_response.dart';
import '../../../../core/utils/error_log.dart';
import '../../../auth/core/model/profile.dart';

class StaffRepo {
  final SupabaseClient _client = Supabase.instance.client;

  Future<DataResponse<List<Profile>>> fetchStaffs({
    required String orgId,
  }) async {
    try {
      final data = await _client
          .from('profiles')
          .select()
          .eq('org_id', orgId)
          .inFilter('role', ['security', 'maintenance'])
          .limit(20);

      final staffs = (data as List)
          .map((e) => Profile.fromJson(e as Map<String, dynamic>))
          .toList();

      return DataResponse<List<Profile>>(data: staffs);
    } catch (e, stack) {
      return DataResponse(error: errorlog("StaffRepo.fetchStaffs", e, stack));
    }
  }
}
