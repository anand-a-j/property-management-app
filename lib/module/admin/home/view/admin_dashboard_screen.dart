import 'package:flutter/material.dart';
import 'package:naseem/core/core.dart';

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
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 2,
            children: [
              Text(
                "Good Morning",
                style: context.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Daneil Mathew",
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
                  value: "12",
                  borderColor: context.surface,
                  titleColor: context.secondary,
                  valueColor: context.primary,
                ),
              ),
              Expanded(
                child: StatCard(
                  title: "Occupied",
                  value: "12",
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
                  title: "Total Units",
                  value: "12",
                  borderColor: context.surface,
                  titleColor: context.secondary,
                  valueColor: context.primary,
                ),
              ),
              Expanded(
                child: StatCard(
                  title: "Occupied",
                  value: "12",
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
                  value: "12",
                  borderColor: context.surface,
                  titleColor: context.secondary,
                  valueColor: Colors.amber,
                ),
              ),
              Expanded(
                child: StatCard(
                  title: "Maintaince",
                  value: "12",
                  borderColor: context.surface,
                  titleColor: context.secondary,
                  valueColor: Colors.red,
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
                  value: "5600 AED",
                  borderColor: context.surface,
                  titleColor: context.secondary,
                  valueColor: Colors.amber,
                ),
              ),
              Expanded(
                child: StatCard(
                  title: "Overdue",
                  value: "6",
                  borderColor: context.surface,
                  titleColor: context.secondary,
                  valueColor: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
