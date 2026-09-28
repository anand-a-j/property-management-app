import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/api/data_response.dart';
import '../../../../core/utils/error_log.dart';
import '../../../auth/core/model/profile.dart';
import '../../model/manager_response.dart';


class ManagerRepo {
  final SupabaseClient _client = Supabase.instance.client;

  Future<DataResponse<ManagerResponse>> fetchManagers() async {
    try {
      final managersData = await _client
          .from('profiles')
          .select()
          .eq('role', 'manager')
          .isFilter('deleted_at', null)
          .order('created_at', ascending: false)
          .limit(15);

      final totalManagersData = await _client
          .from('profiles')
          .select('id')
          .eq('role', 'manager')
          .isFilter('deleted_at', null)
          .count(CountOption.exact);

      final activeUsersData = await _client
          .from('profiles')
          .select('id')
          .isFilter('deleted_at', null)
          .count(CountOption.exact);

      final totalUsersData = await _client
          .from('profiles')
          .select('id')
          .count(CountOption.exact);

      final managers = (managersData as List)
          .map((json) => Profile.fromJson(Map<String, dynamic>.from(json)))
          .toList();

      return DataResponse(
        data: ManagerResponse(
          managers: managers,
          totalManagers: totalManagersData.count,
          activeUsers: activeUsersData.count,
          totalUsers: totalUsersData.count,
        ),
      );
    } catch (e, stack) {
      return DataResponse(
        error: errorlog("ManagerRepo.fetchManagers", e, stack),
      );
    }
  }
}
