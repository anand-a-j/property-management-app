import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/api/data_response.dart';
import '../../../../core/utils/error_log.dart';
import '../../../auth/core/model/profile.dart';

class StaffRepo {
  final SupabaseClient _client = Supabase.instance.client;

  Future<DataResponse<List<Profile>>> fetchStaffs({
    required String orgId,
    required List<String> roles,
    String? searchQuery,
  }) async {
    try {
      var query = _client
          .from('profiles')
          .select()
          .eq('org_id', orgId)
          .inFilter('role', roles);

      final search = searchQuery?.trim();

      if (search != null && search.isNotEmpty) {
        query = query.or(
          'name.ilike.%$search%,email.ilike.%$search%,phone.ilike.%$search%',
        );
      }

      final data = await query.limit(20);

      final staffs = (data as List)
          .map((e) => Profile.fromJson(e as Map<String, dynamic>))
          .toList();

      return DataResponse<List<Profile>>(data: staffs);
    } catch (e, stack) {
      return DataResponse(error: errorlog('StaffRepo.fetchStaffs', e, stack));
    }
  }
}
