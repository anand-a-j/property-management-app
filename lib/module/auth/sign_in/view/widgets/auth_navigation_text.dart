import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class AuthNavigationText extends StatelessWidget {
  final bool isFromSignInScreen;

  const AuthNavigationText({super.key, this.isFromSignInScreen = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Add navigation later.
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            isFromSignInScreen
                ? "Don't have an account? "
                : "Already have an account? ",
            style: context.bodyMedium?.copyWith(
              color: context.primary,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 2),
          Text(
            isFromSignInScreen ? "Sign up here" : "Sign in here",
            style: context.bodyMedium?.copyWith(
              color: context.primary,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
              decorationColor: context.primary,
            ),
          ),
        ],
      ),
    );
  }
}
