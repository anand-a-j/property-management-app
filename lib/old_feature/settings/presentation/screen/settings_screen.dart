import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/core/constants/app_constants.dart';
import 'package:habitroot/core/constants/assets.dart';
import 'package:habitroot/core/constants/strings.dart';
import 'package:habitroot/core/utils/url_launcher_utils.dart';

import '../../../../core/components/core_components.dart';
import '../../../../core/utils/snackbar_manager.dart';
import '../widgets/app_version_tile.dart';
import '../widgets/feedback_highlight_title.dart';
import '../widgets/settings_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HabitRootAppBar(
        leadingOnTap: () => context.pop(),
        title: settingsEn,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
        children: [
          const SizedBox(height: AppConsts.pLarge),

          const FeedbackHighlightTile(),
          const SizedBox(height: AppConsts.pLarge),
          // SettingsCard(
          //   leadingIcon: Assets.settings,
          //   title: generalEn,
          //   isFirst: true,
          //   onTap: () {
          //     context.pushNamed('general-screen');
          //   },
          // ),

          // TODO: Light Theme after v1 release
          // SettingsCard(
          //   leadingIcon: Assets.theme,
          //   title: "Theme",
          //   isFirst: true,
          //   onTap: () {
          //     showThemeBottomSheet(context);
          //     // context.pushNamed('theme-screen');
          //   },
          // ),
          SettingsCard(
            leadingIcon: Assets.archive,
            title: arcivedHabitsEn,
            isFirst: true,
            onTap: () {
              context.pushNamed('archive-screen');
            },
          ),
          SettingsCard(
            leadingIcon: Assets.folderUp,
            title: dateImportExportEn,
            onTap: () {
              context.pushNamed('import-export-screen');
            },
          ),
          SettingsCard(
            leadingIcon: Assets.arrowUpDown,
            title: reorderHabitsEn,
            isLast: true,
            onTap: () {
              context.pushNamed('reorder-screen');
            },
          ),
          const SizedBox(height: AppConsts.pLarge),
          SettingsCard(
            isFirst: true,
            leadingIcon: Assets.shield,
            title: privacyPolicyEn,
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
            title: termsOfUseEn,
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

          SettingsCard(
            leadingIcon: Assets.star,
            title: rateTheAppEn,
            onTap: () async {
              try {
                await UrlLauncherUtils.openUrl(
                  AppConsts.playstoreUrl,
                  forceWebView: false,
                );
              } catch (e) {
                Snack.error(e.toString());
              }
            },
          ),
          // TODO : after V1 release
          // SettingsCard(
          //   leadingIcon: Assets.externalLink,
          //   title: shareTheAppEn,
          // ),
          GestureDetector(
            onTap: () async {
              try {
                await UrlLauncherUtils.openSupportEmail();
              } catch (e) {
                Snack.error(e.toString());
              }
            },
            child: const SettingsCard(
              isLast: true,
              leadingIcon: Assets.messageSquareDiff,
              title: feedbackEn,
              subTitle: "Tell us what you think or found anything wrong?",
            ),
          ),

          const AppVersionTile(),
        ],
      ),
    );
  }
}
