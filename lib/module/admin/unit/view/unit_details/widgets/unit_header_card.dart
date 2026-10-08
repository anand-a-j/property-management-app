import 'package:flutter/material.dart';
import 'package:naseem/core/widgets/status_tag.dart';
import 'package:naseem/module/admin/community/model/community.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/enum/unit_status.dart';
import '../../../model/unit.dart';

class UnitHeaderCard extends StatelessWidget {
  const UnitHeaderCard({
    super.key,
    required this.unit,
    required this.community,
  });

  final Unit unit;
  final Community community;

  @override
  Widget build(BuildContext context) {
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
              color: context.surface.withValues(alpha: 0.2),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(7),
                bottomLeft: Radius.circular(7),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.apartment,
                size: 36,
                color: context.secondaryContainer,
              ),
            ),
          ),

          const SizedBox(width: 15),
          // Unit Details Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        unit.name,
                        style: context.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    const SizedBox(width: 8),

                    StatusTag(
                      status: unit.status?.label ?? 'Unassigned',
                      color: unit.status?.color ?? Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  community.name,
                  style: context.bodySmall?.copyWith(
                    color: context.secondary.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 2),
                // Text(
                //   unit.description,
                //   style: context.bodySmall?.copyWith(
                //     color: context.secondary.withValues(alpha: 0.7),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
