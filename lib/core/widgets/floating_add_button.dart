import 'package:flutter/material.dart';
import 'package:naseem/core/core.dart';

class FloatingAddButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const FloatingAddButton({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: context.primary,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, size: 20, color: context.onPrimary),
            const SizedBox(width: 8),
            Text(
              title,
              style: context.bodyMedium?.copyWith(
                color: context.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
