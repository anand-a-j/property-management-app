import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/bloc/cubit/app_cubit.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';
import 'package:naseem/routes/router_path.dart';

import '../../../../core/core.dart';
import '../../../auth/core/controller/bloc/auth_bloc.dart';
import '../../../auth/core/controller/bloc/auth_event.dart';
import '../../../auth/core/controller/bloc/auth_state.dart';
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
                          authentication.profile?.role.name != null
                              ? '${authentication.profile?.role.name[0].toUpperCase()}${authentication.profile?.role.name.substring(1)}'
                              : '',
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
                icon: Icons.badge_outlined,
                title: 'Staffs',
                onTap: () {
                  context.push(RouterPath.staffList);
                },
              ),

              const SizedBox(height: 10),

              SettingsCard(
                icon: Icons.manage_accounts_outlined,
                title: 'Visors',
                onTap: () {},
              ),

              const SizedBox(height: 10),

              SettingsCard(
                icon: Icons.assignment_turned_in_outlined,
                title: 'Manage Lease',
                showTrailingIcon: true,
                onTap: () {},
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLogoutSuccess) {
            context.go(RouterPath.welcome);
          }
        },
        child: CustomButton(
          label: "Logout",
          color: context.error,
          onPressed: () {
            CustomDialog.confirmationDialog(
              context: context,
              title: 'Sign Out',
              subTitle: 'Are you sure you want to sign out?',
              cancelTitle: 'Cancel',
              sumbitTitle: 'Sign Out',
              cancelOnTap: () {
                Navigator.pop(context);
              },
              sumbitOnTap: () {
                context.read<AppCubit>().setAdminDashIndex(0);
                context.read<AuthBloc>().add(const AuthSignOut());
              },
            );
          },
          padding: const EdgeInsetsGeometry.all(AppConsts.pSide),
        ),
      ),
    );
  }
}
