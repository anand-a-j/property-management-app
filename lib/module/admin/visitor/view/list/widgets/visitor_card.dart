import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:naseem/module/admin/visitor/model/visitor.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/enum/visitor_status.dart';
import '../../../../../../core/enum/visitor_type.dart';
import '../../../../../../core/utils/string_utils.dart';
import '../../../../../../core/widgets/status_tag.dart';

class VisitorCard extends StatelessWidget {
  const VisitorCard({super.key, required this.visitor});

  final Visitor visitor;

  @override
  Widget build(BuildContext context) {
    final isFinalStatus =
        visitor.status == VisitorStatus.cancelled ||
        visitor.status == VisitorStatus.checkedOut;

    final updatedAt = visitor.updatedAt;

    return Container(
      margin: const EdgeInsets.only(bottom: 8, top: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.surface, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 7,
          children: [
            // Visitor name and status
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    visitor.name,
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
                  status: visitor.status.label,
                  color: visitor.status.color,
                ),
              ],
            ),

            // Visit type and purpose
            Text(
              [
                visitor.visitType.label,
                if (visitor.purpose != null &&
                    visitor.purpose!.trim().isNotEmpty)
                  visitor.purpose!.trim(),
              ].join(' • '),
              style: context.bodyMedium?.copyWith(
                color: context.secondary,
                height: 1.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            // Visit date and time
            _VisitorInfoRow(
              icon: Icons.calendar_month_outlined,
              text: StrHelper.formatDateTime(visitor.visitStartAt),
              color: context.secondary,
            ),

            // Phone number
            if (visitor.phone != null && visitor.phone!.trim().isNotEmpty)
              _VisitorInfoRow(
                icon: Icons.phone_outlined,
                text: visitor.phone!.trim(),
                color: context.secondary,
              ),

            // Final status and last updated time
            if (isFinalStatus)
              _VisitorInfoRow(
                icon: visitor.status == VisitorStatus.checkedOut
                    ? Icons.logout_rounded
                    : Icons.event_busy_outlined,
                text: updatedAt != null
                    ? '${visitor.status.label} · '
                          '${StrHelper.formatDateTime(updatedAt)}'
                    : visitor.status.label,
                color: visitor.status.color,
              ),
          ],
        ),
      ),
    );
  }
}

class _VisitorInfoRow extends StatelessWidget {
  const _VisitorInfoRow({
    required this.icon,
    required this.text,
    required this.color,
  });

  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final mutedColor = color.withValues(alpha: 0.75);

    return Row(
      children: [
        Icon(icon, size: 16, color: mutedColor),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: context.bodyMedium?.copyWith(color: mutedColor, height: 1.2),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
