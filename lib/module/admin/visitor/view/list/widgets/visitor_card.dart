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
            Row(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  size: 16,
                  color: context.secondary.withValues(alpha: 0.75),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    StrHelper.formatDateTime(visitor.visitAt),
                    style: context.bodyMedium?.copyWith(
                      color: context.secondary.withValues(alpha: 0.75),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            // Visitor phone number
            if (visitor.phone != null && visitor.phone!.trim().isNotEmpty)
              Row(
                children: [
                  Icon(
                    Icons.phone_outlined,
                    size: 16,
                    color: context.secondary.withValues(alpha: 0.75),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      visitor.phone!,
                      style: context.bodyMedium?.copyWith(
                        color: context.secondary.withValues(alpha: 0.75),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
