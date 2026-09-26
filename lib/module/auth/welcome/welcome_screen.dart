import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naseem/core/extension/common.dart';
import 'package:naseem/core/widgets/custom_button.dart';
import 'package:naseem/core/widgets/custom_dialog.dart';

import '../../../core/constants/constants.dart';

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
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: context.secondary.withValues(alpha: 0.45),
                ),
              ),
              Image.asset(Assets.welcome, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConsts.pSide,
                ),
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
                        const SizedBox(height: AppConsts.pSmall),
                        CustomButton(
                          label: "Sign In",

                          onPressed: () {},
                          color: context.primary,
                        ),

                        const SizedBox(height: 30),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
