import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../../../../core/utils/error_log.dart';
import '../../../../auth/core/model/profile.dart';
import '../../model/resident_list_response.dart';

class ResidentRepo {
  final SupabaseClient _client = Supabase.instance.client;

  Future<DataResponse<List<ResidentListResponse>>> fetchResidents({
    required String orgId,
  }) async {
    try {
      final data = await _client
          .from('resident_list_view')
          .select()
          .eq('org_id', orgId)
          .order('resident_name')
          .limit(20);

      final residents = data
          .map(
            (e) => ResidentListResponse.fromJson(Map<String, dynamic>.from(e)),
          )
          .toList();

      return DataResponse<List<ResidentListResponse>>(data: residents);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('ResidentRepo.fetchResidents', e, stack),
      );
    }
  }
}
