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
            child: Icon(
              Icons.person_2_outlined,
              color: AppColorScheme.iconColor(index),
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
                const SizedBox(height: 6),

                // Phone
                _StaffInfoRow(
                  icon: Icons.phone_outlined,
                  value: profile.phone ?? 'Not provided',
                  context: context,
                ),
                const SizedBox(height: 5),

                // Email
                _StaffInfoRow(
                  icon: Icons.email_outlined,
                  value: profile.email,
                  context: context,
                ),
                const SizedBox(height: 5),

                // Role
                Text(
                  profile.role.name.isNotEmpty
                      ? '${profile.role.name[0].toUpperCase()}${profile.role.name.substring(1)}'
                      : '',
                  style: context.bodyMedium?.copyWith(
                    color: context.secondary.withValues(alpha: 0.6),
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

class _StaffInfoRow extends StatelessWidget {
  final IconData icon;
  final String value;
  final BuildContext context;

  const _StaffInfoRow({
    required this.icon,
    required this.value,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: context.secondary.withValues(alpha: 0.6)),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            value,
            style: context.bodyMedium?.copyWith(
              color: context.secondary.withValues(alpha: 0.75),
            ),
          ),
        ),
      ],
    );
  }
}
