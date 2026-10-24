import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../../core/enum/payment_status.dart';
import '../../controller/bloc/payment_bloc.dart';
import '../../model/payment.dart';
import 'payment_status_update_bottom_sheet.dart';

void showPaymentStatusUpdateDialog(BuildContext context, Payment payment) {
  final nextStatuses = payment.status.nextStatuses();

  if (nextStatuses.isEmpty) return;

  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConsts.rMedium),
        ),
        backgroundColor: Colors.white,
        child: PaymentStatusUpdateBottomSheet(
          currentStatus: payment.status,
          statuses: nextStatuses,
          isLoading: false,
          onSubmit: ({required status, paidDate, bounceReason}) async {
            context.read<PaymentBloc>().add(
              UpdatePaymentStatusEvent(
                paymentId: payment.id,
                currentStatus: payment.status,
                newStatus: status,
                paidDate: paidDate,
                bounceReason: bounceReason,
              ),
            );
          },
        ),
      );
    },
  );
}
