import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';
import '../../../../model/staff_maintenance_overview.dart';

class MaintenanceDashboardHeader extends StatelessWidget {
  const MaintenanceDashboardHeader({super.key, required this.overview});

  final StaffMaintenanceOverview overview;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.secondary,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
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
                child: _MaintenanceStatCard(
                  title: 'Total Tickets',
                  value: overview.totalTickets,
                  icon: Icons.confirmation_number_outlined,
                ),
              ),
              const SizedBox(width: AppConsts.pSmall),
              Expanded(
                child: _MaintenanceStatCard(
                  title: 'Pending Review',
                  value: overview.pendingReview,
                  icon: Icons.pending_actions_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConsts.pSmall),
          Row(
            children: [
              Expanded(
                child: _MaintenanceStatCard(
                  title: 'In Progress',
                  value: overview.activeTickets,
                  icon: Icons.engineering_outlined,
                ),
              ),
              const SizedBox(width: AppConsts.pSmall),
              Expanded(
                child: _MaintenanceStatCard(
                  title: 'Completed',
                  value: overview.completedTickets,
                  icon: Icons.task_alt_outlined,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MaintenanceStatCard extends StatelessWidget {
  const _MaintenanceStatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final int value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConsts.pMedium),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 22, color: context.secondary),
          const SizedBox(height: 12),
          Text(
            value.toString(),
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
