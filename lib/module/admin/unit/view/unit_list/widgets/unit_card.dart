import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';

class UnitCard extends StatelessWidget {
  const UnitCard({super.key});


  @override
  Widget build(BuildContext context) {
    // Dummy values representing the design context and image
    const String unitNumber = 'MH-023';
    const String unitType = 'Studio';
    const String bedCount = '3 Bed Room';
    const String tenantName = 'Ram Kumar Sai Home';
    const String statusText = 'Occupied';

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.surface, width: 1.0),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left side grey image placeholder
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: context.surface.withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8 - 1),
                    bottomLeft: Radius.circular(8 - 1),
                  ),
                ),
              ),
            ),

            // Right side details section
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Unit Code/Number
                        Expanded(
                          child: Text(
                            unitNumber,
                            style: context.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Status Badge/Chip
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            statusText,
                            style: context.labelLarge?.copyWith(
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    // Room Specs
                    Text(
                      '$unitType  |  $bedCount',
                      style: context.bodySmall?.copyWith(
                        color: context.secondaryContainer,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    // Resident / Tenant Name
                    Text(
                      tenantName,
                      style: context.bodySmall?.copyWith(
                        color: context.secondaryContainer,
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
      ),
    );
  }
}
