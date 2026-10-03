import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class AdminHomeNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onDestinationChange;

  const AdminHomeNavigationBar({
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
          _item(context, asset: Assets.home, label: "Home", index: 0),
          _item(context, asset: Assets.property, label: "Community", index: 1),
          _item(context, asset: Assets.resident, label: "Resident", index: 2),

          _item(context, asset: Assets.payment, label: "Payment", index: 3),
          _item(context, asset: Assets.more, label: "More", index: 4),
        ],
      ),
    );
  }

  BottomNavigationBarItem _item(
    BuildContext context, {
    required String asset,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: SvgBuild(
        assetImage: asset,

        height: 35,
        width: 35,
        colorFilter: ColorFilter.mode(
          selectedIndex == index ? context.primary : context.secondaryContainer,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}
