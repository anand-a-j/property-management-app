import 'package:naseem/module/admin/lease/model/lease_movement.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../../../../core/utils/error_log.dart';

class LeaseMovementRepo {
  final SupabaseClient _client = Supabase.instance.client;

  // CREATE MOVE-IN / MOVE-OUT REQUEST
  Future<DataResponse<LeaseMovement>> createMovement({
    required String leaseId,
    required String movementType,
    required String requestedBy,
  }) async {
    try {
      final data = await _client
          .from('lease_movements')
          .insert({
            'lease_id': leaseId,
            'movement_type': movementType,
            'requested_by': requestedBy,
          })
          .select()
          .single();

      return DataResponse(data: LeaseMovement.fromJson(data));
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('LeaseMovementRepo.createMovement', e, stack),
      );
    }
  }

  // GET MOVEMENTS FOR A LEASE
  Future<DataResponse<List<LeaseMovement>>> getMovements({
    required String leaseId,
  }) async {
    try {
      final data = await _client
          .from('lease_movements')
          .select()
          .eq('lease_id', leaseId)
          .order('requested_at', ascending: true);

      final leaseMovements = (data as List).map((e)=> LeaseMovement.fromJson(e)).toList();

      return DataResponse(data:leaseMovements);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('LeaseMovementRepo.getMovements', e, stack),
      );
    }
  }

  // GET MOVEMENT BY ID
  Future<DataResponse<LeaseMovement>> getMovementById({
    required String movementId,
  }) async {
    try {
      final data = await _client
          .from('lease_movements')
          .select()
          .eq('id', movementId)
          .single();

      return DataResponse(data: LeaseMovement.fromJson(data));
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('LeaseMovementRepo.getMovementById', e, stack),
      );
    }
  }

  // MANAGER APPROVES REQUEST
  Future<DataResponse<void>> approveByManager({
    required String movementId,
    required String managerId,
  }) async {
    try {
      await _client
          .from('lease_movements')
          .update({
            'status': 'pending_security',
            'manager_reviewed_by': managerId,
            'manager_reviewed_at': DateTime.now().toUtc().toIso8601String(),
            'manager_rejection_reason': null,
          })
          .eq('id', movementId)
          .eq('status', 'pending_manager');

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('LeaseMovementRepo.approveByManager', e, stack),
      );
    }
  }

  // MANAGER REJECTS REQUEST
  Future<DataResponse<void>> rejectByManager({
    required String movementId,
    required String managerId,
    required String reason,
  }) async {
    try {
      await _client
          .from('lease_movements')
          .update({
            'status': 'manager_rejected',
            'manager_reviewed_by': managerId,
            'manager_reviewed_at': DateTime.now().toUtc().toIso8601String(),
            'manager_rejection_reason': reason,
          })
          .eq('id', movementId)
          .eq('status', 'pending_manager');

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('LeaseMovementRepo.rejectByManager', e, stack),
      );
    }
  }

  // SECURITY REJECTS REQUEST
  Future<DataResponse<void>> rejectBySecurity({
    required String movementId,
    required String securityId,
    required String reason,
  }) async {
    try {
      await _client
          .from('lease_movements')
          .update({
            'status': 'security_rejected',
            'security_reviewed_by': securityId,
            'security_reviewed_at': DateTime.now().toUtc().toIso8601String(),
            'security_rejection_reason': reason,
          })
          .eq('id', movementId)
          .eq('status', 'pending_security');

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('LeaseMovementRepo.rejectBySecurity', e, stack),
      );
    }
  }

  // SECURITY ACCEPTS REQUEST AND COMPLETES MOVEMENT
  Future<DataResponse<void>> completeBySecurity({
    required String movementId,
    required String securityId,
  }) async {
    try {
      // Fetch the movement to determine the lease and movement type.
      final movement = await _client
          .from('lease_movements')
          .select('lease_id, movement_type')
          .eq('id', movementId)
          .eq('status', 'pending_security')
          .single();

      final leaseId = movement['lease_id'] as String;
      final movementType = movement['movement_type'] as String;

      // Complete the movement.
      await _client
          .from('lease_movements')
          .update({
            'status': 'completed',
            'security_reviewed_by': securityId,
            'security_reviewed_at': DateTime.now().toUtc().toIso8601String(),
            'completed_at': DateTime.now().toUtc().toIso8601String(),
          })
          .eq('id', movementId)
          .eq('status', 'pending_security');

      // Update the lease lifecycle.
      final leaseStatus = switch (movementType) {
        'move_in' => 'active',
        'move_out' => 'terminated',
        _ => throw Exception('Invalid movement type'),
      };

      await _client
          .from('leases')
          .update({'status': leaseStatus})
          .eq('id', leaseId);

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('LeaseMovementRepo.completeBySecurity', e, stack),
      );
    }
  }
}
