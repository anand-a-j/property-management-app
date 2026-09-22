import 'package:flutter/material.dart';

import 'package:naseem/core/utils/snackbar_manager.dart';

import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_constants.dart';
import 'core/service/hive_ce_service.dart';
import 'core/service/supabase_service.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/svg_precache.dart';

import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  precacheSvgImages();
  await HiveService.init();

  await supabaseService.init();

  runApp(MultiProvider(providers: [], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: settings.listenable(keys: [themeModeKey]),
      builder: (context, value, child) {
        // TODO: Light theme after version 1 release
        // final ThemeMode themeMode = ThemeMode.values[value.get(
        //   themeModeKey,
        //   defaultValue: 0,
        // )];
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          //
          routerConfig: router,
          themeMode: ThemeMode.light,
          scaffoldMessengerKey: Snack.messengerKey,
          title: AppConsts.appName,
          theme: AppThemes.lightThemeData(context),
        );
      },
    );
  }
}
