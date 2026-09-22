import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habitroot/core/extension/common.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.padding = const EdgeInsets.all(0),
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        height: 49,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            HapticFeedback.lightImpact();
            onPressed();
          },
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(
                      color: context.onPrimary,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    label,
                    style: context.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: context.onPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
          ),
        ),
      ),
    );
  }
}
