import 'package:flutter/material.dart';
import 'package:habitroot/core/extension/common.dart';


import '../../../../core/constants/app_constants.dart';
import '../../../habit/domain/habit.dart';

class AnalyticsHabitInfo extends StatelessWidget {
  const AnalyticsHabitInfo({super.key, required this.habit});

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConsts.pSmall),
      decoration: BoxDecoration(
        color: context.onSecondary,
        borderRadius: BorderRadius.circular(AppConsts.rSmall),
        border: Border.all(
          width: 1,
          color: context.onSecondaryContainer,
        ),
      ),
      child: Row(
        spacing: AppConsts.pSmall,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            habit.icon,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          Flexible(
            child: Text(
              habit.name,
              style: context.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
