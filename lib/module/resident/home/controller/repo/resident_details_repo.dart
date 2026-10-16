import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../../../../core/utils/error_log.dart';
import '../../model/resident_lease_details.dart';

class ResidentDetailsRepo {
  final SupabaseClient _client = Supabase.instance.client;

  Future<DataResponse<List<ResidentLeaseDetails>>> fetchResidentLeaseDetails({
    required String residentId,
  }) async {
    try {
      final data = await _client
          .from('resident_lease_details')
          .select()
          .eq('resident_id', residentId);

      final details = (data as List)
          .map((e) => ResidentLeaseDetails.fromJson(e as Map<String, dynamic>))
          .toList();

      return DataResponse(data: details);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog(
          "ResidentDetailsRepo.fetchResidentLeaseDetails",
          e,
          stack,
        ),
      );
    }
  }
}
