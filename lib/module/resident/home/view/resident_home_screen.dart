import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/module/admin/maintainence/view/list/maintenance_list_screen.dart';
import 'package:naseem/module/admin/visitor/view/list/visitor_list_screen.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';
import 'package:naseem/module/resident/home/view/resident_dashboard_screen.dart';

import '../../../../core/bloc/cubit/app_cubit.dart';
import '../../../../core/core.dart';
import '../../../admin/payment/view/screen/list/payment_list_screen.dart';
import '../../../admin/settings/view/settings_screen.dart';
import 'widgets/resident_home_nav_bar.dart';

class ResidentHomeScreen extends StatefulWidget {
  const ResidentHomeScreen({super.key});

  @override
  State<ResidentHomeScreen> createState() => _ResidentHomeScreenState();
}

class _ResidentHomeScreenState extends State<ResidentHomeScreen> {
  late final PageController _pageController;
  late final AppCubit _appCubit;

  @override
  void initState() {
    super.initState();

    _appCubit = context.read<AppCubit>();

    _pageController = PageController(
      initialPage: _appCubit.state.residentDashIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onIndexChanged(int newIndex) {
    final currentIndex = _appCubit.state.residentDashIndex;

    _appCubit.setResidentDashIndex(newIndex);

    if ((newIndex - currentIndex).abs() == 1) {
      _pageController.animateToPage(
        newIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _pageController.jumpToPage(newIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.select<AppCubit, int>(
      (cubit) => cubit.state.residentDashIndex,
    );

    final orgId = authentication.profile?.orgId ?? "";
    final appCubit = context.read<AppCubit>().state;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        if (currentIndex != 0) {
          _onIndexChanged(0);
        } else {
          Navigator.pop(context);
        }
      },
      child: ColoredBox(
        color: context.onPrimary,
        child: SafeArea(
          child: Scaffold(
            body: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              allowImplicitScrolling: false,
              children: [
                ResidentDashboardScreen(),
                MaintenanceListScreen(
                  isFromResident: true,
                  unitId: appCubit.unitId,
                ),
                PaymentListScreen(
                  isFromResident: true,
                  leaseId: appCubit.leaseId,
                ),
                SettingsScreen(isFromResident: true),
              ],
            ),
            bottomNavigationBar: SafeArea(
              child: ResidentHomeNav(
                selectedIndex: currentIndex,
                onDestinationChange: _onIndexChanged,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
