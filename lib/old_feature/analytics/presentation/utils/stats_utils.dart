import '../../../../core/enum/date_event.dart';
import '../../../calendar/domain/calendar_event.dart';
import '../../../habit/domain/habit.dart';

class StatsUtils {
  static int calOverallStrength(List<Habit> habits) {
    if (habits.isEmpty) return 0;

    final now = DateTime.now();

    double totalStrength = 0;

    for (final habit in habits) {
      final past30Days = now.subtract(const Duration(days: 60));

      final recentCompletions =
          habit.completedDates.where((d) => d.isAfter(past30Days)).length;
      final consistencyRate = recentCompletions / 30;

      final streakFactor = (habit.streak / 30).clamp(0.0, 1.0);

      final habitAge = now.difference(habit.createdAt).inDays.clamp(1, 100000);
      final frequencyFactor =
          (habit.completedDates.length / habitAge).clamp(0.0, 1.0);

      const w1 = 0.5; // weight: consistency
      const w2 = 0.3; // weight: streak
      const w3 = 0.2; // weight: overall frequency

      final habitStrength =
          (consistencyRate * w1 + streakFactor * w2 + frequencyFactor * w3) *
              100;

      totalStrength += habitStrength.clamp(0.0, 100.0);
    }

    final averageStrength = totalStrength / habits.length;

    return averageStrength.round();
  }

  static int calTotalCompletion(List<Habit> habits) {
    return habits.fold(0, (sum, habit) => sum + habit.completedDates.length);
  }

  static double calConsistencyPercentage(List<Habit> habits) {
    if (habits.isEmpty) return 0.0;

    final now = DateTime.now();
    final startDate = now.subtract(const Duration(days: 60));

    final Set<DateTime> uniqueDays = {};

    for (final habit in habits) {
      final recentDays = habit.completedDates
          .where((d) => d.isAfter(startDate))
          .map(
              (d) => DateTime(d.year, d.month, d.day)); // normalize to day only

      uniqueDays.addAll(recentDays);
    }

    final consistentDays = uniqueDays.length.clamp(0, 30);
    final percentage = (consistentDays / 30) * 100;

    return double.parse(percentage.toStringAsFixed(1)); // e.g. 73.3
  }

  static int calOverallCurrentStreak(List<Habit> habits) {
    if (habits.isEmpty) return 0;

    final Set<DateTime> allDays = habits
        .expand((h) => h.completedDates)
        .map((d) => DateTime(d.year, d.month, d.day))
        .toSet();

    int streak = 0;
    DateTime day = DateTime.now();

    while (allDays.contains(DateTime(day.year, day.month, day.day))) {
      streak++;
      day = day.subtract(const Duration(days: 1));
    }

    return streak;
  }

  static int calOverallBestStreak(List<Habit> habits) {
    if (habits.isEmpty) return 0;

    final Set<DateTime> allDays = habits
        .expand((h) => h.completedDates)
        .map((d) => DateTime(d.year, d.month, d.day))
        .toSet();

    if (allDays.isEmpty) return 0;

    final sortedDays = allDays.toList()..sort();
    int bestStreak = 1;
    int currentStreak = 1;

    for (int i = 1; i < sortedDays.length; i++) {
      final prev = sortedDays[i - 1];
      final curr = sortedDays[i];

      if (curr.difference(prev).inDays == 1) {
        currentStreak++;
        bestStreak = currentStreak > bestStreak ? currentStreak : bestStreak;
      } else if (curr.difference(prev).inDays > 1) {
        currentStreak = 1;
      }
    }

    return bestStreak;
  }

  static List<CalendarEvent> getCalendarEvents(List<Habit> habits) {
    // Map to hold completion count for each date
    final Map<DateTime, int> completionCount = {};

    for (final habit in habits) {
      for (final date in habit.completedDates) {
        // Normalize to only year, month, day (ignore time)
        final dayKey = DateTime(date.year, date.month, date.day);
        completionCount[dayKey] = (completionCount[dayKey] ?? 0) + 1;
      }
    }

    // Determine max completions in a day for scaling
    final int maxCount = completionCount.values.isEmpty
        ? 0
        : completionCount.values.reduce((a, b) => a > b ? a : b);

    // Convert to list of CalendarEvent
    return completionCount.entries.map((entry) {
      final date = entry.key;
      final count = entry.value;

      return CalendarEvent(
        date: date,
        event: _mapCountToEvent(count, maxCount),
      );
    }).toList();
  }

  static DateEvent _mapCountToEvent(int count, int totalHabits) {
    if (count <= 0) return DateEvent.normal;
    if (totalHabits <= 0) return DateEvent.normal;

    final ratio = count / totalHabits;

    if (ratio <= 0.25) return DateEvent.low;
    if (ratio <= 0.5) return DateEvent.medium;
    if (ratio <= 0.75) return DateEvent.high;
    if (ratio > 0.75 && ratio < 1.0) return DateEvent.veryHigh;
    if (ratio == 1.0) return DateEvent.completed;

    return DateEvent.normal;
  }

  static int calHabitCoverage(List<Habit> habits, {int days = 60}) {
    if (habits.isEmpty) return 0;

    final now = DateTime.now();
    final since = now.subtract(Duration(days: days));

    final activeHabits = habits.where((habit) {
      return habit.completedDates.any((d) => d.isAfter(since));
    }).length;

    final coverage = (activeHabits / habits.length) * 100;

    return coverage.round();
  }

