import 'package:flutter/material.dart';

class DebugContainer extends StatelessWidget {
  const DebugContainer({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(width: 0.5, color: Colors.red),
      ),
      child: child,
    );
  }
}
