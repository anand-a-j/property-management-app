import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/enum/mainteance_status.dart';
import '../../../../../../core/enum/maintenance_priority.dart';
import '../../../../../../core/utils/string_utils.dart';
import '../../../../../../core/widgets/status_tag.dart';
import '../../../model/maintenance_request.dart';

class MaintenanceCard extends StatelessWidget {
  const MaintenanceCard({super.key, required this.maintenanceRequest});

  final MaintenanceRequest maintenanceRequest;

  @override
  Widget build(BuildContext context) {
    final request = maintenanceRequest;

    final rejectionReason = request.rejectionReason?.trim();
    final note = null;

    final hasRejectionReason =
        rejectionReason != null && rejectionReason.isNotEmpty;

    final hasNote = note != null && note.isNotEmpty;

    // Display the most relevant remark for the current status.
    final String? remarkTitle;
    final String? remark;

    switch (request.status) {
      case MaintenanceStatus.rejected:
        remarkTitle = 'Rejection Reason';
        remark = hasRejectionReason
            ? rejectionReason
            : hasNote
            ? note
            : null;
        break;

      case MaintenanceStatus.pendingReview:
      case MaintenanceStatus.approved:
        remarkTitle = 'Review Remarks';
        remark = hasNote ? note : null;
        break;

      case MaintenanceStatus.assigned:
      case MaintenanceStatus.inProgress:
      case MaintenanceStatus.completed:
        remarkTitle = 'Work Update';
        remark = hasNote ? note : null;
        break;

      case MaintenanceStatus.closed:
        remarkTitle = 'Final Remarks';
        remark = hasNote ? note : null;
        break;

      case MaintenanceStatus.cancelled:
        remarkTitle = 'Remarks';
        remark = hasRejectionReason
            ? rejectionReason
            : hasNote
            ? note
            : null;
        break;
    }

    final hasRemark = remark != null && remark.isNotEmpty;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      margin: const EdgeInsets.only(bottom: 8, top: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.surface, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5,
        children: [
          // Ticket number and status
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  request.ticketNumber,
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
                status: request.status.label,
                color: request.status.color,
              ),
            ],
          ),

          // Issue title
          Text(
            request.issueTitle,
            style: context.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: context.secondary,
              height: 1,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          // Issue type
          Text(
            request.issueType,
            style: context.bodyMedium?.copyWith(
              color: context.secondary.withValues(alpha: 0.75),
              height: 1,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          // Description
          Text(
            request.description,
            style: context.bodyMedium?.copyWith(
              color: context.secondary.withValues(alpha: 0.5),
              height: 1.2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          // Conditional remarks
          if (hasRemark) ...[
            const SizedBox(height: 5),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: request.status.color.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: request.status.color.withValues(alpha: 0.18),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    remarkTitle,
                    style: context.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: request.status.color,
                    ),
                  ),
                  Text(
                    remark,
                    style: context.bodyMedium?.copyWith(
                      color: context.secondary,
                      height: 1.3,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 4),

          // Priority and created date
          Row(
            children: [
              Expanded(
                child: Text(
                  'Priority: ${request.priority.label}',
                  style: context.bodyMedium?.copyWith(
                    color: request.priority.color,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                StrHelper.formatDate(request.createdAt),
                style: context.bodyMedium?.copyWith(
                  color: context.secondary.withValues(alpha: 0.75),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
