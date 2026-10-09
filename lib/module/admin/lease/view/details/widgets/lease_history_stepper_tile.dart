import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/extension/lease_stepper_status.dart';

class LeaseHistoryStepperTile extends StatelessWidget {
  final String title;
  final String date;
  final String? subtitle;
  final String? badgeText;
  final LeaseStepperStatus status;
  final bool isLast;
  final bool showActions;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  const LeaseHistoryStepperTile({
    super.key,
    required this.title,
    required this.date,
    this.subtitle,
    this.badgeText,
    this.status = LeaseStepperStatus.pending,
    this.isLast = false,
    this.showActions = false,
    this.onAccept,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = status == LeaseStepperStatus.active;
    final bool isCompleted = status == LeaseStepperStatus.completed;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline Indicator
          SizedBox(
            width: 40,
            child: Column(
              children: [
                _buildIndicator(context, isCompleted, isActive),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: isCompleted
                          ? context.primary
                          : context.surface.withOpacity(0.5),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppConsts.pSmall),

          // Content Card
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: AppConsts.pMedium),
              padding: EdgeInsets.all(
                isActive ? AppConsts.pMedium : AppConsts.pSmall,
              ),
              decoration: BoxDecoration(
                color: isActive
                    ? context.primary.withOpacity(0.05)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(AppConsts.rSmall),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: context.bodyLarge?.copyWith(
                            fontWeight: isActive
                                ? FontWeight.w600
                                : FontWeight.w500,
                            color: isActive
                                ? context.primary
                                : context.secondary,
                          ),
                        ),
                      ),
                      if (badgeText != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppConsts.pSmall,
                            vertical: AppConsts.pMicro,
                          ),
                          decoration: BoxDecoration(
                            color: context.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(
                              AppConsts.rMicro,
                            ),
                          ),
                          child: Text(
                            badgeText!,
                            style: context.labelLarge?.copyWith(
                              color: context.primary,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: AppConsts.pMicro),
                  if (subtitle != null) ...[
                    Text(
                      subtitle!,
                      style: context.bodySmall?.copyWith(
                        color: context.secondaryContainer,
                      ),
                    ),
                    const SizedBox(height: AppConsts.pMicro),
                  ],
                  Text(
                    date,
                    style: context.bodySmall?.copyWith(
                      color: context.secondaryContainer,
                    ),
                  ),

                  // Action Buttons for specific flows
                  if (showActions) ...[
                    const SizedBox(height: AppConsts.pMedium),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            label: 'Accept',
                            padding: const EdgeInsets.symmetric(
                              vertical: AppConsts.pSmall,
                            ),
                            onPressed: onAccept ?? () {},
                          ),
                        ),
                        const SizedBox(width: AppConsts.pSmall),
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: context.error),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppConsts.rSmall,
                                ),
                              ),
                            ),
                            onPressed: onReject ?? () {},
                            child: Text(
                              'Reject',
                              style: context.bodyMedium?.copyWith(
                                color: context.error,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(
    BuildContext context,
    bool isCompleted,
    bool isActive,
  ) {
    if (isCompleted) {
      return Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: context
              .primary, // Using primary since no specific success color is in the theme
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.check, size: 16, color: context.onPrimary),
      );
    } else if (isActive) {
      return Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: context.primary.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: context.primary,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: context.surface, width: 2),
        ),
      );
    }
  }
}
