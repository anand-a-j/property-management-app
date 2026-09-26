import 'package:flutter/material.dart';

import '../../../core/core.dart';


class PlatformDashboardScreen extends StatelessWidget {
  const PlatformDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: 'Platform Admin',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppConsts.pSide),
            child: _LogoutButton(
              onPressed: () {
                // Logout action handler
              },
            ),
          ),
        ],
      ),
    
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _DashboardHeaderOverview(),
              SizedBox(height: AppConsts.pSide),
              _ManagerListSection(),
            ],
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// HEADER OVERVIEW SECTION
// =============================================================================

class _DashboardHeaderOverview extends StatelessWidget {
  const _DashboardHeaderOverview();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.secondary,
      padding: const EdgeInsets.symmetric(
        horizontal: AppConsts.pSide,
        vertical: AppConsts.pSide,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Manage property groups and platform overview',
            style: context.bodyMedium?.copyWith(
              color: context.secondaryContainer,
            ),
          ),
          const SizedBox(height: AppConsts.pMedium),
          Row(
            children: const [
              Expanded(
                child: _StatCard(title: 'Total Manager', value: '12'),
              ),
              SizedBox(width: AppConsts.pSmall),
              Expanded(
                child: _StatCard(title: 'Active Users', value: '139'),
              ),
            ],
          ),
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
      padding: const EdgeInsets.all(AppConsts.pMedium),
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

// =============================================================================
// MANAGER LIST SECTION
// =============================================================================

class _ManagerListSection extends StatelessWidget {
  const _ManagerListSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Registered Manager',
            style: context.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: AppConsts.pMedium),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 8,
            separatorBuilder: (context, index) =>
                const SizedBox(height: AppConsts.pSmall),
            itemBuilder: (context, index) {
              return const _ManagerCard(
                name: 'Daniel Mathew',
                date: '05-09-2026',
                propertiesCount: 62,
                isActive: true,
              );
            },
          ),
          const SizedBox(height: AppConsts.pExtraLarge),
        ],
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

/// Fallback standard CustomAppBar component adhering to the design context spec
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final VoidCallback? leadingOnTap;
  final PreferredSizeWidget? bottom;
  final bool isAnimate;
  final bool isTabContain;
  final bool isSmallWidth;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor,
    this.actions,
    this.leadingOnTap,
    this.bottom,
    this.isAnimate = false,
    this.isTabContain = false,
    this.isSmallWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: context.titleLarge?.copyWith(
          color: context.onPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: backgroundColor ?? context.secondary,
      elevation: 0,
      centerTitle: false,
      actions: actions,
      bottom: bottom,
      leading: leadingOnTap != null
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: context.onPrimary),
              onPressed: leadingOnTap,
            )
          : null,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
