import 'dart:math';

import 'package:intl/intl.dart';

class StrHelper {
  static String getGreeting() {
    final hour = DateTime.now().hour;

    switch (hour) {
      case < 12:
        return 'Good Morning';
      case < 17:
        return 'Good Afternoon';
      case < 21:
        return 'Good Evening';
      default:
        return 'Good Night';
    }
  }

  static String formatCurrency(
    num amount, {
    String currency = 'AED',
    bool showDecimals = false,
  }) {
    final formatter = NumberFormat.currency(
      locale: 'en_AE',
      symbol: '$currency ',
      decimalDigits: showDecimals ? 2 : 0,
    );

    return formatter.format(amount);
  }

  static String formatLeaseFromTo(DateTime from, DateTime to) {
    final formatter = DateFormat('dd MMM yyyy');

    return '${formatter.format(from)} - ${formatter.format(to)}';
  }

  static String formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  static String formatDateTime(DateTime dateTime) {
    return DateFormat('dd MMM yyyy, hh:mm a').format(dateTime);
  }

  static String generateMaintenanceTicketNumber() {
    final timePart = DateTime.now().microsecondsSinceEpoch % 1000;

    final randomPart = Random().nextInt(1000);

    return 'MT-'
        '${timePart.toString().padLeft(3, '0')}'
        '${randomPart.toString().padLeft(3, '0')}';
  }
}
