import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../../../../core/utils/error_log.dart';
import '../../model/community.dart';

class CommunityRepo {
  final SupabaseClient _client = Supabase.instance.client;

  Future<DataResponse<List<Community>>> getCommunities({
    required String orgId,
  }) async {
    try {
      final data = await _client
          .from('communities_with_unit_counts')
          .select()
          .eq('org_id', orgId)
          .order('created_at', ascending: false)
          .limit(15);

      final communities = (data as List)
          .map((json) => Community.fromJson(json as Map<String, dynamic>))
          .toList();

      return DataResponse(data: communities);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog("CommunityRepo.getCommunities", e, stack),
      );
    }
  }

  Future<DataResponse<Community>> createCommunity({
    required String orgId,
    required String developmentType,
    required String communityType,
    required String name,
    required String address,
    required String description,
  }) async {
    try {
      final data = await _client
          .from('communities')
          .insert({
            'org_id': orgId,
            'development_type': developmentType,
            'community_type': communityType,
            'name': name,
            'address': address,
            'description': description,
          })
          .select()
          .single();

      return DataResponse(data: Community.fromJson(data));
    } catch (e, stack) {
      return DataResponse(
        error: errorlog("CommunityRepo.createCommunity", e, stack),
      );
    }
  }

  Future<DataResponse<Community>> updateCommunity({
    required String id,
    required String developmentType,
    required String communityType,
    required String name,
    required String address,
    required String description,
  }) async {
    try {
      final data = await _client
          .from('communities')
          .update({
            'development_type': developmentType,
            'community_type': communityType,
            'name': name,
            'address': address,
            'description': description,
            'updated_at': DateTime.now().toUtc().toIso8601String(),
          })
          .eq('id', id)
          .select()
          .single();

      return DataResponse(data: Community.fromJson(data));
    } catch (e, stack) {
      return DataResponse(
        error: errorlog("CommunityRepo.updateCommunity", e, stack),
      );
    }
  }

  Future<DataResponse<bool>> deleteCommunity({required String id}) async {
    try {
      await _client
          .from('communities')
          .update({
            'deleted_at': DateTime.now().toUtc().toIso8601String(),
            'updated_at': DateTime.now().toUtc().toIso8601String(),
          })
          .eq('id', id)
          .isFilter('deleted_at', null)
          .select()
          .single();

      return DataResponse(data: true);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('CommunityRepo.deleteCommunity', e, stack),
      );
    }
  }
}
