import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extension/common.dart';

class AuthNavigationText extends StatelessWidget {
  final bool isFromSignInScreen;

  const AuthNavigationText({
    super.key,
    this.isFromSignInScreen = true,
  });

  @override
  Widget build(BuildContext context) {
    final isSignIn = isFromSignInScreen;

    return GestureDetector(
      onTap: () {
        if (isSignIn) {
          context.go("/signup");
        } else {
          context.go("/signin");
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isSignIn ? "Don’t have an account? " : "Already have an account? ",
            style: context.bodyMedium?.copyWith(
              color: context.primary,
            ),
          ),
          Text(
            isSignIn ? "Sign up" : "Sign in",
            style: context.bodyMedium?.copyWith(
              color: context.primary,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
