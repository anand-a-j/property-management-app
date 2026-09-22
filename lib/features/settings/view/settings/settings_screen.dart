import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/core/extension/common.dart';
import 'package:habitroot/core/new_components/danger_outline_button.dart';
import 'package:habitroot/features/auth/controller/provider/auth_provider.dart';
import 'package:habitroot/features/settings/view/settings/widgets/settings_card.dart';
import 'package:habitroot/features/store/controller/provider/store_provider.dart';
import 'package:habitroot/features/user/controller/provider/user_provider.dart';
import 'package:habitroot/routes/router_path.dart';
import 'package:provider/provider.dart';

import '../../../../core/components/core_components.dart';
import '../../../../core/components/custom_dialog.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/service/logout_service.dart';
import '../../../../core/utils/snackbar_manager.dart';
import '../../../../core/utils/url_launcher_utils.dart';
import '../../../../old_feature/settings/presentation/widgets/app_version_tile.dart';
import '../../../../routes/args/create_store_args.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HabitRootAppBar(title: "Settings"),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
        children: [
          const SizedBox(height: AppConsts.pLarge),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 1, color: context.secondaryContainer),
            ),
            child: Column(
              children: [
                SettingsCard(
                  leadingIcon: Assets.archive,
                  title: "My Profile",

                  onTap: () {
                    context.push(RouterPath.editProfile);
                  },
                ),
                SettingsCard(
                  leadingIcon: Assets.store,
                  title: "My Store",

                  onTap: () {
                    final store = context.read<StoreProvider>().currentStore;
                    if (store != null) {
                      final args = CreateStoreArgs(
                        slug: "",
                        isEdit: true,
                        store: store,
                      );
                      context.push(RouterPath.createStore, extra: args);
                    }
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: AppConsts.pLarge),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 1, color: context.secondaryContainer),
            ),
            child: Column(
              children: [
                SettingsCard(
                  isFirst: true,
                  leadingIcon: Assets.help,
                  title: "Help & Support",
                  onTap: () async {
                    context.push(RouterPath.helpSupport);
                  },
                ),
                SettingsCard(
                  isFirst: true,
                  leadingIcon: Assets.shield,
                  title: "Privacy Policy",
                  onTap: () async {
                    try {
                      await UrlLauncherUtils.openUrl(
                        AppConsts.privacyUrl,
                        forceWebView: false,
                      );
                    } catch (e) {
                      Snack.error(e.toString());
                    }
                  },
                ),
                SettingsCard(
                  leadingIcon: Assets.newspaper,
                  title: "Terms of Use",
                  onTap: () async {
                    try {
                      await UrlLauncherUtils.openUrl(
                        AppConsts.termsUrl,
                        forceWebView: false,
                      );
                    } catch (e) {
                      Snack.error(e.toString());
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: AppConsts.pLarge),
          DangerOutlinedButton(
            label: "Logout",
            onTap: () {
              CustomDialog.confirmationDialog(
                context: context,
                title: "Logout",
                subTitle:
                    "Are you sure you want to log out? You can always log back in anytime.",
                cancelTitle: "Stay",
                sumbitTitle: "Logout",
                cancelOnTap: () {
                  Navigator.pop(context);
                },
                sumbitOnTap: () {
                  Navigator.pop(context);
                  handleLogout(context);
                },
                isWarning: true,
              );
            },
          ),
          const SizedBox(height: 20),

          const AppVersionTile(),
        ],
      ),
    );
  }
}



 // SettingsCard(
          //   leadingIcon: Assets.star,
          //   title: rateTheAppEn,
          //   onTap: () async {
          //     try {
          //       await UrlLauncherUtils.openUrl(
          //         AppConsts.playstoreUrl,
          //         forceWebView: false,
          //       );
          //     } catch (e) {
          //       Snack.error(e.toString());
          //     }
          //   },
          // ),
          // TODO : after V1 release
          // SettingsCard(
          //   leadingIcon: Assets.externalLink,
          //   title: shareTheAppEn,
          // ),
          // GestureDetector(
          //   onTap: () async {
          //     try {
          //       await UrlLauncherUtils.openSupportEmail();
          //     } catch (e) {
          //       Snack.error(e.toString());
          //     }
          //   },
          //   child: const SettingsCard(
          //     isLast: true,
          //     leadingIcon: Assets.messageSquareDiff,
          //     title: feedbackEn,
          //     subTitle: "Tell us what you think or found anything wrong?",
          //   ),
          // ),