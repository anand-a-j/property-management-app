import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/utils/snackbar_manager.dart';
import '../../../../../../routes/router_path.dart';
import '../../../../lease/controller/blocs/bloc/active_lease_bloc.dart';
import '../../../../lease/model/lease.dart';
import '../../../model/unit.dart';

class NoActiveLeaseCard extends StatelessWidget {
  const NoActiveLeaseCard({super.key, required this.unit});

  final Unit unit;

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
            'No Lease Assigned',
            style: context.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 6),

          // Description
          Text(
            "This unit doesn't have a lease assigned yet. "
            'Assign an existing lease to link a resident '
            'and their lease details to this unit.',
            textAlign: TextAlign.center,
            style: context.bodySmall?.copyWith(
              color: context.secondary.withValues(alpha: 0.5),
            ),
          ),

          const SizedBox(height: 15),

          BlocConsumer<ActiveLeaseBloc, ActiveLeaseState>(
            listener: (context, state) {
              if (state is LeaseAssignSuccess) {
                Snack.success("Lease assigned to unit successfully.");
              } else if (state is LeaseAssignFailed) {
                Snack.error(state.message);
              }
            },
            builder: (context, state) {
              return CustomButton(
                label: 'Assign Existing Lease',
                isLoading: state is LeaseAssignLoading,
                onPressed: () async {
                  final lease = await context.push<Lease>(
                    RouterPath.leaseList,
                    extra: true,
                  );

                  if (lease != null && context.mounted) {
                    context.read<ActiveLeaseBloc>().add(
                      AssignLeaseToUnit(leaseId: lease.id, unitId: unit.id),
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