  static int calMomentumScore(List<Habit> habits, {int window = 7}) {
    if (habits.isEmpty) return 0;

    final now = DateTime.now();
    final currentStart = now.subtract(Duration(days: window));
    final previousStart = now.subtract(Duration(days: window * 2));

    int currentCompletions = 0;
    int previousCompletions = 0;

    for (final habit in habits) {
      for (final d in habit.completedDates) {
        if (d.isAfter(currentStart)) {
          currentCompletions++;
        } else if (d.isAfter(previousStart) && d.isBefore(currentStart)) {
          previousCompletions++;
        }
      }
    }

    if (previousCompletions == 0 && currentCompletions == 0) return 0;
    if (previousCompletions == 0) return 100;

    final momentum =
        ((currentCompletions - previousCompletions) / previousCompletions) *
            100;

    return momentum.round().clamp(-100, 100);
  }

  static String momentumLabel(int score) {
    if (score >= 10) return "Building ↑";
    if (score <= -10) return "Slowing ↓";
    return "Stable →";
  }

  static int calLongestBreak(List<Habit> habits) {
    if (habits.isEmpty) return 0;

    final habit = habits.first;

    if (habit.completedDates.isEmpty) return 0;

    // Normalize dates (remove time)
    final List<DateTime> days = habit.completedDates
        .map((d) => DateTime(d.year, d.month, d.day))
        .toSet()
        .toList()
      ..sort();

    if (days.length < 2) return 0;

    int longestBreak = 0;

    for (int i = 1; i < days.length; i++) {
      final prev = days[i - 1];
      final curr = days[i];

      final gap = curr.difference(prev).inDays - 1;

      if (gap > longestBreak) {
        longestBreak = gap;
      }
    }

    return longestBreak;
  }

  static String calBestDay(List<Habit> habits) {
    if (habits.isEmpty) return "—";

    final habit = habits.first;

    if (habit.completedDates.isEmpty) return "—";

    int monday = 0;
    int tuesday = 0;
    int wednesday = 0;
    int thursday = 0;
    int friday = 0;
    int saturday = 0;
    int sunday = 0;

    for (final d in habit.completedDates) {
      switch (d.weekday) {
        case DateTime.monday:
          monday++;
          break;
        case DateTime.tuesday:
          tuesday++;
          break;
        case DateTime.wednesday:
          wednesday++;
          break;
        case DateTime.thursday:
          thursday++;
          break;
        case DateTime.friday:
          friday++;
          break;
        case DateTime.saturday:
          saturday++;
          break;
        case DateTime.sunday:
          sunday++;
          break;
      }
    }

    int max = monday;
    String bestDay = "Monday";

    if (tuesday > max) {
      max = tuesday;
      bestDay = "Tuesday";
    }
    if (wednesday > max) {
      max = wednesday;
      bestDay = "Wednesday";
    }
    if (thursday > max) {
      max = thursday;
      bestDay = "Thursday";
    }
    if (friday > max) {
      max = friday;
      bestDay = "Friday";
    }
    if (saturday > max) {
      max = saturday;
      bestDay = "Saturday";
    }
    if (sunday > max) {
      max = sunday;
      bestDay = "Sunday";
    }

    // If user has only 1 completion, this still works fine
    return bestDay;
  }

  static String calSuccessRate7Days(List<Habit> habits) {
    if (habits.isEmpty) return "0 / 7 days";

    final habit = habits.first;

    if (habit.completedDates.isEmpty) return "0 / 7 days";

    final today = DateTime.now();
    final startDay = DateTime(today.year, today.month, today.day).subtract(
      const Duration(days: 6),
    );

    final Set<DateTime> completedDays = habit.completedDates
        .map((d) => DateTime(d.year, d.month, d.day))
        .toSet();

    int successCount = 0;

    for (int i = 0; i < 7; i++) {
      final day = startDay.add(Duration(days: i));
      if (completedDays.contains(day)) {
        successCount++;
      }
    }

    return "$successCount / 7 days";
  }

  static String calTrend(List<Habit> habits) {
    if (habits.isEmpty) return "Stable →";

    final habit = habits.first;

    if (habit.completedDates.isEmpty) return "Stable →";

    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);

    final last7Start = todayDate.subtract(const Duration(days: 6));
    final prev7Start = todayDate.subtract(const Duration(days: 13));
    // todayDate.subtract(const Duration(days: 7));

    final Set<DateTime> completedDays = habit.completedDates
        .map((d) => DateTime(d.year, d.month, d.day))
        .toSet();

    int last7Count = 0;
    int prev7Count = 0;

    // Count last 7 days
    for (int i = 0; i < 7; i++) {
      final day = last7Start.add(Duration(days: i));
      if (completedDays.contains(day)) {
        last7Count++;
      }
    }

    // Count previous 7 days
    for (int i = 0; i < 7; i++) {
      final day = prev7Start.add(Duration(days: i));
      if (completedDays.contains(day)) {
        prev7Count++;
      }
    }

    if (last7Count > prev7Count) {
      return "Improving ↑";
    } else if (last7Count < prev7Count) {
      return "Declining ↓";
    } else {
      return "Stable →";
    }
  }
}
