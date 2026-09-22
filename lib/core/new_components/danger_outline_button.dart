import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naseem/core/extension/common.dart';

class DangerOutlinedButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final EdgeInsetsGeometry padding;

  const DangerOutlinedButton({
    super.key,
    required this.label,
    required this.onTap,
    this.padding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    final color = context.error;

    return Padding(
      padding: padding,
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: color,
            side: BorderSide(color: color),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            HapticFeedback.lightImpact();
            onTap();
          },
          child: Text(
            label,
            style: context.bodyLarge?.copyWith(
              fontWeight: FontWeight.w400,
              color: color,
              height: 1,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
