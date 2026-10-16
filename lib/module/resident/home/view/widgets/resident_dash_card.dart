import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../../../core/utils/string_utils.dart';

class ResidentDashCard extends StatelessWidget {
  const ResidentDashCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data - replace with actual model data later.
    const unitName = 'Unit A-204';
    const communityName = 'Green Valley Residency';
    const startDate = '01 Jan 2026';
    const endDate = '31 Dec 2026';
    const annualRent = 360000.0;
    const paymentFrequency = 'Monthly';
    const leaseNumber = '#LES-034';

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
          // Unit & Community Details
          Row(
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
                      unitName,
                      style: context.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                 
                   
                    const SizedBox(height: 2),
                    Text(
                      communityName,
                      style: context.bodySmall?.copyWith(
                        color: context.secondary.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppConsts.pMedium),
            child: Divider(
              height: 1,
              color: context.secondary.withValues(alpha: 0.1),
            ),
          ),

          // Lease Dates
          Row(
            children: [
              Expanded(
                child: _buildDateColumn(
                  context,
                  date: startDate,
                  label: 'Start Date',
                ),
              ),
              Expanded(
                child: _buildDateColumn(
                  context,
                  date: endDate,
                  label: 'End Date',
                ),
              ),
            ],
          ),

          Divider(
            height: AppConsts.pLarge,
            color: context.secondary.withValues(alpha: 0.1),
          ),

          // Lease Information
          _buildRow(
            context,
            label: 'Annual Rent',
            value: StrHelper.formatCurrency(annualRent),
          ),
          Divider(
            height: AppConsts.pLarge,
            color: context.secondary.withValues(alpha: 0.1),
          ),
          _buildRow(
            context,
            label: 'Payment Frequency',
            value: paymentFrequency,
          ),
          Divider(
            height: AppConsts.pLarge,
            color: context.secondary.withValues(alpha: 0.1),
          ),
          _buildRow(context, label: 'Lease Number', value: leaseNumber),

          const SizedBox(height: AppConsts.pMedium),

          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: context.secondary.withValues(alpha: 0.2),
              ),
              borderRadius: BorderRadius.circular(AppConsts.rSmall),
            ),
            child: InkWell(
              onTap: () {
                // TODO: Navigate to lease details.
              },
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
