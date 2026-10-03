import 'package:flutter/material.dart';
import 'package:naseem/core/core.dart';
import 'package:naseem/core/utils/string_utils.dart';
import 'package:naseem/core/widgets/empty_state_view.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';

import '../../../../core/widgets/stats_card.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppHorizontalPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 2,
              children: [
                const SizedBox(height: 15),
                Text(
                  StringUtils.getGreeting(),
                  style: context.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  authentication.profile?.name ?? "",
                  style: context.titleMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "Here is what happen today",
                  style: context.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: context.secondary.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Expanded(
                  child: StatCard(
                    title: "Total Units",
                    value: "0",
                    borderColor: context.surface,
                    titleColor: context.secondary,
                    valueColor: context.primary,
                  ),
                ),
                Expanded(
                  child: StatCard(
                    title: "Occupied",
                    value: "0",
                    borderColor: context.surface,
                    titleColor: context.secondary,
                    valueColor: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Expanded(
                  child: StatCard(
                    title: "Vacant",
                    value: "0",
                    borderColor: context.surface,
                    titleColor: context.secondary,
                    valueColor: context.error,
                  ),
                ),
                Expanded(
                  child: StatCard(
                    title: "Maintaince",
                    value: "0",
                    borderColor: context.surface,
                    titleColor: context.secondary,
                    valueColor: context.error,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Expanded(
                  child: StatCard(
                    title: "Rent Collected",
                    value: "0 AED",
                    borderColor: context.surface,
                    titleColor: context.secondary,
                    valueColor: Colors.amber,
                  ),
                ),
                Expanded(
                  child: StatCard(
                    title: "Overdue",
                    value: "0",
                    borderColor: context.surface,
                    titleColor: context.secondary,
                    valueColor: Colors.red,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Text(
              'Recent Activity',
              style: context.titleSmall?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: AppConsts.pMedium),
            EmptyStateView(
              isHalf: true,
              message:
                  'No recent activity yet. Activity will appear here as things happen.',
            ),
          ],
        ),
      ),
    );
  }
}
