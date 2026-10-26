import 'package:flutter/material.dart';
import 'package:naseem/module/admin/community/model/community.dart';

import '../../../../../core/core.dart';

class CommunityCard extends StatelessWidget {
  final Community community;
  final int index;

  const CommunityCard({
    super.key,
    required this.community,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: context.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.surface, width: 1.0),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left side thumbnail placeholder
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColorScheme.backgroundColor(index),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.apartment_rounded,
                    size: 40,
                    color: AppColorScheme.iconColor(index),
                  ),
                ),
              ),
            ),

            // Right side content
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Title
                    Text(
                      community.name??"",
                      style: context.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (community.communityType?.isNotEmpty??false) ...[
                      const SizedBox(height: 2),
                      // Property Type
                      Text(
                        community.communityType??"",
                        style: context.bodySmall?.copyWith(
                          color: context.onSecondary.withValues(alpha: 0.75),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    const SizedBox(height: 2),
                    // Location
                    Text(
                      community.address??"",
                      style: context.bodySmall?.copyWith(
                        color: context.secondary.withValues(alpha: 0.5),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 15),
                    // Metrics Row (Units, Occupied, Vacant)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStatColumn(
                          context,
                          count: "${community.totalUnits ?? "0"}",
                          label: 'Units',
                        ),
                        _buildStatColumn(
                          context,
                          count: "${community.occupiedUnits ?? "0"}",
                          label: 'Occupied',
                        ),
                        _buildStatColumn(
                          context,
                          count: "${community.vacantUnits ?? "0"}",
                          label: 'Vacant',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(
    BuildContext context, {
    required String count,
    required String label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          count,
          style: context.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: context.bodySmall?.copyWith(
            color: context.secondary.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}

extension on BuildContext {
  Color? get scaffoldBackgroundColor => null;
}
