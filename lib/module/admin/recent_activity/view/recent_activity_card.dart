import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:naseem/core/enum/recent_activity_type.dart';
import 'package:naseem/module/admin/recent_activity/model/recent_activity.dart';

import '../../../../core/core.dart';
import '../../../../core/enum/recent_activity_status.dart';
import '../../../../core/utils/string_utils.dart';
import '../../../../core/widgets/status_tag.dart';

class RecentActivityCard extends StatelessWidget {
  const RecentActivityCard({super.key, required this.recentActivity});

  final RecentActivity recentActivity;

  @override
  Widget build(BuildContext context) {
    final activity = recentActivity;

    final type = activity.activityType.toRecentActivityType();
    final activityStatus = activity.status.toRecentActivityStatus();

    final title = activity.title?.trim();
    final description = activity.description?.trim();
    final unitName = activity.unitName?.trim();
    final communityName = activity.communityName?.trim();

    final hasTitle = title != null && title.isNotEmpty;
    final hasDescription = description != null && description.isNotEmpty;

    final location = [
      if (unitName != null && unitName.isNotEmpty) unitName,
      if (communityName != null && communityName.isNotEmpty) communityName,
    ].join(' · ');

    final activityDate = activity.activityAt?.toLocal();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Activity type icon
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: type.backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(type.icon, size: 19, color: type.color),
          ),

          const SizedBox(width: 12),

          // Activity details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and status
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        hasTitle ? title : type.label,
                        style: context.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: context.primary,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    if (activityStatus != RecentActivityStatus.unknown) ...[
                      const SizedBox(width: 8),
                      StatusTag(
                        status: activityStatus.label,
                        color: activityStatus.color,
                      ),
                    ],
                  ],
                ),

                // Description
                if (hasDescription) ...[
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: context.bodySmall?.copyWith(
                      color: context.secondary,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],

                // Unit and community
                if (location.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  _ActivityInfoRow(
                    icon: Icons.location_on_outlined,
                    text: location,
                    color: context.secondary,
                  ),
                ],

                // Activity timestamp
                if (activityDate != null) ...[
                  const SizedBox(height: 6),
                  _ActivityInfoRow(
                    icon: Icons.access_time_rounded,
                    text: StrHelper.formatDateTime(activityDate),
                    color: context.secondary,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivityInfoRow extends StatelessWidget {
  const _ActivityInfoRow({
    required this.icon,
    required this.text,
    required this.color,
  });

  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: color.withValues(alpha: 0.65)),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            text,
            style: context.bodySmall?.copyWith(
              color: color.withValues(alpha: 0.8),
              height: 1.3,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
