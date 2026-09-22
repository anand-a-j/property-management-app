import 'package:flutter/material.dart';
import 'package:habitroot/core/constants/app_constants.dart';

class AppHorizontalPadding extends StatelessWidget {
  const AppHorizontalPadding({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: AppConsts.pSide),
      child: child,
    );
  }
}
