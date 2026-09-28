import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/cubit/app_cubit.dart';
import '../../../../core/core.dart';
import '../widgets/admin_home_nav_bar.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  late final PageController _pageController;
  late final AppCubit _appCubit;

  @override
  void initState() {
    super.initState();

    _appCubit = context.read<AppCubit>();

    _pageController = PageController(
      initialPage: _appCubit.state.adminDashIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onIndexChanged(int newIndex) {
    final currentIndex = _appCubit.state.adminDashIndex;

    _appCubit.setAdminDashIndex(newIndex);

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
      (cubit) => cubit.state.adminDashIndex,
    );

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        if (currentIndex != 0) {
          _onIndexChanged(0);
        } else {
          // Handle exit confirmation here if required.
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
              children: const [
                Scaffold(body: Text("Home")),
                Scaffold(body: Text("Property")),
                Scaffold(body: Text("Resident")),
                Scaffold(body: Text("Payment")),
                Scaffold(body: Text("More")),
              ],
            ),
            bottomNavigationBar: SafeArea(
              child: AdminHomeNavigationBar(
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
