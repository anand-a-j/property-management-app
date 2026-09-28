import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/core.dart';
import 'package:naseem/core/extension/common.dart';
import 'package:naseem/core/widgets/custom_button.dart';
import 'package:naseem/core/widgets/custom_dialog.dart';
import 'package:naseem/routes/router_path.dart';

import '../../../core/constants/constants.dart';
import '../../../core/enum/sign_up_type.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        return CustomDialog.confirmationDialog(
          context: context,
          title: 'Exit',
          subTitle: 'Are you sure you want to exit the app?',
          cancelTitle: 'No',
          sumbitTitle: 'Yes',
          cancelOnTap: () {
            Navigator.pop(context);
          },
          sumbitOnTap: () {
            Navigator.pop(context);
            SystemNavigator.pop();
          },
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Image.asset(Assets.welcome, fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                color: context.secondary.withValues(alpha: 0.25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox.shrink(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Live comfortably, stay connected\nManage your home,\nlease & payments with ease.",
                        style: context.titleMedium?.copyWith(
                          color: context.onPrimary,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: AppConsts.pMedium),
                      CustomButton(
                        label: "Sign In",

                        onPressed: () {
                          context.push(RouterPath.signIn);
                        },
                        color: AppColorScheme.primaryFixed,
                      ),
                      const SizedBox(height: AppConsts.pMedium),
                      CustomButton(
                        label: "Sign Up",

                        onPressed: () {
                         context.push(
                            RouterPath.signUp,
                            extra: {'type': SignUpType.resident},
                          );
                        },
                        color: context.primary,
                      ),
                      SafeArea(child: const SizedBox(height: 15)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
