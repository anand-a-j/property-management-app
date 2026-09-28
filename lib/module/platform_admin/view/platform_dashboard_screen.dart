import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/widgets/floating_add_button.dart';
import 'package:naseem/module/platform_admin/view/widgets/platform_appbar.dart';

import '../../../core/core.dart';
import '../../../core/enum/sign_up_type.dart';
import '../../../routes/router_path.dart';
import '../../auth/core/controller/bloc/auth_bloc.dart';
import '../../auth/core/controller/bloc/auth_event.dart';
import '../../auth/core/controller/bloc/auth_state.dart';
import '../../auth/core/model/profile.dart';
import '../controller/bloc/manager_bloc.dart';
import '../model/manager_response.dart';

class PlatformDashboardScreen extends StatefulWidget {
  const PlatformDashboardScreen({super.key});

  @override
  State<PlatformDashboardScreen> createState() =>
      _PlatformDashboardScreenState();
}

class _PlatformDashboardScreenState extends State<PlatformDashboardScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ManagerBloc>().add(const FetchManagers());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.go(RouterPath.welcome);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: PlatformAppBar(
          title: 'Platform Admin',
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: AppConsts.pSide),
              child: _LogoutButton(
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
                      context.read<AuthBloc>().add(const AuthSignOut());
                    },
                  );
                },
              ),
            ),
          ],
        ),

        body: SafeArea(
          child: BlocBuilder<ManagerBloc, ManagerState>(
            builder: (context, state) {
              if (state is ManagerLoading) {
                return const _DashboardLoading();
              }

              if (state is ManagerFailed) {
                return _DashboardError(
                  message: state.error,
                  onRetry: () {
                    context.read<ManagerBloc>().add(const FetchManagers());
                  },
                );
              }

              if (state is ManagerSuccess) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _DashboardHeaderOverview(response: state.response),
                      const SizedBox(height: AppConsts.pSide),
                      _ManagerListSection(managers: state.response.managers),
                    ],
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
        floatingActionButton: FloatingAddButton(
          title: "Add Manager",
          onTap: () {
            context.push(
              RouterPath.signUp,
              extra: {'type': SignUpType.manager},
            );
          },
        ),
      ),
    );
  }
}

class _DashboardHeaderOverview extends StatelessWidget {
  final ManagerResponse response;

  const _DashboardHeaderOverview({required this.response});

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
            'Manage property groups and platform overview',
            style: context.bodyMedium?.copyWith(
              color: context.secondaryContainer,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  title: 'Total Manager',
                  value: response.totalManagers.toString(),
                ),
              ),
              const SizedBox(width: AppConsts.pSmall),
              Expanded(
                child: _StatCard(
                  title: 'Total Users',
                  value: response.activeUsers.toString(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;

  const _StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: context.secondaryContainer.withOpacity(0.4),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: context.bodyMedium?.copyWith(
              color: context.onPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppConsts.pSmall),
          Text(
            value,
            style: context.titleLarge?.copyWith(
              color: context.primary,
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ManagerListSection extends StatelessWidget {
  final List<Profile> managers;

  const _ManagerListSection({required this.managers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Registered Managers',
            style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: AppConsts.pMedium),
          if (managers.isEmpty)
            const _EmptyManagers()
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: managers.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: AppConsts.pSmall),
              itemBuilder: (context, index) {
                final manager = managers[index];

                return _ManagerCard(
                  name: manager.name,
                  date: _formatDate(manager.createdAt),
                  propertiesCount: 0,
                  isActive: manager.deletedAt == null,
                );
              },
            ),
          const SizedBox(height: AppConsts.pExtraLarge),
        ],
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '-';

    return '${date.day.toString().padLeft(2, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.year}';
  }
}

class _DashboardLoading extends StatelessWidget {
  const _DashboardLoading();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConsts.pSide),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: AppConsts.pMedium),
            Text('Loading dashboard...', style: context.bodyMedium),
            const SizedBox(height: AppConsts.pSmall),
            Text(
              'Please wait while we fetch the latest manager details.',
              textAlign: TextAlign.center,
              style: context.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _DashboardError({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConsts.pSide),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.cloud_off_rounded,
              size: 48,
              color: context.colorScheme.error,
            ),
            const SizedBox(height: AppConsts.pMedium),
            Text(
              'Unable to load dashboard',
              textAlign: TextAlign.center,
              style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: AppConsts.pSmall),
            Text(
              'We couldn’t load the manager details right now. '
              'Please try again.',
              textAlign: TextAlign.center,
              style: context.bodyMedium,
            ),
            const SizedBox(height: AppConsts.pSmall),
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.bodySmall,
            ),
            const SizedBox(height: AppConsts.pMedium),
            ElevatedButton(onPressed: onRetry, child: const Text('Try Again')),
          ],
        ),
      ),
    );
  }
}

class _EmptyManagers extends StatelessWidget {
  const _EmptyManagers();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppConsts.pExtraLarge),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.people_outline_rounded,
              size: 48,
              color: context.colorScheme.outline,
            ),
            const SizedBox(height: AppConsts.pMedium),
            Text(
              'No managers yet',
              style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: AppConsts.pSmall),
            Text(
              'Add a manager to get started.',
              textAlign: TextAlign.center,
              style: context.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _ManagerCard extends StatelessWidget {
  final String name;
  final String date;
  final int propertiesCount;
  final bool isActive;

  const _ManagerCard({
    required this.name,
    required this.date,
    required this.propertiesCount,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConsts.pMedium),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: context.secondaryContainer.withOpacity(0.5),
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: AppConsts.pSide,
            backgroundColor: context.surface.withOpacity(0.4),
          ),
          const SizedBox(width: AppConsts.pSmall),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: context.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppConsts.pMicro),
                Text(
                  '$date  |  Properties: $propertiesCount',
                  style: context.bodySmall?.copyWith(
                    color: context.secondaryContainer,
                  ),
                ),
              ],
            ),
          ),
          if (isActive) const _StatusBadge(label: 'Active'),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String label;

  const _StatusBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConsts.pSmall,
        vertical: AppConsts.pMicro,
      ),
      decoration: BoxDecoration(
        color: const Color(0XFFE8F8EE), // Soft green container background
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        label,
        style: context.bodySmall?.copyWith(
          color: const Color(0XFF27AE60), // Status green text
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// =============================================================================
// UTILITY COMPONENTS
// =============================================================================

class _LogoutButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _LogoutButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.error,
          foregroundColor: context.onPrimary,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: AppConsts.pMedium),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          'Logout',
          style: context.bodySmall?.copyWith(
            color: context.onPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
