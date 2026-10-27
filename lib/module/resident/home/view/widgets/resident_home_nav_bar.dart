import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../../admin/home/widgets/admin_home_nav_bar.dart';

class ResidentHomeNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onDestinationChange;

  const ResidentHomeNav({
    super.key,
    required this.selectedIndex,
    required this.onDestinationChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,
      decoration: BoxDecoration(
        color: context.onPrimary,
        border: Border(
          top: BorderSide(width: 0.5, color: context.secondaryContainer),
        ),
        boxShadow: [
          BoxShadow(
            color: context.secondary.withValues(alpha: 0.06),
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: context.onPrimary,
        elevation: 0,
        currentIndex: selectedIndex,
        onTap: onDestinationChange,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: context.primary,
        unselectedItemColor: context.secondaryContainer,
        selectedLabelStyle: context.bodySmall?.copyWith(
          fontWeight: FontWeight.w500,
          color: context.primary,
          height: 2.5,
        ),
        unselectedLabelStyle: context.bodySmall?.copyWith(
          fontWeight: FontWeight.w400,
          color: context.secondaryContainer,
          height: 2.5,
        ),
        items: [
          BottomNavItemTile.build(
            context,
            asset: Assets.home,
            label: "Home",
            index: 0,
            selectedIndex: selectedIndex,
          ),
          BottomNavItemTile.build(
            context,
            asset: Assets.resident,
            label: "Visitors",
            index: 1,
            selectedIndex: selectedIndex,
          ),
          BottomNavItemTile.build(
            context,
            asset: Assets.payment,
            label: "Payment",
            index: 2,
            selectedIndex: selectedIndex,
          ),
          BottomNavItemTile.build(
            context,
            asset: Assets.more,
            label: "More",
            index: 3,
            selectedIndex: selectedIndex,
          ),
        ],
      ),
    );
  }
}
