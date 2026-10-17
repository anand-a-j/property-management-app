import 'package:flutter/material.dart';
import 'package:naseem/core/enum/lease_status.dart';
import 'package:naseem/module/resident/home/model/resident_lease_details.dart';

import '../../../../../core/core.dart';
import '../../../../../core/utils/string_utils.dart';
import '../../../../../core/widgets/status_tag.dart';

class ResidentDashCard extends StatelessWidget {
  const ResidentDashCard({super.key, this.onTap, required this.leaseDetails});

  final ResidentLeaseDetails leaseDetails;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final lease = leaseDetails;

    return Container(
      margin: const EdgeInsets.all(AppConsts.pSide),
      padding: const EdgeInsets.all(AppConsts.pMedium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConsts.rSmall),
        border: Border.all(color: context.secondary.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(
            color: context.secondary.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Unit and community details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: context.secondary.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(AppConsts.rSmall),
                      ),
                      child: Icon(
                        Icons.business_outlined,
                        color: context.secondary.withValues(alpha: 0.6),
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: AppConsts.pMedium),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lease.unitName,
                            style: context.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            lease.communityName,
                            style: context.bodySmall?.copyWith(
                              color: context.secondary.withValues(alpha: 0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              StatusTag(
                status: lease.leaseStatus.label,
                color: lease.leaseStatus.color,
              ),
            ],
          ),

          const SizedBox(height: AppConsts.pMedium),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppConsts.pMedium),
            child: Divider(
              height: 1,
              color: context.secondary.withValues(alpha: 0.1),
            ),
          ),

          // Lease dates
          Row(
            children: [
              Expanded(
                child: _buildDateColumn(
                  context,
                  date: StrHelper.formatDate(lease.startDate),
                  label: 'Start Date',
                ),
              ),
              Expanded(
                child: _buildDateColumn(
                  context,
                  date: StrHelper.formatDate(lease.endDate),
                  label: 'End Date',
                ),
              ),
            ],
          ),

          Divider(
            height: AppConsts.pLarge,
            color: context.secondary.withValues(alpha: 0.1),
          ),

          // Lease information
          _buildRow(
            context,
            label: 'Annual Rent',
            value: StrHelper.formatCurrency(lease.annualRent),
          ),

          Divider(
            height: AppConsts.pLarge,
            color: context.secondary.withValues(alpha: 0.1),
          ),

          _buildRow(
            context,
            label: 'Payment Frequency',
            value: lease.paymentFrequency,
          ),

          Divider(
            height: AppConsts.pLarge,
            color: context.secondary.withValues(alpha: 0.1),
          ),

          _buildRow(
            context,
            label: 'Number of Cheques',
            value: lease.numberOfCheques.toString(),
          ),

          Divider(
            height: AppConsts.pLarge,
            color: context.secondary.withValues(alpha: 0.1),
          ),

          _buildRow(context, label: 'Lease Number', value: lease.leaseNumber),

          const SizedBox(height: AppConsts.pMedium),

          // View details
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: context.secondary.withValues(alpha: 0.2),
              ),
              borderRadius: BorderRadius.circular(AppConsts.rSmall),
            ),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(AppConsts.rSmall),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Center(
                  child: Text(
                    'View Details',
                    style: context.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.secondary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateColumn(
    BuildContext context, {
    required String date,
    required String label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: context.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: context.bodySmall?.copyWith(
            color: context.secondary.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }

  Widget _buildRow(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: context.bodyMedium?.copyWith(
              color: context.secondary.withValues(alpha: 0.5),
            ),
          ),
        ),
        const SizedBox(width: AppConsts.pSmall),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: context.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
