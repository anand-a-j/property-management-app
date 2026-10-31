import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/core.dart';
import 'package:naseem/core/utils/string_utils.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';

import '../../../../core/widgets/stats_card.dart';
import '../../recent_activity/controller/bloc/recent_activity_bloc.dart';
import '../../recent_activity/view/recent_activity_list_view.dart';
import '../controller/cubit/dashboard_stats_cubit.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  @override
  void initState() {
    super.initState();

    context.read<DashboardStatsCubit>().refresh(
      orgId: authentication.profile?.orgId ?? "",
    );

    context.read<RecentActivityBloc>().add(const RefreshRecentActivities());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppHorizontalPadding(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          StrHelper.getGreeting(),
                          style: context.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            height: 1.6,
                          ),
                        ),
                        Text(
                          authentication.profile?.name ?? "",
                          style: context.titleMedium?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Here is what happen today",
                          style: context.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: context.secondary.withValues(alpha: 0.5),
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColorScheme.backgroundColor(4),
                    child: Icon(
                      Icons.person_outline,
                      size: 28,
                      color: AppColorScheme.iconColor(4),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              BlocBuilder<DashboardStatsCubit, DashboardStatsState>(
                builder: (context, state) {
                  final stats = state.stats;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        spacing: 12,
                        children: [
                          Expanded(
                            child: StatCard(
                              title: "Total Units",
                              icon: Icons.apartment_rounded,
                              iconColor: context.primary,
                              bgColor: context.primary.withValues(alpha: 0.06),
                              value: "${stats.totalUnits}",
                              borderColor: context.primary.withValues(
                                alpha: 0.12,
                              ),
                              titleColor: context.secondary,
                              valueColor: context.primary,
                            ),
                          ),
                          Expanded(
                            child: StatCard(
                              title: "Occupied",
                              icon: Icons.people_alt_outlined,
                              iconColor: Colors.green.shade700,
                              bgColor: Colors.green.withValues(alpha: 0.06),
                              value: "${stats.occupied}",
                              borderColor: Colors.green.withValues(alpha: 0.20),
                              titleColor: context.secondary,
                              valueColor: Colors.green.shade700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        spacing: 12,
                        children: [
                          Expanded(
                            child: StatCard(
                              title: "Vacant",
                              icon: Icons.door_front_door_outlined,
                              iconColor: Colors.orange.shade800,
                              bgColor: Colors.orange.withValues(alpha: 0.06),
                              value: "${stats.vacant}",
                              borderColor: Colors.orange.withValues(
                                alpha: 0.20,
                              ),
                              titleColor: context.secondary,
                              valueColor: Colors.orange.shade800,
                            ),
                          ),
                          Expanded(
                            child: StatCard(
                              title: "Maintenance",
                              icon: Icons.build_outlined,
                              iconColor: context.error,
                              bgColor: context.error.withValues(alpha: 0.06),
                              value: "${stats.maintenance}",
                              borderColor: context.error.withValues(
                                alpha: 0.20,
                              ),
                              titleColor: context.secondary,
                              valueColor: context.error,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        spacing: 12,
                        children: [
                          Expanded(
                            child: StatCard(
                              title: "Overdue",
                              icon: Icons.event_busy_outlined,
                              iconColor: context.error,
                              bgColor: context.error.withValues(alpha: 0.06),
                              value: "${stats.overdueCount}",
                              borderColor: context.error.withValues(
                                alpha: 0.20,
                              ),
                              titleColor: context.secondary,
                              valueColor: context.error,
                            ),
                          ),
                          Expanded(
                            child: StatCard(
                              title: "Rent Collected",
                              icon: Icons.account_balance_wallet_outlined,
                              iconColor: Colors.teal.shade700,
                              bgColor: Colors.teal.withValues(alpha: 0.06),
                              value: "${stats.rentCollected} AED",
                              borderColor: Colors.teal.withValues(alpha: 0.20),
                              titleColor: context.secondary,
                              valueColor: Colors.teal.shade700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              Text(
                'Recent Activity',
                style: context.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppConsts.pMedium),
              RecentActivityList(),
            ],
          ),
        ),
      ),
    );
  }
}
