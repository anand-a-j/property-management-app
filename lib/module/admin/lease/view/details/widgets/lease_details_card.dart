import 'package:flutter/material.dart';
import 'package:naseem/core/enum/payment_frequency.dart';
import 'package:naseem/core/utils/string_utils.dart';
import 'package:naseem/module/admin/community/model/community.dart';
import 'package:naseem/module/admin/lease/model/lease.dart';
import 'package:naseem/module/admin/unit/model/unit.dart';

import '../../../../../../core/core.dart';

class LeaseDetailsCard extends StatelessWidget {
  const LeaseDetailsCard({
    super.key,
    required this.lease,
    required this.unit,
    required this.community,
  });

  final Lease lease;
  final Unit unit;
  final Community community;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppConsts.pSide),
      padding: const EdgeInsets.all(AppConsts.pMedium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConsts.rSmall),
        border: Border.all(color: context.surface),
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
          _buildRow(
            context,
            icon: Icons.person_outline,
            label: 'Resident',
            value: lease.resident?.name ?? "",
          ),
          Divider(
            height: AppConsts.pLarge,
            color: context.secondary.withValues(alpha: 0.1),
          ),
          _buildRow(
            context,
            icon: Icons.business_outlined,
            label: 'Unit',
            value: "${unit.name}, ${community.name}",
          ),
          Divider(
            height: AppConsts.pLarge,
            color: context.secondary.withValues(alpha: 0.1),
          ),
          _buildRow(
            context,
            icon: Icons.calendar_today_outlined,
            label: 'Lease Period',
            value: StrHelper.formatLeaseFromTo(lease.startDate, lease.endDate),
          ),
          Divider(
            height: AppConsts.pLarge,
            color: context.secondary.withValues(alpha: 0.1),
          ),
          _buildRow(
            context,
            icon: Icons.monetization_on_outlined,
            label: 'Annual Rent',
            value: StrHelper.formatCurrency(lease.annualRent),
          ),
          Divider(
            height: AppConsts.pLarge,
            color: context.secondary.withValues(alpha: 0.1),
          ),
          _buildRow(
            context,
            icon: Icons.list_alt,
            label: 'Payment Frequency',
            value: lease.paymentFrequency.label,
          ),
          Divider(
            height: AppConsts.pLarge,
            color: context.secondary.withValues(alpha: 0.1),
          ),
          _buildRow(
            context,
            icon: Icons.credit_card,
            label: 'Number of Cheques',
            value: lease.numberOfCheques.toString(),
          ),
          Divider(
            height: AppConsts.pLarge,
            color: context.secondary.withValues(alpha: 0.1),
          ),
          _buildRow(
            context,
            icon: Icons.security,
            label: 'Security Deposit',
            value: StrHelper.formatCurrency(lease.securityDeposit),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    IconData? valueIcon,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: context.secondary.withValues(alpha: 0.5)),
        const SizedBox(width: AppConsts.pSmall),
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: context.bodyMedium?.copyWith(
              color: context.secondary.withValues(alpha: 0.5),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (valueIcon != null) ...[
                Icon(valueIcon, size: 18, color: context.primary),
                const SizedBox(width: AppConsts.pMicro),
              ],
              Expanded(
                child: Text(
                  value,
                  style: context.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
