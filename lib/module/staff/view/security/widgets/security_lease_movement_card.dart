import 'package:flutter/material.dart';
import 'package:naseem/module/staff/model/security_lease_movement.dart';

import '../../../../../core/core.dart';
import '../../../../../core/utils/string_utils.dart';
import '../../../../../core/widgets/status_tag.dart';

class SecurityLeaseMovementCard extends StatelessWidget {
  const SecurityLeaseMovementCard({super.key, required this.leaseMovement});

  final SecurityLeaseMovement leaseMovement;

  @override
  Widget build(BuildContext context) {
    final movementType = _formatMovementType(leaseMovement.movementType);

    final status = _formatStatus(leaseMovement.status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.surface, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 9,
        children: [
          // Movement type and status
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  movementType,
                  style: context.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.primary,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 10),
              StatusTag(status: status.label, color: status.color),
            ],
          ),

          // Lease number
          if (_hasValue(leaseMovement.leaseNumber))
            _buildInfoRow(
              context,
              icon: Icons.description_outlined,
              text: 'Lease: ${leaseMovement.leaseNumber!.trim()}',
            ),

          // Unit name and resident name
          if (_hasValue(leaseMovement.unitName))
            _buildInfoRow(
              context,
              icon: Icons.apartment_outlined,
              text: 'Unit: ${leaseMovement.unitName!.trim()}',
            ),

          if (_hasValue(leaseMovement.residentName))
            _buildInfoRow(
              context,
              icon: Icons.person_outline,
              text: 'Resident: ${leaseMovement.residentName!.trim()}',
            ),

          // Requested by
          if (_hasValue(leaseMovement.requestedByName))
            _buildInfoRow(
              context,
              icon: Icons.person_add_alt_outlined,
              text:
                  'Requested by: '
                  '${leaseMovement.requestedByName!.trim()}',
            ),

          // Request date
          if (leaseMovement.requestedAt != null)
            _buildInfoRow(
              context,
              icon: Icons.calendar_month_outlined,
              text: StrHelper.formatDateTime(leaseMovement.requestedAt!),
            ),

          // Lease duration
          if (leaseMovement.startDate != null || leaseMovement.endDate != null)
            _buildInfoRow(
              context,
              icon: Icons.date_range_outlined,
              text: _formatLeaseDuration(
                leaseMovement.startDate,
                leaseMovement.endDate,
              ),
            ),

          // Manager rejection reason
          if (leaseMovement.status == 'rejected_by_manager' &&
              _hasValue(leaseMovement.managerRejectionReason))
            _buildRejectionReason(
              context,
              leaseMovement.managerRejectionReason!,
            ),

          // Security rejection reason
          if (leaseMovement.status == 'rejected_by_security' &&
              _hasValue(leaseMovement.securityRejectionReason))
            _buildRejectionReason(
              context,
              leaseMovement.securityRejectionReason!,
            ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String text,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: context.secondary.withValues(alpha: 0.75)),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: context.bodyMedium?.copyWith(
              color: context.secondary.withValues(alpha: 0.85),
              height: 1.2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildRejectionReason(BuildContext context, String reason) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        'Rejection reason: ${reason.trim()}',
        style: context.bodyMedium?.copyWith(
          color: context.secondary,
          height: 1.3,
        ),
      ),
    );
  }

  bool _hasValue(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  String _formatMovementType(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Lease Movement';
    }

    return value
        .trim()
        .split('_')
        .map(
          (word) => word.isEmpty
              ? word
              : '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}',
        )
        .join(' ');
  }

  String _formatLeaseDuration(DateTime? startDate, DateTime? endDate) {
    if (startDate != null && endDate != null) {
      return '${StrHelper.formatDateTime(startDate)} - '
          '${StrHelper.formatDateTime(endDate)}';
    }

    if (startDate != null) {
      return 'Start: ${StrHelper.formatDateTime(startDate)}';
    }

    return 'End: ${StrHelper.formatDateTime(endDate!)}';
  }

  ({String label, Color color}) _formatStatus(String status) {
    switch (status) {
      case 'pending_security':
        return (label: 'Pending Security', color: Colors.orange);

      case 'pending_manager':
        return (label: 'Pending Manager', color: Colors.blue);

      case 'approved_by_manager':
        return (label: 'Manager Approved', color: Colors.blue);

      case 'approved_by_security':
        return (label: 'Security Approved', color: Colors.green);

      case 'rejected_by_manager':
        return (label: 'Manager Rejected', color: Colors.red);

      case 'rejected_by_security':
        return (label: 'Security Rejected', color: Colors.red);

      case 'completed':
        return (label: 'Completed', color: Colors.green);

      case 'cancelled':
        return (label: 'Cancelled', color: Colors.grey);

      default:
        return (label: _formatMovementType(status), color: Colors.grey);
    }
  }
}
