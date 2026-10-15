import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../../auth/core/model/profile.dart';

class StaffCard extends StatelessWidget {
  final Profile profile;
  final int index;

  const StaffCard({super.key, required this.profile, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppConsts.pMedium),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.surface, width: 1.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: AppColorScheme.backgroundColor(index),
            child: Center(
              child: Icon(
                Icons.person_2_outlined,
                color: AppColorScheme.iconColor(index),
              ),
            ),
          ),
          const SizedBox(width: 10),
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
                  profile.phone ?? "",
                  style: context.bodyMedium?.copyWith(
                    color: context.secondary.withValues(alpha: 0.75),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  profile.role.name.isNotEmpty
                      ? '${profile.role.name[0].toUpperCase()}${profile.role.name.substring(1)}'
                      : '',
                  style: context.bodyMedium?.copyWith(
                    color: context.secondary.withValues(alpha: 0.5),
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
