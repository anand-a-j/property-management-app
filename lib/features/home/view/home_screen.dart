import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habitroot/core/components/custom_dialog.dart';
import 'package:habitroot/core/extension/common.dart';
import 'package:habitroot/features/home/view/dashboard/dashboard_screen.dart';
import 'package:habitroot/features/product/view/product_list/product_list_screen.dart';
import 'package:habitroot/features/settings/view/settings/settings_screen.dart';

import '../controller/provider/home_provider.dart';
import 'widgets/home_nav_bar.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();

    final homeProvider = context.read<HomeProvider>();

    _pageController = PageController(initialPage: homeProvider.index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onIndexChanged(int newIndex) {
    final homeProvider = context.read<HomeProvider>();
    final currentIndex = homeProvider.index;

    homeProvider.setCurrentIndex(newIndex);

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
    final currentIndex = context.watch<HomeProvider>().index;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        if (currentIndex != 0) {
          _onIndexChanged(0);
        } else {
          CustomDialog.confirmationDialog(
            context: context,
            title: "Exit App",
            subTitle: "Are you sure you want to leave the app?",
            cancelTitle: "Stay",
            sumbitTitle: "Exit",
            cancelOnTap: () => Navigator.pop(context),
            sumbitOnTap: () {
              Navigator.pop(context);
              SystemNavigator.pop();
            },
          );
        }
      },
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          allowImplicitScrolling: false,
          children: const [
            DashboardScreen(),
            ProductListScreen(),
            SettingsScreen(),
          ],
        ),
        bottomNavigationBar: ColoredBox(
          color: context.onPrimary,
          child: SafeArea(
            child: HomeNavigationBar(
              selectedIndex: currentIndex,
              onDestinationChange: _onIndexChanged,
            ),
          ),
        ),
      ),
    );
  }
}
