import 'package:flutter/material.dart';

import '../../../../core/core.dart';

/// Fallback standard PlatformAppBar component adhering to the design context spec
class PlatformAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final VoidCallback? leadingOnTap;
  final PreferredSizeWidget? bottom;
  final bool isAnimate;
  final bool isTabContain;
  final bool isSmallWidth;

  const PlatformAppBar({
    super.key,
    required this.title,
    this.backgroundColor,
    this.actions,
    this.leadingOnTap,
    this.bottom,
    this.isAnimate = false,
    this.isTabContain = false,
    this.isSmallWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: context.titleMedium?.copyWith(
          color: context.onPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: backgroundColor ?? context.secondary,
      elevation: 0,
      centerTitle: false,
      actions: actions,
      bottom: bottom,
      leading: leadingOnTap != null
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: context.onPrimary),
              onPressed: leadingOnTap,
            )
          : null,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
