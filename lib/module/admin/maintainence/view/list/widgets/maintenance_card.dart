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

            Text(
              request.issueType,
              style: context.bodyMedium?.copyWith(
                color: context.secondary.withValues(alpha: 0.75),
                height: 1,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            Text(
              request.description,
              style: context.bodyMedium?.copyWith(
                color: context.secondary.withValues(alpha: 0.75),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

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
      ),
    );
  }
}
