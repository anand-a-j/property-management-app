import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extension/common.dart';
import '../../../../../routes/router_path.dart';

class ProductEmptyView extends StatelessWidget {
  final String title;
  final String subtitle;

  const ProductEmptyView({
    super.key,
    this.title = "Your shop is empty",
    this.subtitle =
        "Add your first product to start sharing your store link with customers.",
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. Emoji: "Shop" or "Package"
            // Simple and recognizable for local sellers
            const Text("📦", style: TextStyle(fontSize: 80)),
            const SizedBox(height: 24),

            // 2. Simple Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.bodyLarge?.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // 3. Simple, Relatable Subtitle
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: context.bodyMedium?.copyWith(
                fontSize: 16,
                height: 1.5,
                color: context.secondary.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: 32),

            // 4. Action Button
            const _AddProductButton(),

            // Extra spacing to balance the screen if inside a Scaffold
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

class _AddProductButton extends StatelessWidget {
  const _AddProductButton();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.onPrimary,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: () {
          HapticFeedback.mediumImpact();
          context.push(RouterPath.addEditProduct);
        },
        borderRadius: BorderRadius.circular(50),
        child: Container(
          decoration: BoxDecoration(
            color: context.primary,
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.add_circle_outline_rounded,
                size: 20,
                color: context.onPrimary,
              ),
              const SizedBox(width: 10),
              Text(
                "Add Product",
                style: TextStyle(
                  color: context.onPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
