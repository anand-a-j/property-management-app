import 'dart:developer';

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
      final communityIds = await _getCommunityIds(orgId);

      if (communityIds.isEmpty) {
        return DataResponse(data: const DashboardStats());
      }

      final results = await Future.wait([
        // 1. Active units belonging to the organization
        _supabase
            .from('units')
            .select('id, status')
            .isFilter('deleted_at', null)
            .inFilter('community_id', communityIds),

        // 2. Active maintenance requests
        _supabase
            .from('maintenance_requests')
            .select('id')
            .eq('org_id', orgId)
            .inFilter('status', [
              'pending_review',
              'approved',
              'assigned',
              'in_progress',
            ]),

        // 3. Payments belonging to leases for this organization's units
        _supabase
            .from('payments')
            .select(
              'amount, status, due_date, '
              'leases!inner(unit_id, units!inner(community_id))',
            )
            .isFilter('deleted_at', null)
            .inFilter('leases.units.community_id', communityIds),
      ]);

      final units = List<Map<String, dynamic>>.from(results[0] as List);

      final maintenance = List<Map<String, dynamic>>.from(results[1] as List);

      final payments = List<Map<String, dynamic>>.from(results[2] as List);

      final stats = DashboardStats(
        totalUnits: units.length,
        occupied: units.where((u) => u['status'] == 'occupied').length,
        vacant: units.where((u) => u['status'] == 'vacant').length,
        maintenance: maintenance.length,
        rentCollected: payments
            .where((p) => p['status'] == 'paid')
            .fold<int>(0, (sum, p) => sum + (p['amount'] as num).round()),
        overdueCount: payments.where((p) => p['status'] == 'overdue').length,
        rentDueTotal: payments
            .where((p) => p['status'] == 'pending' || p['status'] == 'overdue')
            .fold<double>(
              0.0,
              (sum, p) => sum + (p['amount'] as num).toDouble(),
            ),
      );

      return DataResponse(data: stats);
    } catch (e, s) {
      errorlog(e.toString(), s);
      return DataResponse(error: e.toString());
    }
  }

  Future<List<String>> _getCommunityIds(String orgId) async {
    final response = await _supabase
        .from('communities')
        .select('id')
        .eq('org_id', orgId);

    log("log community response : ${response.toString()}");
    return List<Map<String, dynamic>>.from(
      response,
    ).map((community) => community['id'] as String).toList();
  }
}
