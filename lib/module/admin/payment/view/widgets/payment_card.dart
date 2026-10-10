import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../../../core/enum/payment_status.dart';
import '../../../../../core/enum/payment_type.dart';
import '../../../../../core/utils/string_utils.dart';
import '../../../../../core/widgets/status_tag.dart';
import '../../model/payment.dart';


class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key,
    required this.payment,
    this.onTap,
  });

  final Payment payment;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final secondaryTextColor = context.secondary.withValues(alpha: 0.75);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: context.surface,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              // Payment Number & Status
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      payment.paymentNumber,
                      style: context.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.primary,
                        height: 1,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  const SizedBox(width: 10),

                  StatusTag(
                    status: payment.status.label,
                    color: payment.status.color,
                  ),
                ],
              ),

              // Resident Name
              Text(
                payment.lease?.resident?.name ?? '',
                style: context.bodyMedium?.copyWith(
                  color: context.secondary,
                  height: 1,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              // Unit Details
              Text(
                payment.lease?.unit?.name ?? '',
                style: context.bodyMedium?.copyWith(
                  color: secondaryTextColor,
                  height: 1,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              // Amount & Payment Method
              Text(
                '${StrHelper.formatCurrency(payment.amount)}'
                '  |  ${payment.paymentType.label}',
                style: context.bodyMedium?.copyWith(
                  color: secondaryTextColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              // Due Date
              Text(
                'Due: ${StrHelper.formatDate(payment.dueDate)}',
                style: context.bodyMedium?.copyWith(
                  color: secondaryTextColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              // Paid Date (only when available)
              if (payment.paidDate != null)
                Text(
                  'Paid: ${StrHelper.formatDate(payment.paidDate!)}',
                  style: context.bodyMedium?.copyWith(
                    color: secondaryTextColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
