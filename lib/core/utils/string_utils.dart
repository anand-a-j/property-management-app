

class StringUtils {
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
}
