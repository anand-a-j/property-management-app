import 'package:flutter/material.dart';
import 'package:naseem/core/utils/string_utils.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/enum/lease_status.dart';
import '../../../../../../core/enum/payment_frequency.dart';
import '../../../../../../core/widgets/status_tag.dart';
import '../../../model/lease.dart';

class LeaseCard extends StatelessWidget {
  const LeaseCard({super.key, required this.lease});

  final Lease lease;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.surface, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    lease.leaseNumber,
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
                  status: lease.status.label,
                  color: lease.status.color,
                ),
              ],
            ),

            Text(
              lease.resident?.name ?? "",
              style: context.bodyMedium?.copyWith(
                color: context.secondary,
                height: 1,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            Text(
              StrHelper.formatLeaseFromTo(lease.startDate, lease.endDate),
              style: context.bodyMedium?.copyWith(
                color: context.secondary.withValues(alpha: 0.75),
                height: 1,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            Text(
              '${StrHelper.formatCurrency(lease.annualRent)}  |  ${lease.paymentFrequency.label}',
              style: context.bodyMedium?.copyWith(
                color: context.secondary.withValues(alpha: 0.75),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            Text(
              '${lease.numberOfCheques} Cheque${lease.numberOfCheques == 1 ? '' : 's'}',
              style: context.bodyMedium?.copyWith(
                color: context.secondary.withValues(alpha: 0.75),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
