import 'package:flutter/material.dart';
import 'package:habitroot/core/constants/assets.dart';
import 'package:habitroot/core/extension/common.dart';

import '../../../../core/new_components/svg_build.dart';

class HomeNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onDestinationChange;

  const HomeNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.5, color: context.secondaryContainer),
        ),
      ),
      child: BottomNavigationBar(
        elevation: 0.0,
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
          BottomNavigationBarItem(
            icon: SvgBuild(
              assetImage: Assets.home,

              height: 25,
              width: 25,
              colorFilter: ColorFilter.mode(
                selectedIndex == 0
                    ? context.primary
                    : context.secondaryContainer,
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgBuild(
              assetImage: Assets.product,

              height: 25,
              width: 25,
              colorFilter: ColorFilter.mode(
                selectedIndex == 1
                    ? context.primary
                    : context.secondaryContainer,
                BlendMode.srcIn,
              ),
            ),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: SvgBuild(
              assetImage: Assets.settings,

              height: 25,
              width: 25,
              colorFilter: ColorFilter.mode(
                selectedIndex == 2
                    ? context.primary
                    : context.secondaryContainer,
                BlendMode.srcIn,
              ),
            ),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
