import 'package:flutter/material.dart';

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
    final dateRange =
        '${_formatDate(lease.startDate)} - ${_formatDate(lease.endDate)}';

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.surface, width: 1.0),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left side placeholder
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: context.surface.withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(7),
                    bottomLeft: Radius.circular(7),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.description_outlined,
                    size: 32,
                    color: context.secondaryContainer,
                  ),
                ),
              ),
            ),

            // Right side details
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Lease number + status
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            lease.leaseNumber,
                            style: context.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        const SizedBox(width: 10),

                        StatusTag(status: "Actice", color: Colors.green),
                      ],
                    ),

                    const SizedBox(height: 5),

                    // Lease dates
                    Text(
                      dateRange,
                      style: context.bodySmall?.copyWith(
                        color: context.secondaryContainer,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 3),

                    // Rent + payment frequency
                    Text(
                      '${_formatAmount(lease.annualRent)} / year  |  ${_paymentFrequencyText(lease.paymentFrequency)}',
                      style: context.bodySmall?.copyWith(
                        color: context.secondaryContainer,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 3),

                    // Cheques
                    Text(
                      '${lease.numberOfCheques} Cheque${lease.numberOfCheques == 1 ? '' : 's'}',
                      style: context.bodySmall?.copyWith(
                        color: context.secondaryContainer,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  String _formatAmount(double amount) {
    return 'AED ${amount.toStringAsFixed(0)}';
  }

  String _paymentFrequencyText(PaymentFrequency frequency) {
    return switch (frequency) {
      PaymentFrequency.monthly => 'Monthly',
      PaymentFrequency.quarterly => 'Quarterly',
      PaymentFrequency.semiAnnual => 'Semi Annual',
      PaymentFrequency.annual => 'Annual',
    };
  }
}
