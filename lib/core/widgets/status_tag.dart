import 'package:flutter/material.dart';

import '../core.dart';

class StatusTag extends StatelessWidget {
  const StatusTag({super.key, required this.status, required this.color});

  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        status,
        style: context.bodySmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w900,
          height: 1,
          fontSize: 11,
        ),
      ),
    );
  }
}
