import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../../../../core/utils/error_log.dart';
import '../../../model/security_lease_movement.dart';

class SecurityLeaseMovementRepo {
  final SupabaseClient _client = Supabase.instance.client;

  Future<DataResponse<List<SecurityLeaseMovement>>>
  fetchSecurityLeaseMovements({required String orgId}) async {
    try {
      final data = await _client
          .from('security_lease_movements_view')
          .select()
          .eq('org_id', orgId)
          .eq('status', 'pending_security')
          .order('requested_at', ascending: false)
          .limit(15);

      final movements = (data as List)
          .map((e) => SecurityLeaseMovement.fromJson(e as Map<String, dynamic>))
          .toList();

      return DataResponse(data: movements);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog(
          "SecurityLeaseMovementRepo.fetchSecurityLeaseMovements",
          e,
          stack,
        ),
      );
    }
  }
}
