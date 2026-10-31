import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum RecentActivityStatus {
  @JsonValue('pending')
  pending,

  @JsonValue('pending_review')
  pendingReview,

  @JsonValue('overdue')
  overdue,

  @JsonValue('paid')
  paid,

  @JsonValue('upcoming')
  upcoming,

  @JsonValue('active')
  active,

  @JsonValue('in_progress')
  inProgress,

  @JsonValue('completed')
  completed,

  @JsonValue('cancelled')
  cancelled,

  @JsonValue('unknown')
  unknown,
}

extension RecentActivityStatusX on RecentActivityStatus {
  String get label {
    switch (this) {
      case RecentActivityStatus.pending:
        return 'Pending';

      case RecentActivityStatus.pendingReview:
        return 'Awaiting Review';

      case RecentActivityStatus.overdue:
        return 'Overdue';

      case RecentActivityStatus.paid:
        return 'Paid';

      case RecentActivityStatus.upcoming:
        return 'Upcoming';

      case RecentActivityStatus.active:
        return 'Active';

      case RecentActivityStatus.inProgress:
        return 'In Progress';

      case RecentActivityStatus.completed:
        return 'Completed';

      case RecentActivityStatus.cancelled:
        return 'Cancelled';

      case RecentActivityStatus.unknown:
        return 'Unknown';
    }
  }

  Color get color {
    switch (this) {
      case RecentActivityStatus.pending:
      case RecentActivityStatus.pendingReview:
        return const Color(0xFFC47B24);

      case RecentActivityStatus.overdue:
        return const Color(0xFFC94B4B);

      case RecentActivityStatus.paid:
      case RecentActivityStatus.completed:
        return const Color(0xFF32845A);

      case RecentActivityStatus.upcoming:
        return const Color(0xFF4384C2);

      case RecentActivityStatus.active:
        return const Color(0xFF32845A);

      case RecentActivityStatus.inProgress:
        return const Color(0xFF6975C9);

      case RecentActivityStatus.cancelled:
        return const Color(0xFF84909F);

      case RecentActivityStatus.unknown:
        return const Color(0xFF84909F);
    }
  }

  Color get backgroundColor => color.withValues(alpha: 0.10);
}



extension RecentActivityStatusParser on String? {
  RecentActivityStatus toRecentActivityStatus() {
    switch (this?.trim().toLowerCase()) {
      case 'pending':
        return RecentActivityStatus.pending;
      case 'pending_review':
        return RecentActivityStatus.pendingReview;
      case 'overdue':
        return RecentActivityStatus.overdue;
      case 'paid':
        return RecentActivityStatus.paid;
      case 'upcoming':
        return RecentActivityStatus.upcoming;
      case 'active':
        return RecentActivityStatus.active;
      case 'in_progress':
        return RecentActivityStatus.inProgress;
      case 'completed':
        return RecentActivityStatus.completed;
      case 'cancelled':
        return RecentActivityStatus.cancelled;
      default:
        return RecentActivityStatus.unknown;
    }
  }
}
