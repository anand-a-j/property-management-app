import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../../../../core/enum/visitor_status.dart';
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
    String? residentId,
    int limit = 6,
    int offset = 0,
  }) async {
    try {
      var query = _client.from('visitor').select().eq('org_id', orgId);

      if (unitId != null) {
        query = query.eq('unit_id', unitId);
      }

      if (residentId != null) {
        query = query.eq('resident_id', residentId);
      }

      final data = await query
          .order('created_at', ascending: false)
          .order('id', ascending: false)
          .range(offset, offset + limit - 1);

      final visitors = (data as List)
          .map(
            (json) => Visitor.fromJson(Map<String, dynamic>.from(json as Map)),
          )
          .toList();

      return DataResponse(data: visitors);
    } catch (e, stack) {
      return DataResponse(error: errorlog('VisitorRepo.getVisitors', e, stack));
    }
  }

  // UPDATE VISITOR STATUS
  Future<DataResponse<void>> updateVisitorStatus({
    required String id,
    required VisitorStatus status,
  }) async {
    try {
      final now = DateTime.now().toUtc().toIso8601String();

      final updates = <String, dynamic>{
        'status': status.dbValue,
        'updated_at': now,
      };

      switch (status.dbValue) {
        case 'checked_in':
          updates['checked_in_at'] = now;
          break;

        case 'checked_out':
          updates['checked_out_at'] = now;
          break;
      }

      await _client.from('visitor').update(updates).eq('id', id);

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('VisitorRepo.updateVisitorStatus', e, stack),
      );
    }
  }

  Future<DataResponse<void>> updateVisitor({
    required String id,
    required String name,
    String? phone,
    DateTime? visitStartAt,
    DateTime? visitEndAt,
    required String visitType,
    String? purpose,
    required bool parkingRequired,
    String? unitId,
    String? residentId,
    String? leaseId,
  }) async {
    try {
      if (name.trim().isEmpty) {
        throw ArgumentError('Visitor name is required.');
      }

      if (visitType.trim().isEmpty) {
        throw ArgumentError('Visit type is required.');
      }

      if (visitStartAt != null &&
          visitEndAt != null &&
          !visitEndAt.isAfter(visitStartAt)) {
        throw ArgumentError('Visit end time must be after the start time.');
      }

      final now = DateTime.now().toUtc().toIso8601String();

      final updates = <String, dynamic>{
        'name': name.trim(),
        'phone': _nullableTrim(phone),
        'visit_start_at': visitStartAt?.toUtc().toIso8601String(),
        'visit_end_at': visitEndAt?.toUtc().toIso8601String(),
        'visit_type': visitType.trim(),
        'purpose': _nullableTrim(purpose),
        'parking_required': parkingRequired,
        'unit_id': unitId,
        'resident_id': residentId,
        'lease_id': leaseId,
        'updated_at': now,
      };

      final result = await _client
          .from('visitor')
          .update(updates)
          .eq('id', id)
          .select('id');

      if (result.isEmpty) {
        return DataResponse(
          error: 'Visitor not found or could not be updated.',
        );
      }

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('VisitorRepo.updateVisitor', e, stack),
      );
    }
  }

  /// Converts null, empty, or whitespace-only strings to null.
  String? _nullableTrim(String? value) {
    final trimmed = value?.trim();
    return (trimmed == null || trimmed.isEmpty) ? null : trimmed;
  }

  Future<DataResponse<void>> deleteVisitor({required String id}) async {
    try {
      final result = await _client
          .from('visitor')
          .delete()
          .eq('id', id)
          .select('id');

      if (result.isEmpty) {
        return DataResponse(
          error: 'Visitor not found or could not be deleted.',
        );
      }

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('VisitorRepo.deleteVisitor', e, stack),
      );
    }
  }
}
