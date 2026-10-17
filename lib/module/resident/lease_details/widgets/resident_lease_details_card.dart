import 'package:flutter/material.dart';
import 'package:naseem/core/core.dart';
import 'package:naseem/core/enum/lease_status.dart';
import 'package:naseem/core/widgets/status_tag.dart';

import '../../../../core/utils/string_utils.dart';
import '../../home/model/resident_lease_details.dart';

class ResidentLeaseDetailsCard extends StatefulWidget {
  const ResidentLeaseDetailsCard({
    super.key,
    required this.lease,
    this.initiallyExpanded = false,
  });

  final ResidentLeaseDetails lease;
  final bool initiallyExpanded;

  @override
  State<ResidentLeaseDetailsCard> createState() =>
      _ResidentLeaseDetailsCardState();
}

class _ResidentLeaseDetailsCardState extends State<ResidentLeaseDetailsCard>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lease = widget.lease;

    return Container(
      margin: const EdgeInsets.all(AppConsts.pSide),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConsts.rSmall),
        border: Border.all(color: context.secondary.withValues(alpha: 0.12)),
        boxShadow: [
          BoxShadow(
            color: context.secondary.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppConsts.rSmall),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _toggleExpanded,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Compact header: always visible.
                Padding(
                  padding: const EdgeInsets.all(AppConsts.pMedium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: context.primary.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(
                                AppConsts.rSmall,
                              ),
                            ),
                            child: Icon(
                              Icons.description_outlined,
                              color: context.primary,
                              size: 22,
                            ),
                          ),
                          const SizedBox(width: AppConsts.pSmall),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lease Details',
                                  style: context.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  lease.leaseNumber,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.bodySmall?.copyWith(
                                    color: context.secondary.withValues(
                                      alpha: 0.65,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: AppConsts.pSmall),
                          StatusTag(
                            status: lease.leaseStatus.label,
                            color: lease.leaseStatus.color,
                          ),
                          const SizedBox(width: 4),
                          AnimatedRotation(
                            turns: _isExpanded ? 0.5 : 0,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeInOut,
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: context.secondary,
                              size: 26,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: AppConsts.pMedium),

                      // Quick summary visible while collapsed.
                      _ResidentLeaseSummary(lease: lease),

                      AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOutCubic,
                        alignment: Alignment.topCenter,
                        child: _isExpanded
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Divider(
                                    height: AppConsts.pLarge,
                                    color: context.secondary.withValues(
                                      alpha: 0.12,
                                    ),
                                  ),
                                  ResidentLeaseDetailsContent(
                                    lease: lease,
                                    showSummary: false,
                                  ),
                                ],
                              )
                            : const SizedBox.shrink(),
                      ),

                      const SizedBox(height: AppConsts.pSmall),

                      // Expand/collapse hint.
                      Center(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: Text(
                            _isExpanded ? 'Show less' : 'View lease details',
                            key: ValueKey(_isExpanded),
                            style: context.bodySmall?.copyWith(
                              color: context.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Compact summary displayed in both collapsed and expanded states.
// -----------------------------------------------------------------------------

class _ResidentLeaseSummary extends StatelessWidget {
  const _ResidentLeaseSummary({required this.lease});

  final ResidentLeaseDetails lease;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _LeaseInfoRow(
          icon: Icons.business_outlined,
          label: 'Property / Unit',
          value: '${lease.communityName} / ${lease.unitName}',
        ),
        const SizedBox(height: AppConsts.pSmall),
        _LeaseInfoRow(
          icon: Icons.calendar_month_outlined,
          label: 'Lease Period',
          value: StrHelper.formatLeaseFromTo(lease.startDate, lease.endDate),
        ),
        const SizedBox(height: AppConsts.pSmall),
        _LeaseInfoRow(
          icon: Icons.payments_outlined,
          label: 'Annual Rent',
          value: StrHelper.formatCurrency(lease.annualRent),
        ),
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// Static lease content: reusable independently of the animated card.
// -----------------------------------------------------------------------------

class ResidentLeaseDetailsContent extends StatelessWidget {
  const ResidentLeaseDetailsContent({
    super.key,
    required this.lease,
    this.showSummary = true,
  });

  final ResidentLeaseDetails lease;

  /// Set to false when the summary is already shown by the parent card.
  final bool showSummary;

  @override
  Widget build(BuildContext context) {
    final details = <Widget>[
      _LeaseInfoRow(
        icon: Icons.event_repeat_outlined,
        label: 'Payment Frequency',
        value: lease.paymentFrequency,
      ),
      _LeaseInfoRow(
        icon: Icons.account_balance_wallet_outlined,
        label: 'Security Deposit',
        value: StrHelper.formatCurrency(lease.securityDeposit),
      ),
      _LeaseInfoRow(
        icon: Icons.receipt_long_outlined,
        label: 'Number of Cheques',
        value: lease.numberOfCheques.toString(),
      ),
      if (lease.leaseDescription?.trim().isNotEmpty ?? false)
        _LeaseInfoRow(
          icon: Icons.notes_outlined,
          label: 'Description',
          value: lease.leaseDescription!.trim(),
        ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showSummary) ...[
          _ResidentLeaseSummary(lease: lease),
          const SizedBox(height: AppConsts.pSmall),
        ],
        for (int i = 0; i < details.length; i++) ...[
          if (i > 0)
            Divider(
              height: AppConsts.pLarge,
              color: context.secondary.withValues(alpha: 0.1),
            ),
          details[i],
        ],
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// Shared responsive information row.
// -----------------------------------------------------------------------------

class _LeaseInfoRow extends StatelessWidget {
  const _LeaseInfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 19, color: context.secondary.withValues(alpha: 0.55)),
        const SizedBox(width: AppConsts.pSmall),
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: context.bodyMedium?.copyWith(
              color: context.secondary.withValues(alpha: 0.65),
            ),
          ),
        ),
        const SizedBox(width: AppConsts.pSmall),
        Expanded(
          flex: 3,
          child: Text(
            value,
            textAlign: TextAlign.end,
            softWrap: true,
            style: context.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
