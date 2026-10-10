import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../../../../core/enum/payment_type.dart';
import '../../../../../core/utils/error_log.dart';
import '../../model/payment.dart';

class PaymentRepo {
  final SupabaseClient _client = Supabase.instance.client;

  // CREATE PAYMENT
  Future<DataResponse<Payment>> createPayment({
    required String orgId,
    required String leaseId,
    required String paymentNumber,
    required DateTime dueDate,
    required double amount,
    required PaymentType paymentType,
    String? chequeNumber,
    String? description,
    String? chequeCopyPath,
  }) async {
    try {
      final data = await _client
          .from('payments')
          .insert({
            'org_id': orgId,
            'lease_id': leaseId,
            'payment_number': paymentNumber,
            'due_date': dueDate.toIso8601String().split('T').first,
            'amount': amount,
            'payment_type': paymentType.name,
            'cheque_number': chequeNumber,
            'description': description,
            'cheque_copy_path': chequeCopyPath,
          })
          .select()
          .single();

      return DataResponse(data: Payment.fromJson(data));
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('PaymentRepo.createPayment', e, stack),
      );
    }
  }

  // MARK AS PAID
  Future<DataResponse<void>> markAsPaid({
    required String orgId,
    required String paymentId,
    DateTime? paidDate,
  }) async {
    try {
      await _client
          .from('payments')
          .update({
            'status': 'paid',
            'paid_date': (paidDate ?? DateTime.now())
                .toIso8601String()
                .split('T')
                .first,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', paymentId)
          .eq('org_id', orgId)
          .isFilter('deleted_at', null);

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(error: errorlog('PaymentRepo.markAsPaid', e, stack));
    }
  }

// GET ALL PAYMENTS
  // leaseId == null -> all organization payments
  // leaseId != null -> payments for that lease only
  Future<DataResponse<List<Payment>>> getAllPayments({
    required String orgId,
    int page = 1,
    int limit = 15,
    String? leaseId,
  }) async {
    try {
      final from = (page - 1) * limit;
      final to = from + limit - 1;

      var query = _client
          .from('payments')
          .select()
          .eq('org_id', orgId)
          .isFilter('deleted_at', null);

      if (leaseId != null && leaseId.isNotEmpty) {
        query = query.eq('lease_id', leaseId);
      }

      final data = await query
          .order('due_date', ascending: false)
          .range(from, to);

      final payments = (data as List)
          .map((json) => Payment.fromJson(Map<String, dynamic>.from(json)))
          .toList();

      return DataResponse(data: payments);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('PaymentRepo.getAllPayments', e, stack),
      );
    }
  }
}
