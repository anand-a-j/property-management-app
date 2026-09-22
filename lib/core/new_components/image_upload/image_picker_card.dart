import 'package:flutter/material.dart';
import 'package:naseem/core/extension/common.dart';

class ImagePickerCard extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final String subTitle;

  const ImagePickerCard({
    super.key,
    required this.onTap,
    this.label = "Add Product Photo",
    this.subTitle = "P,ortrait (3:4)",
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.primary.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: context.primary.withValues(alpha: 0.2),
            width: 1.5,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_a_photo_rounded, size: 32, color: context.primary),
            const SizedBox(height: 12),
            Text(
              label,
              style: TextStyle(
                color: context.primary,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subTitle,
              style: TextStyle(
                color: context.secondary.withValues(alpha: 0.5),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
