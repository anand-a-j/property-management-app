import 'package:flutter/foundation.dart';

import '../enum/payment_frequency.dart';

class InputVaildator {
  // GENERIC REQUIRED
  static String? required(String? value, {String fieldName = "Field"}) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName can't be empty";
    }
    return null;
  }

  // EMAIL
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email can't be empty";
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value.trim())) {
      return "Enter a valid email";
    }

    return null;
  }

  // PHONE: Indian and UAE/Dubai mobile and Dubai landline numbers
  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Phone number can't be empty";
    }

    final normalized = value.trim().replaceAll(RegExp(r'[\s()-]'), '');
    final phoneRegex = RegExp(
      r'^(?:[6-9]\d{9}|(?:\+91|0091)[6-9]\d{9}|05\d{8}|(?:\+971|00971)5\d{8}|04\d{7}|(?:\+971|00971)4\d{7})$',
    );

    if (!phoneRegex.hasMatch(normalized)) {
      return "Enter a valid phone number";
    }

    return null;
  }

  // PASSWORD
  static String? password(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Password can't be empty";
    }

    if (value.trim().length < 6) {
      return "Password must be at least 6 characters";
    }

    return null;
  }

  // CONFIRM PASSWORD
  static String? confirmPassword(String? value, String originalPassword) {
    if (value == null || value.isEmpty) {
      return "Confirm your password";
    }

    if (value != originalPassword) {
      return "Passwords do not match";
    }

    return null;
  }

  /// Emirates ID format: 784-YYYY-NNNNNNN-C (15 digits, hyphens optional).
  static String? validateEmiratesId(String? value) {
    final id = (value ?? '').trim();

    if (id.isEmpty) {
      return 'Emirates ID is required';
    }

    final digitsOnly = id.replaceAll('-', '');

    if (kDebugMode) {
      return null;
    }

    if (!RegExp(r'^784\d{12}$').hasMatch(digitsOnly)) {
      return 'Enter a valid Emirates ID (784-XXXX-XXXXXXX-X)';
    }

    return null;
  }

  static String? numberOfCheques({
    required String? value,
    required PaymentFrequency? paymentFrequency,
  }) {
    final requiredError = required(value);

    if (requiredError != null) {
      return requiredError;
    }

    final number = int.tryParse(value!.trim());

    if (number == null) {
      return 'Enter a valid whole number';
    }

    if (number <= 0) {
      return 'Number of cheques must be greater than 0';
    }

    if (paymentFrequency == null) {
      return 'Please select a payment frequency';
    }

    final expectedCheques = switch (paymentFrequency) {
      PaymentFrequency.monthly => 12,
      PaymentFrequency.quarterly => 4,
      PaymentFrequency.semiAnnual => 2,
      PaymentFrequency.annual => 1,
    };

    if (number != expectedCheques) {
      return '${paymentFrequency.label} payments require '
          '$expectedCheques cheque(s) per year';
    }

    return null;
  }
}
