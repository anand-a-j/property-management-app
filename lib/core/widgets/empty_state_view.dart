import 'package:flutter/material.dart';

import '../core.dart';

class EmptyStateView extends StatelessWidget {
  final String message;
  final IconData icon;
  final bool isHalf;

  const EmptyStateView({
    super.key,
    this.message = 'No data available',
    this.icon = Icons.inbox_outlined,
    this.isHalf = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: isHalf ? 180 : null,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppConsts.pLarge),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: context.primary.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 26, color: context.primary),
              ),
              const SizedBox(height: AppConsts.pMedium),
              Text(
                message,
                textAlign: TextAlign.center,
                style: context.bodyMedium?.copyWith(
                  color: context.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
