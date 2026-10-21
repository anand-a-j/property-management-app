import 'package:flutter/material.dart';
import 'package:naseem/core/widgets/status_tag.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/enum/unit_status.dart';
import '../../../model/unit.dart';

class UnitCard extends StatelessWidget {
  final Unit unit;
  final int index;

  const UnitCard({super.key, required this.unit, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.surface, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image / placeholder
          Container(
            width: 105,
            height: 105,
            decoration: BoxDecoration(
              color: AppColorScheme.backgroundColor(index),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(7),
                bottomLeft: Radius.circular(7),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.apartment,
                size: 36,
                color: AppColorScheme.iconColor(index),
              ),
            ),
          ),

          // Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Unit name + status
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

                  const SizedBox(height: 4),

                  // Area / Size
                  Text(
                    unit.unitType ?? "",
                    style: context.bodySmall?.copyWith(
                      color: context.secondary.withValues(alpha: 0.75),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),

                  // Area / Size
                  Text(
                    unit.area,
                    style: context.bodySmall?.copyWith(
                      color: context.secondary.withValues(alpha: 0.5),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),

                  // Description
                  Text(
                    unit.description,
                    style: context.bodySmall?.copyWith(
                      color: context.secondary.withValues(alpha: 0.5),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
