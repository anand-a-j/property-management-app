import 'package:flutter/material.dart';

import '../../../../../core/utils/snackbar_manager.dart';
import '../../../../../core/utils/url_launcher_utils.dart';

class DashVisitStoreButton extends StatelessWidget {
  final String storeUrl;

  const DashVisitStoreButton({super.key, required this.storeUrl});

  @override
  Widget build(BuildContext context) {
    final Color foregroundColor = Theme.of(context).colorScheme.onPrimary;

    return SizedBox(
      height: 49,
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: foregroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: () async {
          try {
            await UrlLauncherUtils.openUrl(storeUrl, forceWebView: false);
          } catch (e) {
            Snack.error(e.toString());
          }
        },
        icon: Icon(Icons.storefront_outlined, color: foregroundColor),
        label: Text(
          "Visit Your Store",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
            color: foregroundColor,
          ),
        ),
      ),
    );
  }
}
