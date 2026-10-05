import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../../../../core/utils/error_log.dart';
import '../../model/unit.dart';

class UnitRepo {
  final SupabaseClient _client = Supabase.instance.client;

  Future<DataResponse<List<Unit>>> getUnits({
    required String communityId,
    int page = 1,
    int limit = 15,
    String? searchQuery,
  }) async {
    try {
      final from = (page - 1) * limit;
      final to = from + limit - 1;

      var query = _client
          .from('units')
          .select()
          .eq('community_id', communityId)
          .isFilter('deleted_at', null);

      if (searchQuery != null && searchQuery.trim().isNotEmpty) {
        query = query.ilike('name', '%${searchQuery.trim()}%');
      }

      final data = await query
          .order('created_at', ascending: false)
          .range(from, to);

      final units = (data as List).map((json) => Unit.fromJson(json)).toList();

      return DataResponse(data: units);
    } catch (e, stack) {
      return DataResponse(error: errorlog("UnitRepo.getUnits", e, stack));
    }
  }

  Future<DataResponse<Unit>> getUnit({
    required String unitId,
    required String communityId,
  }) async {
    try {
      final data = await _client
          .from('units')
          .select()
          .eq('id', unitId)
          .eq('community_id', communityId)
          .isFilter('deleted_at', null)
          .single();

      return DataResponse(data: Unit.fromJson(data));
    } catch (e, stack) {
      return DataResponse(error: errorlog("UnitRepo.getUnit", e, stack));
    }
  }

  Future<DataResponse<Unit>> createUnit({
    required String communityId,
    required String name,
    required String area,
    required String description,
  }) async {
    try {
      final data = await _client
          .from('units')
          .insert({
            'community_id': communityId,
            'name': name,
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
    required String area,
    required String description,
  }) async {
    try {
      final data = await _client
          .from('units')
          .update({'name': name, 'area': area, 'description': description})
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
