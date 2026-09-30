import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../../../core/widgets/status_tag.dart';

class PaymentCard extends StatelessWidget {
  final String paymentId;
  final String residentName;
  final String unitDetails;
  final String amount;
  final String paymentMethod;
  final String category;
  final String date;
  final String status;
  final VoidCallback? onTap;

  const PaymentCard({
    super.key,
    required this.paymentId,
    required this.residentName,
    required this.unitDetails,
    required this.amount,
    required this.paymentMethod,
    required this.category,
    required this.date,
    this.status = 'PAID',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15), // pMedium
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // rSmall
          border: Border.all(color: context.surface, width: 1.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top Row: Payment ID & Status Badge
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  paymentId,
                  style: context.bodyMedium?.copyWith(
                    color: context.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                StatusTag(color: Colors.green, status: "Paid"),
              ],
            ),
            const SizedBox(height: 5),

            Text(
              residentName,
              style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 2),

            Text(
              unitDetails,
              style: context.bodySmall?.copyWith(
                color: context.secondaryContainer,
              ),
            ),
            const SizedBox(height: 8),

            Row(
              children: [
                Text(
                  amount,
                  style: context.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  '($paymentMethod)',
                  style: context.bodyMedium?.copyWith(
                    color: context.secondaryContainer,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Bottom Row: Category & Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category,
                  style: context.bodySmall?.copyWith(
                    color: context.secondaryContainer,
                  ),
                ),
                Text(
                  date,
                  style: context.bodySmall?.copyWith(
                    color: context.secondaryContainer,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
