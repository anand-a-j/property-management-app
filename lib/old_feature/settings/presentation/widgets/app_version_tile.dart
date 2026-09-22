import 'package:flutter/material.dart';
import 'package:habitroot/core/constants/app_constants.dart';
import 'package:habitroot/core/extension/common.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionTile extends StatelessWidget {
  const AppVersionTile({super.key});

  Future<String> _getVersion() async {
    final info = await PackageInfo.fromPlatform();
    return "${info.version}(${info.buildNumber})";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Center(
        child: FutureBuilder<String>(
          future: _getVersion(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox.shrink(); 
            }

            return Text(
              "${AppConsts.appName} v${snapshot.data}",
              style: context.bodySmall?.copyWith(
                color: context.secondary.withValues(alpha: 0.5),
              ),
            );
          },
        ),
      ),
    );
  }
}
