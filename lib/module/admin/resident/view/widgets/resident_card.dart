import 'package:flutter/material.dart';
import 'package:naseem/module/auth/core/model/profile.dart';

import '../../../../../core/core.dart';

class ResidentCard extends StatelessWidget {
  final Profile profile;

  const ResidentCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.surface, width: 1.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: context.surface,
            
          ),
          const SizedBox(width: 10), // pSmall
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  profile.name,
                  style: context.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '',
                  style: context.bodyMedium?.copyWith(
                    color: context.secondaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
