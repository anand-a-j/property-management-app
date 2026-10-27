import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../../../../core/utils/error_log.dart';
import '../../model/unit.dart';
import '../../model/unit_list_item.dart';

class UnitRepo {
  final SupabaseClient _client = Supabase.instance.client;

  Future<DataResponse<List<UnitListItem>>> getUnits({
    required String communityId,
    int page = 1,
    int limit = 6,
    String? searchQuery,
  }) async {
    try {
      if (page < 1 || limit < 1) {
        throw ArgumentError('Page and limit must be positive.');
      }

      final from = (page - 1) * limit;
      final to = from + limit - 1;

      var query = _client
          .from('unit_list_view')
          .select()
          .eq('community_id', communityId);

      final search = searchQuery?.trim();

      if (search != null && search.isNotEmpty) {
        query = query.ilike('name', '%$search%');
      }

      final data = await query
          .order('created_at', ascending: false)
          .order('id', ascending: false)
          .range(from, to);

      final units = (data as List)
          .map((json) => UnitListItem.fromJson(Map<String, dynamic>.from(json)))
          .toList();

      return DataResponse(data: units);
    } catch (e, stack) {
      return DataResponse(error: errorlog('UnitRepo.getUnits', e, stack));
    }
  }

  Future<DataResponse<Unit>> createUnit({
    required String communityId,
    required String name,
    required String unitType,
    required String area,
    required String description,
  }) async {
    try {
      final data = await _client
          .from('units')
          .insert({
            'community_id': communityId,
            'name': name,
            'unit_type': unitType,
            'area': area,
            'description': description,
          })
          .select()
          .single();

      return DataResponse(data: Unit.fromJson(data));
    } catch (e, stack) {
      return DataResponse(error: errorlog("UnitRepo.createUnit", e, stack));
    }
  }

  Future<DataResponse<Unit>> updateUnit({
    required String unitId,
    required String communityId,
    required String name,
    required String unitType,
    required String area,
    required String description,
  }) async {
    try {
      final data = await _client
          .from('units')
          .update({
            'name': name,
            'unit_type': unitType,
            'area': area,
            'description': description,
          })
          .eq('id', unitId)
          .eq('community_id', communityId)
          .isFilter('deleted_at', null)
          .select()
          .single();

      return DataResponse(data: Unit.fromJson(data));
    } catch (e, stack) {
      return DataResponse(error: errorlog("UnitRepo.updateUnit", e, stack));
    }
  }

  Future<DataResponse<void>> deleteUnit({
    required String unitId,
    required String communityId,
  }) async {
    try {
      await _client
          .from('units')
          .update({'deleted_at': DateTime.now().toIso8601String()})
          .eq('id', unitId)
          .eq('community_id', communityId)
          .isFilter('deleted_at', null);

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(error: errorlog("UnitRepo.deleteUnit", e, stack));
    }
  }
}
