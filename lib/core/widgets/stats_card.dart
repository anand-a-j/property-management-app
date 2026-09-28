import 'package:flutter/material.dart';

import '../core.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  final Color? borderColor;
  final Color? titleColor;
  final Color? valueColor;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    this.borderColor,
    this.titleColor,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor ?? context.secondaryContainer.withOpacity(0.4),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: context.bodyMedium?.copyWith(
              color: titleColor ?? context.onPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppConsts.pSmall),
          Text(
            value,
            style: context.titleLarge?.copyWith(
              color: valueColor ?? context.primary,
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
