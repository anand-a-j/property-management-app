import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class ResidentCard extends StatelessWidget {
  final String name;
  final String unit;
  final String residence;
  final String? avatarUrl;
  final VoidCallback? onTap;

  const ResidentCard({
    super.key,
    required this.name,
    required this.unit,
    required this.residence,
    this.avatarUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: context.surface, width: 1.0),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: context.surface,
              backgroundImage: avatarUrl != null
                  ? NetworkImage(avatarUrl!)
                  : null,
            ),
            const SizedBox(width: 10), // pSmall
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: context.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5), // pMicro
                  Text(
                    'Unit: $unit  |  $residence',
                    style: context.bodyMedium?.copyWith(
                      color: context.secondaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
