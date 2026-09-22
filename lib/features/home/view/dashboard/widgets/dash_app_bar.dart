import 'package:flutter/material.dart';
import 'package:habitroot/core/extension/common.dart';

import '../../../../../core/components/core_components.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/theme/app_color_scheme.dart';

class DashAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColorScheme.scaffoldBackgroundColor,
      centerTitle: false,
      leadingWidth: 55,
      leading: Container(
        height: 20,
        width: 20,
        margin: const EdgeInsetsDirectional.only(
          start: AppConsts.pSide,
          top: 10,
          bottom: 10,
        ),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColorScheme.logoPrimary,
          border: Border.all(width: 0.8, color: context.secondary),
        ),
        child: const Center(child: SvgBuild(assetImage: Assets.appLogo)),
      ),
      title: Padding(
        padding: const EdgeInsetsDirectional.only(start: 5),
        child: Text(
          "StoreRoot",
          style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
