import 'package:naseem/core/api/data_response.dart' show DataResponse;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/utils/error_log.dart';
import '../../model/recent_activity.dart';

class RecentActivityRepo {
  final SupabaseClient _client = Supabase.instance.client;

  Future<DataResponse<List<RecentActivity>>> getRecentActivities({
    int limit = 30,
  }) async {
    try {
      if (limit < 1) {
        throw ArgumentError('Limit must be positive.');
      }

      final data = await _client.rpc(
        'get_recent_activities',
        params: {'p_limit': limit},
      );

      final activities = (data as List)
          .map(
            (json) => RecentActivity.fromJson(Map<String, dynamic>.from(json)),
          )
          .toList();

      return DataResponse(data: activities);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('DashboardRepo.getRecentActivities', e, stack),
      );
    }
  }
}
