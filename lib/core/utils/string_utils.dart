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
}
