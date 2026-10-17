import 'package:flutter/material.dart';
import 'package:naseem/core/enum/payment_frequency.dart';
import 'package:naseem/core/utils/string_utils.dart';
import 'package:naseem/module/admin/community/model/community.dart';
import 'package:naseem/module/admin/lease/model/lease.dart';
import 'package:naseem/module/admin/unit/model/unit.dart';

import '../../../../../../core/core.dart';

class LeaseDetailsCard extends StatefulWidget {
  const LeaseDetailsCard({
    super.key,
    required this.lease,
    required this.unit,
    required this.community,
    this.initiallyExpanded = false,
  });

  final Lease lease;
  final Unit unit;
  final Community community;
  final bool initiallyExpanded;

  @override
  State<LeaseDetailsCard> createState() => _LeaseDetailsCardState();
}

class _LeaseDetailsCardState extends State<LeaseDetailsCard> {
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
    return Container(
      margin: const EdgeInsets.all(AppConsts.pSide),
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppConsts.rSmall),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _toggleExpanded,
            child: Padding(
              padding: const EdgeInsets.all(AppConsts.pMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  LeaseDetailsContent(
                    lease: widget.lease,
                    unit: widget.unit,
                    community: widget.community,
                    showAdditionalDetails: false,
                  ),

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
                                color: context.secondary.withValues(alpha: 0.1),
                              ),
                              LeaseDetailsContent(
                                lease: widget.lease,
                                unit: widget.unit,
                                community: widget.community,
                                showSummaryDetails: false,
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),

                  const SizedBox(height: AppConsts.pSmall),

                  Center(
                    child: AnimatedRotation(
                      turns: _isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      child: Icon(
                        Icons.arrow_downward_outlined,
                        color: context.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Static lease details content
// -----------------------------------------------------------------------------

class LeaseDetailsContent extends StatelessWidget {
  const LeaseDetailsContent({
    super.key,
    required this.lease,
    required this.unit,
    required this.community,
    this.showAdditionalDetails = true,
    this.showSummaryDetails = true,
  });

  final Lease lease;
  final Unit unit;
  final Community community;

  /// Controls whether payment frequency, cheque count and deposit are shown.
  final bool showAdditionalDetails;

  /// Controls whether resident, unit, period and rent are shown.
  final bool showSummaryDetails;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];

    if (showSummaryDetails) {
      rows.addAll([
        _buildRow(
          context,
          icon: Icons.person_outline,
          label: 'Resident',
          value: lease.resident?.name ?? '',
        ),
        _divider(context),
        _buildRow(
          context,
          icon: Icons.business_outlined,
          label: 'Unit',
          value: '${unit.name}, ${community.name}',
        ),
        _divider(context),
        _buildRow(
          context,
          icon: Icons.calendar_today_outlined,
          label: 'Lease Period',
          value: StrHelper.formatLeaseFromTo(lease.startDate, lease.endDate),
        ),
        _divider(context),
        _buildRow(
          context,
          icon: Icons.monetization_on_outlined,
          label: 'Annual Rent',
          value: StrHelper.formatCurrency(lease.annualRent),
        ),
      ]);
    }

    if (showAdditionalDetails) {
      if (rows.isNotEmpty) rows.add(_divider(context));

      rows.addAll([
        _buildRow(
          context,
          icon: Icons.list_alt,
          label: 'Payment Frequency',
          value: lease.paymentFrequency.label,
        ),
        _divider(context),
        _buildRow(
          context,
          icon: Icons.credit_card,
          label: 'Number of Cheques',
          value: lease.numberOfCheques.toString(),
        ),
        _divider(context),
        _buildRow(
          context,
          icon: Icons.security,
          label: 'Security Deposit',
          value: StrHelper.formatCurrency(lease.securityDeposit),
        ),
      ]);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: rows,
    );
  }

  Widget _divider(BuildContext context) {
    return Divider(
      height: AppConsts.pLarge,
      color: context.secondary.withValues(alpha: 0.1),
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
