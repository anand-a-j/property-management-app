import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class SettingsCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData? icon;
  final bool showTrailingIcon;

  const SettingsCard({
    super.key,
    required this.title,
    required this.onTap,
    this.icon,
    this.showTrailingIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: context.surface, width: 1.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 5.0,
        ),
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: context.surface.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Icon(icon ?? Icons.circle, color: context.secondary, size: 20),
        ),
        title: Text(
          title,
          style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
        ),
        trailing: showTrailingIcon
            ? Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: context.secondary,
              )
            : null,
        onTap: onTap,
      ),
    );
  }
}
