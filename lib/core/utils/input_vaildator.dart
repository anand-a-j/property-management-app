class InputVaildator {
  static String? requiredHabitName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name can’t be empty';
    }
    return null;
  }

  // GENERIC REQUIRED
  static String? requiredField(String? value, {String fieldName = "Field"}) {
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
}
