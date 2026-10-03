import 'package:flutter/material.dart';
import 'package:naseem/core/core.dart';

class ErrorStateView extends StatelessWidget {
  final String message;
  final VoidCallback retryOnTap;
  final bool isHalf;

  const ErrorStateView({
    super.key,
    this.message = 'Something went wrong',
    required this.retryOnTap,
    this.isHalf = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: isHalf ? 250 : null,
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
                  color: context.error.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.error_outline_rounded,
                  size: 26,
                  color: context.error,
                ),
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
              const SizedBox(height: AppConsts.pMedium),
              CustomButton(
                label: 'Retry',
                onPressed: retryOnTap,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConsts.pLarge,
                  vertical: AppConsts.pSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
