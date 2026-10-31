import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../../../../core/utils/error_log.dart';
import '../../model/add_maintenance.dart';
import '../../model/maintenance_request.dart';

class MaintenanceRepo {
  final SupabaseClient _client = Supabase.instance.client;

  // ADD MAINTENANCE REQUEST

  Future<DataResponse<void>> addMaintenance({
    required AddMaintenance maintenance,
  }) async {
    try {
      await _client.from('maintenance_requests').insert(maintenance.toJson());

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('MaintenanceRepo.addMaintenance', e, stack),
      );
    }
  }

  // GET MAINTENANCE LIST
  Future<DataResponse<List<MaintenanceRequest>>> getMaintenanceList({
    required String orgId,
    String? unitId,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final from = (page - 1) * limit;
      final to = from + limit - 1;

      var query = _client
          .from('maintenance_requests')
          .select()
          .eq('org_id', orgId);

      if (unitId != null) {
        query = query.eq('unit_id', unitId);
      }

      final data = await query
          .order('created_at', ascending: false)
          .range(from, to);

      final maintenanceList = data
          .map((json) => MaintenanceRequest.fromJson(json))
          .toList();

      return DataResponse(data: maintenanceList);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('MaintenanceRepo.getMaintenanceList', e, stack),
      );
    }
  }

  Future<DataResponse<void>> updateMaintenanceStatus({
    required String requestId,
    required String status,
    required String updatedBy,
    String? note,
    String? assignedTo,
    String? rejectionReason,
  }) async {
    try {
      const allowedStatuses = {
        'pending_review',
        'rejected',
        'approved',
        'in_progress',
        'completed',
        'closed',
        'cancelled',
      };

      // Only progress updates are written to maintenance_updates.
      const historyStatuses = {'in_progress', 'completed'};

      if (!allowedStatuses.contains(status)) {
        throw ArgumentError('Invalid maintenance status: $status');
      }

      if (status == 'rejected' &&
          (rejectionReason == null || rejectionReason.trim().isEmpty)) {
        throw ArgumentError(
          'Rejection reason is required when rejecting a request.',
        );
      }

      // Validate an explicitly provided assignee.
      if (assignedTo != null && assignedTo.trim().isEmpty) {
        throw ArgumentError('Assignee cannot be empty.');
      }

      if (historyStatuses.contains(status) &&
          (note == null || note.trim().isEmpty)) {
        throw ArgumentError(
          'A note is required for maintenance progress updates.',
        );
      }

      final now = DateTime.now().toUtc().toIso8601String();

      final Map<String, dynamic> updates = {
        'status': status,
        'updated_at': now,
      };

      // Review information
      if (status == 'approved' || status == 'rejected') {
        updates['reviewed_by'] = updatedBy;
        updates['reviewed_at'] = now;
      }

      // Approval information
      if (status == 'approved') {
        updates['approved_at'] = now;
      }

      // Rejection information
      if (status == 'rejected') {
        updates['rejection_reason'] = rejectionReason!.trim();
      }

      // Assignment information
      // Only update when a staff member is explicitly selected.
      // Otherwise, preserve the existing assignment.
      if (status == 'approved' && assignedTo != null) {
        updates['assigned_to'] = assignedTo;
      }

      // Completion information
      if (status == 'completed') {
        updates['completed_at'] = now;
      }

      // Closure information
      if (status == 'closed') {
        updates['closed_at'] = now;
      }

      // Update the main request.
      final updatedRequest = await _client
          .from('maintenance_requests')
          .update(updates)
          .eq('id', requestId)
          .select('id')
          .maybeSingle();

      if (updatedRequest == null) {
        throw Exception('Maintenance request not found.');
      }

      // Record progress history only for supported history statuses.
      if (historyStatuses.contains(status)) {
        await _client.from('maintenance_updates').insert({
          'maintenance_request_id': requestId,
          'updated_by': updatedBy,
          'status': status,
          'note': note!.trim(),
        });
      }

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('MaintenanceRepo.updateMaintenanceStatus', e, stack),
      );
    }
  }
}
