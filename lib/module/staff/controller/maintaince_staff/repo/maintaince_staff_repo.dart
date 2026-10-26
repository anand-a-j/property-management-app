import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../../../../core/enum/mainteance_status.dart';
import '../../../../../core/utils/error_log.dart';
import '../../../../admin/maintainence/model/maintenance_request.dart';
import '../../../model/staff_maintenance_overview.dart';

class MaintainceStaffRepo {
  final SupabaseClient _client = Supabase.instance.client;

  // GET STAFF MAINTENANCE LIST WITH COUNTS
  Future<DataResponse<StaffMaintenanceOverview>> getStaffMaintenanceList({
    required String orgId,
    required List<MaintenanceStatus> statuses,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final safePage = page < 1 ? 1 : page;
      final safeLimit = limit < 1 ? 10 : limit;

      final from = (safePage - 1) * safeLimit;
      final to = from + safeLimit - 1;

      final statusValues = statuses.map((status) => status.dbValue).toList();

      // Fetch only matching maintenance tickets.
      final countData = await _client
          .from('maintenance_requests')
          .select('id, status')
          .eq('org_id', orgId)
          .inFilter('status', statusValues);

      final totalTickets = countData.length;

      final pendingReview = countData
          .where((item) => item['status'] == 'pending_review')
          .length;

      final activeTickets = countData.where((item) {
        final status = item['status'];
        return status == 'assigned' || status == 'in_progress';
      }).length;

      final completedTickets = countData
          .where((item) => item['status'] == 'completed')
          .length;

      // Fetch the paginated maintenance list.
      final listData = await _client
          .from('maintenance_requests')
          .select()
          .eq('org_id', orgId)
          .inFilter('status', statusValues)
          .order('created_at', ascending: false)
          .range(from, to);

      final maintenanceList = listData
          .map((json) => MaintenanceRequest.fromJson(json))
          .toList();

      return DataResponse(
        data: StaffMaintenanceOverview(
          totalTickets: totalTickets,
          pendingReview: pendingReview,
          activeTickets: activeTickets,
          completedTickets: completedTickets,
          maintenanceList: maintenanceList,
        ),
      );
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('MaintenanceRepo.getStaffMaintenanceList', e, stack),
      );
    }
  }
}
