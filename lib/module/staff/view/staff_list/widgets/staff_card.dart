import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../../auth/core/model/profile.dart';

class StaffCard extends StatelessWidget {
  final Profile profile;

  const StaffCard({super.key, required this.profile});

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
        children: [
          CircleAvatar(radius: 25, backgroundColor: context.surface),
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
                  profile.role.name.isNotEmpty
                      ? '${profile.role.name[0].toUpperCase()}${profile.role.name.substring(1)}'
                      : '',
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
