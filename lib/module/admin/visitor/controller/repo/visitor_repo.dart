import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../../../../core/utils/error_log.dart';
import '../../model/create_visitor.dart';
import '../../model/visitor.dart';

class VisitorRepo {
  final SupabaseClient _client = Supabase.instance.client;

 // CREATE VISITOR
  Future<DataResponse<void>> createVisitor({
    required CreateVisitor visitor,
  }) async {
    try {
      await _client.from('visitor').insert(visitor);

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('VisitorRepo.createVisitor', e, stack),
      );
    }
  }

  // GET VISITORS
  Future<DataResponse<List<Visitor>>> getVisitors({
    required String orgId,
    String? unitId,
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      var query = _client.from('visitor').select().eq('org_id', orgId);

      if (unitId != null) {
        query = query.eq('unit_id', unitId);
      }

      final data = await query
          .order('created_at', ascending: false)
          .range(offset, offset + limit - 1);

      final visitors = (data as List)
          .map((json) => Visitor.fromJson(Map<String, dynamic>.from(json)))
          .toList();

      return DataResponse(data: visitors);
    } catch (e, stack) {
      return DataResponse(error: errorlog('VisitorRepo.getVisitors', e, stack));
    }
  }
}
