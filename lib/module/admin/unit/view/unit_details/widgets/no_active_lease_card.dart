import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';

class NoActiveLeaseCard extends StatelessWidget {
  const NoActiveLeaseCard({super.key,required this.onCreateLease});

  final void Function() onCreateLease;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppConsts.pSide,
        vertical: 25,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.surface, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon
          Icon(Icons.assignment_outlined, size: 28, color: context.primary),

          const SizedBox(height: 12),

          // Title
          Text(
            'No Active Lease',
            style: context.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 6),

          // Description
          Text(
            'This unit doesn’t have an active lease yet. '
            'Create a lease to assign a resident to this unit.',
            textAlign: TextAlign.center,
            style: context.bodySmall?.copyWith(
              color: context.secondaryContainer,
            ),
          ),

          const SizedBox(height: 15),

          // Action
          CustomButton(label: 'Create Lease', onPressed: onCreateLease),
        ],
      ),
    );
  }
}
