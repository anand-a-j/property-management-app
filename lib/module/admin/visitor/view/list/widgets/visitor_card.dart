import 'package:flutter/material.dart';
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
    final isCancelled = visitor.status == VisitorStatus.cancelled;
    final isCheckedOut = visitor.status == VisitorStatus.checkedOut;

    final purpose = visitor.purpose?.trim();
    final phone = visitor.phone?.trim();
    final documentId = visitor.documentId?.trim();
    final schedule = _scheduleText(visitor);
    final isPreRegistered = visitor.residentId != null;

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

            // Visitor code
            if (visitor.visitorCode != null &&
                visitor.visitorCode!.trim().isNotEmpty)
              Text(
                visitor.visitorCode!.trim(),
                style: context.bodySmall?.copyWith(
                  color: context.secondary,
                  height: 1,
                ),
              ),

            // Visit type, purpose and source (pre-registered by resident / walk-in)
            Text(
              [
                visitor.visitType.label,
                if (purpose != null && purpose.isNotEmpty) purpose,
                if (isPreRegistered) 'Pre-registered',
              ].join(' • '),
              style: context.bodyMedium?.copyWith(
                color: context.secondary,
                height: 1.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            // Expected schedule (only when a resident pre-registered it)
            if (schedule != null)
              _VisitorInfoRow(
                icon: Icons.calendar_month_outlined,
                text: schedule,
                color: context.secondary,
              ),

            // Phone number
            if (phone != null && phone.isNotEmpty)
              _VisitorInfoRow(
                icon: Icons.phone_outlined,
                text: phone,
                color: context.secondary,
              ),

            // Parking
            if (visitor.parkingRequired == true)
              _VisitorInfoRow(
                icon: Icons.local_parking_outlined,
                text: 'Parking required',
                color: context.secondary,
              ),

            // Legal document
            if (documentId != null && documentId.isNotEmpty)
              _VisitorInfoRow(
                icon: Icons.description_outlined,
                text: 'Document: $documentId',
                color: context.secondary,
              ),

            // Actual check-in (set by security)
            if (visitor.checkedInAt != null)
              _VisitorInfoRow(
                icon: Icons.login_rounded,
                text:
                    'Checked in · '
                    '${StrHelper.formatDateTime(visitor.checkedInAt!.toLocal())}',
                color: context.secondary,
              ),

            // Actual check-out (set by security)
            if (isCheckedOut)
              _VisitorInfoRow(
                icon: Icons.logout_rounded,
                text: _finalText(
                  label: visitor.status.label,
                  time: visitor.checkedOutAt ?? visitor.updatedAt,
                ),
                color: visitor.status.color,
              ),

            // Cancelled
            if (isCancelled)
              _VisitorInfoRow(
                icon: Icons.event_busy_outlined,
                text: _finalText(
                  label: visitor.status.label,
                  time: visitor.updatedAt,
                ),
                color: visitor.status.color,
              ),
          ],
        ),
      ),
    );
  }

  /// Builds the expected schedule line.
  /// - start + end, same day  -> "27/10/2026 10:00 – 12:00"
  /// - start + end, other day -> "27/10/2026 10:00 – 28/10/2026 12:00"
  /// - start only             -> "Expected: 27/10/2026 10:00"
  /// - nothing (walk-in)      -> null, row is hidden
  /// Falls back to the legacy [Visitor.visitAt] when start is missing.
  String? _scheduleText(Visitor visitor) {
    final start = (visitor.visitStartAt ?? visitor.visitAt)?.toLocal();
    final end = visitor.visitEndAt?.toLocal();

    if (start == null) return null;

    // Old records had end == start (backfill), so treat that as "no end".
    final hasEnd = end != null && end.isAfter(start);

    if (!hasEnd) {
      return 'Expected: ${StrHelper.formatDateTime(start)}';
    }

    final sameDay =
        start.year == end.year &&
        start.month == end.month &&
        start.day == end.day;

    if (sameDay) {
      return '${StrHelper.formatDateTime(start)} – ${_time(end)}';
    }

    return '${StrHelper.formatDateTime(start)} – '
        '${StrHelper.formatDateTime(end)}';
  }

  String _finalText({required String label, required DateTime? time}) {
    if (time == null) return label;
    return '$label · ${StrHelper.formatDateTime(time.toLocal())}';
  }

  String _time(DateTime date) =>
      '${date.hour.toString().padLeft(2, '0')}:'
      '${date.minute.toString().padLeft(2, '0')}';
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
