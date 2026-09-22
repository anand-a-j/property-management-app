// ERROR HANDLING
String globalError(Object e) {
  final msg = e.toString().toLowerCase();

  if (msg.contains('invalid login credentials')) {
    return "Invalid email or password";
  }

  if (msg.contains('email not confirmed')) {
    return "Please verify your email";
  }

  if (msg.contains('user already registered')) {
    return "Account already exists";
  }

  if (msg.contains('network')) {
    return "Check your internet connection";
  }

  if (msg.contains('password')) {
    return "Password should be at least 6 characters";
  }

  return "Something went wrong";
}
