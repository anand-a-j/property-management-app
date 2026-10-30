import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/api/data_response.dart';
import '../../../../../core/enum/payment_status.dart';
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
    required PaymentStatus status,
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
            'status': status.name,
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

  Future<DataResponse<void>> updatePaymentStatus({
    required String paymentId,
    required PaymentStatus currentStatus,
    required PaymentStatus newStatus,
    DateTime? paidDate,
    String? bounceReason,
  }) async {
    try {
      // Validate the transition.
      if (!currentStatus.nextStatuses().contains(newStatus)) {
        throw ArgumentError(
          'Invalid payment status transition: '
          '${currentStatus.name} → ${newStatus.name}',
        );
      }

      // Require a reason when a payment is bounced.
      if (newStatus == PaymentStatus.bounced &&
          (bounceReason == null || bounceReason.trim().isEmpty)) {
        throw ArgumentError('A reason is required when bouncing a payment.');
      }

      final updates = <String, dynamic>{
        'status': newStatus.name,
        'updated_at': DateTime.now().toUtc().toIso8601String(),
      };

      if (newStatus == PaymentStatus.paid) {
        final date = paidDate ?? DateTime.now();

        updates['paid_date'] = date.toIso8601String().split('T').first;

        // Clear any previous bounce information.
        updates['bounce_reason'] = null;
      }

      if (newStatus == PaymentStatus.bounced) {
        updates['bounce_reason'] = bounceReason!.trim();
      }

      await _client.from('payments').update(updates).eq('id', paymentId);

      return DataResponse(data: null);
    } catch (e, stack) {
      return DataResponse(
        error: errorlog('PaymentRepo.updatePaymentStatus', e, stack),
      );
    }
  }

  // GET ALL PAYMENTS
  // leaseId == null -> all organization payments
  // leaseId != null -> payments for that lease only
  Future<DataResponse<List<Payment>>> getAllPayments({
    required String orgId,
    int page = 1,
    int limit = 6,
    String? leaseId,
  }) async {
    try {
      final from = (page - 1) * limit;
      final to = from + limit - 1;

      var query = _client
          .from('payments')
          .select('''
          *,
          lease:leases!payments_lease_id_fkey (
            id,
            unit:units!leases_unit_id_fkey (
              name
            ),
            resident:profiles!leases_resident_id_fkey (
              name
            )
          )
        ''')
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

      return DataResponse<List<Payment>>(data: payments);
    } catch (e, stack) {
      return DataResponse<List<Payment>>(
        error: errorlog('PaymentRepo.getAllPayments', e, stack),
      );
    }
  }

  // UPDATE PAYMENT
  Future<DataResponse<Payment>> updatePayment({
    required String paymentId,
    required DateTime dueDate,
    required double amount,
    required PaymentType paymentType,
    String? chequeNumber,
    String? description,
  }) async {
    try {
      final data = await _client
          .from('payments')
          .update({
            'due_date': dueDate.toIso8601String().split('T').first,
            'amount': amount,
            'payment_type': paymentType.name,
            'cheque_number': chequeNumber,
            'description': description,
            'updated_at': DateTime.now().toUtc().toIso8601String(),
          })
          .eq('id', paymentId)
          .isFilter('deleted_at', null)
          .select()
          .single();

      return DataResponse<Payment>(data: Payment.fromJson(data));
    } catch (e, stack) {
      return DataResponse<Payment>(
        error: errorlog('PaymentRepo.updatePayment', e, stack),
      );
    }
  }

  Future<DataResponse<void>> deletePayment({
    required String paymentId,
    required PaymentStatus currentStatus,
  }) async {
    try {
      // Validate whether the payment can be deleted.
      if (currentStatus != PaymentStatus.pending) {
        throw ArgumentError(
          'Cannot delete a payment with status: ${currentStatus.name}. '
          'Only pending payments can be deleted.',
        );
      }

      await _client
          .from('payments')
          .update({
            'deleted_at': DateTime.now().toUtc().toIso8601String(),
            'updated_at': DateTime.now().toUtc().toIso8601String(),
          })
          .eq('id', paymentId)
          .isFilter('deleted_at', null);

      return DataResponse<void>(data: null);
    } catch (e, stack) {
      return DataResponse<void>(
        error: errorlog('PaymentRepo.deletePayment', e, stack),
      );
    }
  }
}
