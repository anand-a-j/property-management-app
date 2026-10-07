import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../../../../core/utils/error_log.dart';
import '../../model/lease.dart';

class LeaseRepo {
  final SupabaseClient _client = Supabase.instance.client;

  // CREATE LEASE
  Future<DataResponse<Lease>> createLease({
    required String orgId,
    required String unitId,
    required String residentId,
    required String leaseNumber,
    required DateTime startDate,
    required DateTime endDate,
    required double annualRent,
    required double securityDeposit,
    required String paymentFrequency,
    required int numberOfCheques,
    String? description,
    String status = 'draft',
  }) async {
    try {
      final data = await _client
          .from('leases')
          .insert({
            'org_id': orgId,
            'unit_id': unitId,
            'resident_id': residentId,
            'lease_number': leaseNumber,
            'start_date': startDate.toIso8601String().split('T').first,
            'end_date': endDate.toIso8601String().split('T').first,
            'annual_rent': annualRent,
            'security_deposit': securityDeposit,
            'payment_frequency': paymentFrequency,
            'number_of_cheques': numberOfCheques,
            'status': status,
            'description': description,
          })
          .select()
          .single();

      return DataResponse(data: Lease.fromJson(data));
    } catch (e, stack) {
      return DataResponse(error: errorlog("LeaseRepo.createLease", e, stack));
    }
  }

  // ASSIGN LEASE TO UNIT
  Future<DataResponse<void>> assignLeaseToUnit({
    required String leaseId,
    required String unitId,
  }) async {
    try {
      await _client
          .from('leases')
          .update({'unit_id': unitId})
          .eq('id', leaseId);

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog("LeaseRepo.assignLeaseToUnit", e, stack),
      );
    }
  }

  // GET ACTIVE LEASE
  Future<DataResponse<Lease?>> getActiveLease({
    required String orgId,
    required String unitId,
  }) async {
    try {
      final data = await _client
          .from('leases')
          .select()
          .eq('org_id', orgId)
          .eq('unit_id', unitId)
          .eq('status', 'active')
          .isFilter('deleted_at', null)
          .maybeSingle();

      if (data == null) {
        return DataResponse(data: null);
      }

      return DataResponse(data: Lease.fromJson(data));
    } catch (e, stack) {
      return DataResponse(
        error: errorlog("LeaseRepo.getActiveLease", e, stack),
      );
    }
  }

  // UPDATE LEASE
  Future<DataResponse<Lease>> updateLease({
    required String leaseId,
    String? residentId,
    String? leaseNumber,
    DateTime? startDate,
    DateTime? endDate,
    double? annualRent,
    double? securityDeposit,
    String? paymentFrequency,
    int? numberOfCheques,
    String? status,
    String? description,
  }) async {
    try {
      final updates = <String, dynamic>{};

      if (residentId != null) {
        updates['resident_id'] = residentId;
      }

      if (leaseNumber != null) {
        updates['lease_number'] = leaseNumber;
      }

      if (startDate != null) {
        updates['start_date'] = startDate.toIso8601String().split('T').first;
      }

      if (endDate != null) {
        updates['end_date'] = endDate.toIso8601String().split('T').first;
      }

      if (annualRent != null) {
        updates['annual_rent'] = annualRent;
      }

      if (securityDeposit != null) {
        updates['security_deposit'] = securityDeposit;
      }

      if (paymentFrequency != null) {
        updates['payment_frequency'] = paymentFrequency;
      }

      if (numberOfCheques != null) {
        updates['number_of_cheques'] = numberOfCheques;
      }

      if (status != null) {
        updates['status'] = status;
      }

      if (description != null) {
        updates['description'] = description;
      }

      final data = await _client
          .from('leases')
          .update(updates)
          .eq('id', leaseId)
          .select()
          .single();

      return DataResponse(data: Lease.fromJson(data));
    } catch (e, stack) {
      return DataResponse(error: errorlog("LeaseRepo.updateLease", e, stack));
    }
  }

  // GET ALL LEASES
  Future<DataResponse<List<Lease>>> getAllLeases({
    required String orgId,
    String? unitId,
    String? searchQuery,
    int page = 1,
    int limit = 15,
  }) async {
    try {
      final from = (page - 1) * limit;
      final to = from + limit - 1;

      var query = _client
          .from('leases')
          .select()
          .eq('org_id', orgId)
          .isFilter('deleted_at', null);

      if (unitId != null) {
        query = query.eq('unit_id', unitId);
      }

      if (searchQuery != null && searchQuery.trim().isNotEmpty) {
        query = query.ilike('lease_number', '%${searchQuery.trim()}%');
      }

      final data = await query
          .order('created_at', ascending: false)
          .range(from, to);

      final leases = (data as List)
          .map((json) => Lease.fromJson(json))
          .toList();

      return DataResponse(data: leases);
    } catch (e, stack) {
      return DataResponse(error: errorlog("LeaseRepo.getAllLeases", e, stack));
    }
  }
}
