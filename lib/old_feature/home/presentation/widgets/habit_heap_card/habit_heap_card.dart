import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitroot/core/constants/constants.dart';
import 'package:habitroot/core/enum/date_event.dart';
import 'package:habitroot/core/extension/common.dart';

import 'package:hive_ce_flutter/adapters.dart';

import '../../../../../core/enum/habit_card_type.dart';
import '../../../../../routes/routes.dart';
import '../../../../calendar/domain/calendar_event.dart';
import '../../../../calendar/presentation/heap_map_calendar.dart';
import '../../../../habit/presentation/provider/habit_provider.dart';
import '../../components/habit_details_bottom_sheet.dart';
import '../habit_mark_button.dart';
import 'habit_card_week_mode.dart';

final heapCardHabitId = Provider<String>((ref) => throw UnimplementedError());

class HabitHeapCard extends ConsumerWidget {
  const HabitHeapCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);

    final habitId = ref.watch(heapCardHabitId);
    final habit = ref.watch(habitByIdProvider(habitId));
    final habitColor = habit.color;

    final events = habit.completedDates
        .map((date) => CalendarEvent(
              date: DateTime(date.year, date.month, date.day),
              event: DateEvent.completed,
            ))
        .toList();

    final now = DateTime.now();
    final oneYearAgo = now.subtract(const Duration(days: 365));
    final startDate =
        habit.createdAt.isBefore(oneYearAgo) ? habit.createdAt : oneYearAgo;

    void openHabit(
      BuildContext context,
    ) {
      // Subtle, premium haptic
      HapticFeedback.selectionClick();

      showHabitDetailsSheet(context, habit);
    }

    void openHabitLongPress(
      BuildContext context,
    ) {
      // Slightly stronger feedback
      HapticFeedback.mediumImpact();

      showHabitDetailsSheet(context, habit);
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      // 👆 Single tap
      onTap: () => openHabit(context),

      // ✋ Long press
      onLongPress: () => openHabitLongPress(context),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Container(
            // duration: const Duration(milliseconds: 300),
            // curve: Curves.easeInOut,
            padding: const EdgeInsets.all(AppConsts.pSmall),
            margin: const EdgeInsetsDirectional.only(
              start: AppConsts.pSide,
              end: AppConsts.pSide,
              top: AppConsts.pSide,
            ),
            decoration: BoxDecoration(
              color: context.onSecondary,
              borderRadius: BorderRadius.circular(AppConsts.rSmall),
              border: Border.all(
                width: 1,
                color: context.onSecondaryContainer,
              ),
            ),
            child: Column(
              children: [
                Row(
                  spacing: AppConsts.pSmall,
                  crossAxisAlignment:
                      habit.description != null && habit.description!.isNotEmpty
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                  children: [
                    Text(
                      habit.icon,
                      style: const TextStyle(
                        fontSize: 24
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width - 176,
                          child: Text(
                            habit.name,
                            style: context.bodyMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (habit.description != null &&
                            habit.description!.isNotEmpty)
                          SizedBox(
                            width: size.width - 176,
                            child: Text(
                              habit.description ?? "",
                              style: context.labelLarge?.copyWith(
                                color: context.surface,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                      ],
                    ),
                    const Spacer(),
                    HabitMarkButton(
                      backgroundColor: Color(habitColor),
                      habitId: habit.id,
                    ),
                  ],
                ),
                ValueListenableBuilder(
                  valueListenable: settings.listenable(
                    keys: [habitCardModeKey],
                  ),
                  builder: (context, value, child) {
                    final HabitCardType habitCardType =
                        HabitCardType.values[value.get(
                      habitCardModeKey,
                      defaultValue: 0,
                    )];

                    Widget content;
                    if (HabitCardType.day == habitCardType) {
                      content = const SizedBox.shrink();
                    } else if (HabitCardType.week == habitCardType) {
                      content = HabitCardWeekMode(habit: habit);
                    } else {
                      content = Column(
                        key: const ValueKey("month_view"),
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: AppConsts.pMedium),
                          HeatMapCalendar(
                            startDate: startDate,
                            endDate: DateTime.now(),
                            events: events,
                            baseColor: Color(habitColor),
                          ),
                        ],
                      );
                    }

                    return AnimatedSize(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        switchInCurve: Curves.easeIn,
                        switchOutCurve: Curves.easeOut,
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                              opacity: animation, child: child);
                        },
                        child: content,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
