import 'package:naseem/core/utils/error_log.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../model/dashboard_stats.dart';

class DashboardStatsRepo {
  final SupabaseClient _supabase;

  DashboardStatsRepo({SupabaseClient? supabase})
    : _supabase = supabase ?? Supabase.instance.client;

  Future<DataResponse<DashboardStats>> fetchDashboardStats({
    required String orgId,
  }) async {
    try {
      final response = await _supabase
          .from('organization_dashboard_stats')
          .select()
          .eq('org_id', orgId)
          .maybeSingle();

      if (response == null) {
        return DataResponse(data: const DashboardStats());
      }

      final stats = DashboardStats(
        totalUnits: (response['total_units'] as num).toInt(),

        occupied: (response['occupied_units'] as num).toInt(),

        vacant: (response['vacant_units'] as num).toInt(),

        maintenance: (response['active_maintenance_requests'] as num).toInt(),

        rentCollected: (response['rent_collected'] as num).round(),

        overdueCount: (response['overdue_count'] as num).toInt(),

        rentDueTotal: (response['rent_due_total'] as num).toDouble(),
      );

      return DataResponse(data: stats);
    } catch (e, s) {
      errorlog(e.toString(), s);
      return DataResponse(error: e.toString());
    }
  }
}
