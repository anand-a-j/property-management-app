import 'dart:math';

String generateLeaseNumber() {
  final random = Random();

  final timestamp = DateTime.now().millisecondsSinceEpoch;
  final randomNumber = 100000 + random.nextInt(900000);

  final combined = timestamp.toString() + randomNumber.toString();

  final sixDigits = combined.substring(combined.length - 6);

  return 'LES-$sixDigits';
}
