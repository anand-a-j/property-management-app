import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:habitroot/core/utils/snackbar_manager.dart';
import 'package:habitroot/features/auth/controller/provider/auth_provider.dart';
import 'package:habitroot/features/home/controller/provider/home_provider.dart';
import 'package:habitroot/features/main/controller/service/supabase_service.dart';
import 'package:habitroot/features/product/controller/data/product_repo.dart';
import 'package:habitroot/features/product/controller/provider/product_provider.dart';
import 'package:habitroot/features/storage/controller/storage_service.dart';
import 'package:habitroot/features/store/controller/data/store_db.dart';
import 'package:habitroot/features/store/controller/data/store_repo.dart';
import 'package:habitroot/features/store/controller/provider/store_provider.dart';
import 'package:habitroot/features/user/controller/data/db/user_db.dart';
import 'package:habitroot/features/user/controller/data/user_repo.dart';
import 'package:habitroot/features/user/controller/provider/user_provider.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_constants.dart';
import 'core/service/hive_ce_service.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/svg_precache.dart';
import 'features/auth/controller/data/auth_repo.dart';
import 'old_feature/notification/data/notification_service.dart';

import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  precacheSvgImages();
  await HiveService.init();
  await NotificationService.init();

  await supabaseService.init();

  runApp(
    MultiProvider(
      providers: [
        /// 🔹 Repositories
        Provider(create: (_) => AuthRepo()),
        Provider(create: (_) => UserRepo()),
        Provider(create: (_) => StoreRepo()),
        Provider(create: (context) => ProductRepo()),

        /// 🔹 Local DB
        Provider(create: (_) => UserDB()),
        Provider(create: (_) => StoreDB()),

        /// 🔹 Providers
        ChangeNotifierProvider(
          create: (context) => AuthProvider(
            repo: context.read<AuthRepo>(),
            profileRepo: context.read<UserRepo>(),
            userDB: context.read<UserDB>(),
            storeRepo: context.read<StoreRepo>(),
            storeDb: context.read<StoreDB>(),
          ),
        ),

        ChangeNotifierProvider(
          create: (context) =>
              UserProvider(context.read<UserRepo>(), context.read<UserDB>()),
        ),

        ChangeNotifierProvider(
          create: (context) =>
              StoreProvider(context.read<StoreRepo>(), context.read<StoreDB>()),
        ),

        ChangeNotifierProvider(
          create: (context) =>
              ProductProvider(context.read<ProductRepo>(), StorageService()),
        ),

        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    log("user id : ${context.read<UserProvider>().user?.email}");
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
          themeMode: ThemeMode.dark,
          scaffoldMessengerKey: Snack.messengerKey,
          title: AppConsts.appName,
          darkTheme: AppThemes.darkThemeData(context),
        );
      },
    );
  }
}