import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class PlatformLogoutButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PlatformLogoutButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.error,
          foregroundColor: context.onPrimary,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: AppConsts.pMedium),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          'Logout',
          style: context.bodySmall?.copyWith(
            color: context.onPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
