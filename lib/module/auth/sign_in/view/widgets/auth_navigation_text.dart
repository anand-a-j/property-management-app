import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/core.dart';
import '../../../../../core/enum/sign_up_type.dart';
import '../../../../../routes/router_path.dart';

class AuthNavigationText extends StatelessWidget {
  final bool isFromSignInScreen;

  const AuthNavigationText({super.key, this.isFromSignInScreen = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isFromSignInScreen) {
           context.push(RouterPath.signUp, extra: {'type': SignUpType.resident});
        } else {
          context.push(RouterPath.signIn);
        }
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
              color: context.secondary.withValues(alpha: 0.5),
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
