import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum RecentActivityType {
  @JsonValue('payment_overdue')
  paymentOverdue,

  @JsonValue('payment_due')
  paymentDue,

  @JsonValue('maintenance_pending')
  maintenancePending,

  @JsonValue('maintenance_update')
  maintenanceUpdate,

  @JsonValue('visitor_pending')
  visitorPending,

  @JsonValue('lease_expiring')
  leaseExpiring,

  @JsonValue('lease_cheque_reminder')
  leaseChequeReminder,

  @JsonValue('unknown')
  unknown,
}

extension RecentActivityTypeX on RecentActivityType {
  String get label {
    switch (this) {
      case RecentActivityType.paymentOverdue:
        return 'Payment Overdue';

      case RecentActivityType.paymentDue:
        return 'Payment Due';

      case RecentActivityType.maintenancePending:
        return 'Maintenance';

      case RecentActivityType.maintenanceUpdate:
        return 'Maintenance Update';

      case RecentActivityType.visitorPending:
        return 'Visitor';

      case RecentActivityType.leaseExpiring:
        return 'Lease Expiring';

      case RecentActivityType.leaseChequeReminder:
        return 'Cheque Reminder';

      case RecentActivityType.unknown:
        return 'Activity';
    }
  }

  IconData get icon {
    switch (this) {
      case RecentActivityType.paymentOverdue:
        return Icons.event_busy_outlined;

      case RecentActivityType.paymentDue:
        return Icons.account_balance_wallet_outlined;

      case RecentActivityType.maintenancePending:
        return Icons.build_outlined;

      case RecentActivityType.maintenanceUpdate:
        return Icons.engineering_outlined;

      case RecentActivityType.visitorPending:
        return Icons.directions_walk_outlined;

      case RecentActivityType.leaseExpiring:
        return Icons.event_note_outlined;

      case RecentActivityType.leaseChequeReminder:
        return Icons.receipt_long_outlined;

      case RecentActivityType.unknown:
        return Icons.notifications_none_rounded;
    }
  }

  Color get backgroundColor {
    switch (this) {
      case RecentActivityType.paymentOverdue:
        return const Color(0xFFFFEEEE);

      case RecentActivityType.paymentDue:
        return const Color(0xFFFFF5E8);

      case RecentActivityType.maintenancePending:
        return const Color(0xFFFFF3E5);

      case RecentActivityType.maintenanceUpdate:
        return const Color(0xFFEAF4FF);

      case RecentActivityType.visitorPending:
        return const Color(0xFFEEF0FF);

      case RecentActivityType.leaseExpiring:
        return const Color(0xFFFCECF2);

      case RecentActivityType.leaseChequeReminder:
        return const Color(0xFFF1ECFA);

      case RecentActivityType.unknown:
        return const Color(0xFFF3F4F6);
    }
  }

  Color get color {
    switch (this) {
      case RecentActivityType.paymentOverdue:
        return const Color(0xFFC94B4B);

      case RecentActivityType.paymentDue:
        return const Color(0xFFC47B24);

      case RecentActivityType.maintenancePending:
        return const Color(0xFFC47B24);

      case RecentActivityType.maintenanceUpdate:
        return const Color(0xFF4384C2);

      case RecentActivityType.visitorPending:
        return const Color(0xFF6975C9);

      case RecentActivityType.leaseExpiring:
        return const Color(0xFFC16F91);

      case RecentActivityType.leaseChequeReminder:
        return const Color(0xFF8A70B8);

      case RecentActivityType.unknown:
        return const Color(0xFF84909F);
    }
  }
}

extension RecentActivityTypeParser on String? {
  RecentActivityType toRecentActivityType() {
    switch (this?.trim().toLowerCase()) {
      case 'payment_overdue':
        return RecentActivityType.paymentOverdue;
      case 'payment_due':
        return RecentActivityType.paymentDue;
      case 'maintenance_pending':
        return RecentActivityType.maintenancePending;
      case 'maintenance_update':
        return RecentActivityType.maintenanceUpdate;
      case 'visitor_pending':
        return RecentActivityType.visitorPending;
      case 'lease_expiring':
        return RecentActivityType.leaseExpiring;
      case 'lease_cheque_reminder':
        return RecentActivityType.leaseChequeReminder;
      default:
        return RecentActivityType.unknown;
    }
  }
}
