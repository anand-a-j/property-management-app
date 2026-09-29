import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class CommunityCard extends StatelessWidget {
  final String title;
  final String? type;
  final String location;
  final int totalUnits;
  final int occupiedUnits;
  final int vacantUnits;
  final VoidCallback? onTap;

  const CommunityCard({
    super.key,
    required this.title,
    this.type,
    required this.location,
    required this.totalUnits,
    required this.occupiedUnits,
    required this.vacantUnits,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                    color: context.surface.withOpacity(0.2),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.apartment_rounded,
                      size: 40,
                      color: context.secondaryContainer,
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
                        title,
                        style: context.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (type != null && type!.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        // Property Type
                        Text(
                          type!,
                          style: context.bodySmall?.copyWith(
                            color: context.secondaryContainer,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                      const SizedBox(height: 2),
                      // Location
                      Text(
                        location,
                        style: context.bodySmall?.copyWith(
                          color: context.secondaryContainer,
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
                            count: totalUnits.toString(),
                            label: 'Units',
                          ),
                          _buildStatColumn(
                            context,
                            count: occupiedUnits.toString(),
                            label: 'Occupied',
                          ),
                          _buildStatColumn(
                            context,
                            count: vacantUnits.toString(),
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
          style: context.bodySmall?.copyWith(color: context.secondaryContainer),
        ),
      ],
    );
  }
}

extension on BuildContext {
  Color? get scaffoldBackgroundColor => null;
}
