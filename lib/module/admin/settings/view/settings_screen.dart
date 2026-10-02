import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import 'widgets/settings_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Settings'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0, // pSide = 20
            vertical: 15.0, // pMedium = 15
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Profile Header Section
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile Avatar
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: context.surface,
                      borderRadius: BorderRadius.circular(12.0), // rMedium = 12
                    ),
                  ),
                  const SizedBox(width: 15), // pMedium = 15
                  // User Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sai Kumar',
                          style: context.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5), // pMicro = 5
                        Text(
                          'Manager',
                          style: context.bodyMedium?.copyWith(
                            color: context.secondaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Edit Action Text Button
                  GestureDetector(
                    onTap: () {
                      // Handle edit action
                    },
                    child: Text(
                      'Edit',
                      style: context.titleSmall?.copyWith(
                        color: context.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25), // pLarge = 25
              // "More" Section Header
              Text(
                'Management',
                style: context.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15), // pMedium = 15
              // Navigation Card Options List
              SettingsCard(
                icon: Icons.person_outline,
                title: 'Staffs',
                onTap: () {},
              ),
              const SizedBox(height: 10), // pSmall = 10
              SettingsCard(
                icon: Icons.supervisor_account_outlined,
                title: 'Visors',
                onTap: () {},
              ),
              const SizedBox(height: 10), // pSmall = 10
              SettingsCard(
                icon: Icons.groups_outlined,
                title: 'Manage Lease',
                showTrailingIcon: true,
                onTap: () {},
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomButton(
        label: "LogOut",
        onPressed: () {},
        padding: const EdgeInsetsGeometry.all(AppConsts.pSide),
      ),
    );
  }
}
