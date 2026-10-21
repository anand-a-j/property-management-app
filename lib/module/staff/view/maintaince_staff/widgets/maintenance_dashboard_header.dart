import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/widgets/stats_card.dart';

import '../../../model/staff_maintenance_overview.dart';

class MaintenanceDashboardHeader extends StatelessWidget {
  const MaintenanceDashboardHeader({super.key, required this.overview});

  final StaffMaintenanceOverview overview;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.secondary,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Track and manage your assigned maintenance tasks.',
            style: context.bodyMedium?.copyWith(
              color: context.secondaryContainer,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: StatCard(
                  title: 'Total Tickets',
                  value: overview.totalTickets.toString(),
                  icon: Icons.confirmation_number_outlined,
                  iconColor: context.primary,
                  borderColor: Colors.white24,
                  titleColor: context.onPrimary.withValues(alpha: 0.7),
                  valueColor: context.onPrimary,
                ),
              ),
              const SizedBox(width: AppConsts.pSmall),
              Expanded(
                child: StatCard(
                  title: 'Pending Review',
                  value: overview.pendingReview.toString(),
                  icon: Icons.pending_actions_outlined,
                  iconColor: Colors.orangeAccent,
                  borderColor: Colors.white24,
                  titleColor: context.onPrimary.withValues(alpha: 0.7),
                  valueColor: context.onPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConsts.pSmall),
          Row(
            children: [
              Expanded(
                child: StatCard(
                  title: 'In Progress',
                  value: overview.activeTickets.toString(),
                  icon: Icons.engineering_outlined,
                  iconColor: Colors.lightBlueAccent,
                  borderColor: Colors.white24,
                  titleColor: context.onPrimary.withValues(alpha: 0.7),
                  valueColor: context.onPrimary,
                ),
              ),
              const SizedBox(width: AppConsts.pSmall),
              Expanded(
                child: StatCard(
                  title: 'Completed',
                  value: overview.completedTickets.toString(),
                  icon: Icons.task_alt_outlined,
                  iconColor: Colors.greenAccent,
                  borderColor: Colors.white24,
                  titleColor: context.onPrimary.withValues(alpha: 0.7),
                  valueColor: context.onPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
