import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/extension/common.dart';

class DashInsightCard extends StatelessWidget {
  const DashInsightCard({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConsts.pSmall),
      decoration: BoxDecoration(
        color: context.onPrimary,
        borderRadius: BorderRadius.circular(AppConsts.rSmall),
        border: Border.all(width: 1, color: context.secondaryContainer),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppConsts.pExtraLarge,
        children: [
          Text(
            title,
            style: context.bodySmall?.copyWith(
              fontWeight: FontWeight.w300,
              color: context.secondary.withValues(alpha: .5),
            ),
          ),
          Text(
            value,
            style: context.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
