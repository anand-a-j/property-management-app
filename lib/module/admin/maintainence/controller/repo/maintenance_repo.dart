import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../../../../core/utils/error_log.dart';
import '../../model/add_maintenance.dart';
import '../../model/maintenance_request.dart';

class MaintenanceRepo {
  final SupabaseClient _client = Supabase.instance.client;

  // ADD MAINTENANCE REQUEST

  Future<DataResponse<void>> addMaintenance({
    required AddMaintenance maintenance,
  }) async {
    try {
      await _client.from('maintenance_requests').insert(maintenance.toJson());

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('MaintenanceRepo.addMaintenance', e, stack),
      );
    }
  }

  // GET MAINTENANCE LIST
  Future<DataResponse<List<MaintenanceRequest>>> getMaintenanceList({
    required String orgId,
    String? unitId,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final from = (page - 1) * limit;
      final to = from + limit - 1;

      var query = _client
          .from('maintenance_requests')
          .select()
          .eq('org_id', orgId);

      if (unitId != null) {
        query = query.eq('unit_id', unitId);
      }

      final data = await query
          .order('created_at', ascending: false)
          .range(from, to);

      final maintenanceList = data
          .map((json) => MaintenanceRequest.fromJson(json))
          .toList();

      return DataResponse(data: maintenanceList);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('MaintenanceRepo.getMaintenanceList', e, stack),
      );
    }
  }
}
