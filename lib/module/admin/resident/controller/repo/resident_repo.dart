import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../../../../core/utils/error_log.dart';
import '../../model/resident_list_response.dart';

class ResidentRepo {
  final SupabaseClient _client = Supabase.instance.client;

  Future<DataResponse<List<ResidentListResponse>>> fetchResidents({
    required String orgId,
    String? searchQuery,
    bool isSelectionMode = false,
    int page = 1,
    int limit = 6,
  }) async {
    try {
      if (page < 1 || limit < 1) {
        return DataResponse(error: 'Page and limit must be greater than zero.');
      }

      final normalizedOrgId = orgId.trim();

      if (normalizedOrgId.isEmpty) {
        return DataResponse(error: 'Organization ID is required.');
      }

      final from = (page - 1) * limit;
      final to = from + limit - 1;

      final normalizedSearch = searchQuery?.trim();

      final baseQuery = _client
          .from('resident_list_view')
          .select()
          .eq('org_id', normalizedOrgId);

      final filteredQuery =
          normalizedSearch != null && normalizedSearch.isNotEmpty
          ? baseQuery.ilike('resident_name', '%$normalizedSearch%')
          : baseQuery;

      final data = isSelectionMode
          ? await filteredQuery
                .order('resident_status_priority', ascending: true)
                .order('resident_created_at', ascending: false)
                .range(from, to)
          : await filteredQuery
                .order('resident_created_at', ascending: false)
                .range(from, to);

      final residents = data
          .map(
            (json) =>
                ResidentListResponse.fromJson(Map<String, dynamic>.from(json)),
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
