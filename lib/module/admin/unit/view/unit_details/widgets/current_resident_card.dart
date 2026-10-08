import 'package:flutter/material.dart';
import 'package:naseem/core/core.dart';
import 'package:naseem/core/utils/string_utils.dart';
import 'package:naseem/core/widgets/status_tag.dart';
import 'package:naseem/module/admin/lease/model/lease.dart';

class CurrentResidentCard extends StatelessWidget {
  const CurrentResidentCard({super.key, required this.lease});

  final Lease lease;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 12),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.surface, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConsts.pSide,
              vertical: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: context.primary.withValues(alpha: 0.1),
                  child: Text(
                    lease.resident?.name.split('').first ?? "",
                    style: context.titleMedium?.copyWith(
                      color: context.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 15),

                // Resident Contact Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lease.resident?.name ?? "",
                        style: context.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone_outlined,
                              size: 14,
                              color: context.secondary.withValues(alpha: 0.8),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              lease.resident?.phone ?? "",
                              style: context.bodyMedium?.copyWith(
                                color: context.secondary.withValues(alpha: 0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              size: 14,
                              color: context.secondary.withValues(alpha: 0.8),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                lease.resident?.email ?? "",
                                style: context.bodyMedium?.copyWith(
                                  color: context.secondary.withValues(
                                    alpha: 0.8,
                                  ),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          _buildInfoRow(
            context,
            icon: Icons.receipt_long_outlined,
            label: 'Lease Number',
            value: lease.leaseNumber,
            showBorder: true,
          ),

          _buildInfoRow(
            context,
            icon: Icons.calendar_today_outlined,
            label: 'Lease Period',
            value: StrHelper.formatLeaseFromTo(lease.startDate, lease.endDate),
            showBorder: true,
          ),

          _buildInfoRow(
            context,
            icon: Icons.currency_rupee_outlined,
            label: 'Annual Rent',
            value: StrHelper.formatCurrency(lease.annualRent),
            showBorder: false,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required bool showBorder,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: showBorder
            ? Border(
                top: BorderSide(
                  color: context.secondaryContainer.withOpacity(0.3),
                  width: 0.8,
                ),
                bottom: BorderSide(
                  color: context.secondaryContainer.withOpacity(0.3),
                  width: 0.8,
                ),
              )
            : null,
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: context.secondary.withOpacity(0.6)),
          const SizedBox(width: 5),
          Text(
            label,
            style: context.bodyMedium?.copyWith(
              color: context.secondary.withOpacity(0.6),
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: context.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
