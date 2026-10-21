import 'package:flutter/material.dart';

import '../core.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  final Color? borderColor;
  final Color? titleColor;
  final Color? valueColor;
  final Color? iconColor;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.borderColor,
    this.titleColor,
    this.valueColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConsts.pMedium),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color:
              borderColor ?? context.secondaryContainer.withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 22, color: iconColor ?? context.secondary),
          const SizedBox(height: 12),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: valueColor ?? context.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: titleColor),
          ),
        ],
      ),
    );
  }
}
