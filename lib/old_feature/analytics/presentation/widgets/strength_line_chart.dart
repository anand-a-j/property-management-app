import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:habitroot/core/extension/common.dart';
import '../../../../core/constants/constants.dart';
import '../../../habit/domain/habit.dart';

class StrengthLineChart extends StatelessWidget {
  const StrengthLineChart({
    super.key,
    required this.habits,
  });

  final List<Habit> habits;

  @override
  Widget build(BuildContext context) {
    final strengthEntries = _getStrengthOverLastNDays(habits, 60);

    final List<FlSpot> spots = strengthEntries
        .asMap()
        .entries
        .map(
          (e) => FlSpot(
            e.key.toDouble(),
            e.value.value.roundToDouble(),
          ),
        )
        .toList();

    final Map<int, DateTime> indexToDate = strengthEntries
        .asMap()
        .map((index, entry) => MapEntry(index, entry.key));

    final labelInterval =
        (strengthEntries.length / 6).roundToDouble().clamp(1, 15);

    return Container(
      height: 300,
      width: 400,
      padding: const EdgeInsets.all(AppConsts.pMedium),
      decoration: BoxDecoration(
        color: context.onSecondary,
        borderRadius: BorderRadius.circular(AppConsts.rSmall),
        border: Border.all(
          width: 1,
          color: context.onSecondaryContainer,
        ),
      ),
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 32),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 36,
                interval: labelInterval.toDouble(),
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  final date = indexToDate[index];
                  if (date == null) return const SizedBox.shrink();

                  final label = DateFormat.MMMd().format(date);
                  return SideTitleWidget(
                    meta: meta,
                    child: Text(
                      label,
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                },
              ),
            ),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: strengthEntries.length.toDouble() - 1,
          minY: 0,
          maxY: 100,
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              barWidth: 2,
              color: context.primary,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}

List<MapEntry<DateTime, double>> _getStrengthOverLastNDays(
  List<Habit> habits,
  int days,
) {
  final now = _dayOnly(DateTime.now());
  final List<MapEntry<DateTime, double>> results = [];

  for (int i = 0; i < days; i++) {
    final day = now.subtract(Duration(days: i));

    double totalStrength = 0;
    int countedHabits = 0;

    for (final habit in habits) {
      final createdDay = _dayOnly(habit.createdAt);
      if (createdDay.isAfter(day)) continue;

      final completedDays = habit.completedDates.map(_dayOnly).toList();

      // ✅ completed on this specific day
      final completedToday = completedDays.contains(day);

      // ✅ completed up to this day
      final completedUpToDay =
          completedDays.where((d) => !d.isAfter(day)).toList();

      // ✅ streak as of this day
      final streakUpToDay = _calculateStreakUpToDay(completedDays, day);

      final streakFactor = (streakUpToDay / 30).clamp(0.0, 1.0);

      final totalDaysSinceCreated =
          day.difference(createdDay).inDays.clamp(1, 100000);

      final frequencyFactor =
          (completedUpToDay.length / totalDaysSinceCreated).clamp(0.0, 1.0);

      // ⚖️ weights
      const w1 = 0.6; // completed today
      const w2 = 0.25; // streak
      const w3 = 0.15; // frequency

      final dailyStrength = ((completedToday ? 1.0 : 0.0) * w1 +
              streakFactor * w2 +
              frequencyFactor * w3) *
          100;

      totalStrength += dailyStrength;
      countedHabits++;
    }

    final avg = countedHabits == 0 ? 0.0 : totalStrength / countedHabits;

    results.add(MapEntry(day, avg));
  }

  return results.reversed.toList();
}

int _calculateStreakUpToDay(
  List<DateTime> completedDays,
  DateTime day,
) {
  final completedSet = completedDays.toSet();

  int streak = 0;
  DateTime current = day;

  while (completedSet.contains(current)) {
    streak++;
    current = current.subtract(const Duration(days: 1));
  }

  return streak;
}

DateTime _dayOnly(DateTime d) => DateTime(d.year, d.month, d.day);
