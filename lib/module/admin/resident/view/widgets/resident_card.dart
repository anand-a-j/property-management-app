import 'package:flutter/material.dart';
import 'package:naseem/core/widgets/status_tag.dart';
import 'package:naseem/module/admin/resident/model/resident_list_response.dart';

import '../../../../../core/core.dart';
import '../../../../../core/enum/resident_status.dart';

class ResidentCard extends StatelessWidget {
  final ResidentListResponse resident;
  final int index;

  const ResidentCard({super.key, required this.resident, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: AppConsts.pMedium),
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
          const SizedBox(width: 10), // pSmall
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${resident.profileDetails?.firstName ?? ""} ${resident.profileDetails?.lastName}",
                      style: context.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    StatusTag(
                      status: resident.residentStatus.label,
                      color: resident.residentStatus.color,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  resident.profile.phone ?? "",
                  style: context.bodyMedium?.copyWith(
                    color: context.secondary.withValues(alpha: 0.75),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  resident.residentStatus == ResidentStatus.onboarding
                      ? "Getting started"
                      : resident.residentStatus == ResidentStatus.exited
                      ? "Former resident"
                      : "${resident.communityName ?? ""} · ${resident.currentUnitName ?? ""}",
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
