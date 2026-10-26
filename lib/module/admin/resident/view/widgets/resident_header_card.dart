import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../model/resident_list_response.dart';

class ResidentHeaderCard extends StatelessWidget {
  const ResidentHeaderCard({super.key, required this.resident});

  final ResidentListResponse resident;

  @override
  Widget build(BuildContext context) {

    final residentName = resident.profile.name ?? 'Unknown Resident';

    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(
        horizontal: AppConsts.pSide,
        vertical: AppConsts.pMedium,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: AppColorScheme.backgroundColor(2),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(7),
                bottomLeft: Radius.circular(7),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.person_outline,
                size: 36,
                color: AppColorScheme.iconColor(2),
              ),
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  residentName,
                  style: context.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 4),

                Text(
                  resident.profile?.email ?? '',
                  style: context.bodySmall?.copyWith(
                    color: context.secondary.withValues(alpha: 0.7),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 2),

                Text(
                  resident.profile?.phone ?? '',
                  style: context.bodySmall?.copyWith(
                    color: context.secondary.withValues(alpha: 0.5),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
