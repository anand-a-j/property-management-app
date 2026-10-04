import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/bloc/cubit/app_cubit.dart';
import 'package:naseem/core/utils/bloc_observer.dart';

import 'package:naseem/core/utils/snackbar_manager.dart';

import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:naseem/module/auth/core/controller/bloc/auth_bloc.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';
import 'package:naseem/module/platform_admin/controller/bloc/manager_bloc.dart';
import 'package:naseem/module/platform_admin/controller/repo/manager_repo.dart';
import 'package:naseem/module/staff/controller/bloc/staff_bloc.dart';
import 'package:naseem/module/staff/controller/repo/staff_repo.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_constants.dart';
import 'core/service/hive_ce_service.dart';
import 'core/service/supabase_service.dart';
import 'core/theme/app_theme.dart';

import 'module/admin/resident/controller/bloc/resident_bloc.dart';
import 'module/admin/resident/controller/repo/resident_repo.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();

  await supabaseService.init();

  Bloc.observer = SimpleBlocObserver();
  runApp(
    MultiProvider(
      providers: [
        BlocProvider<AppCubit>(create: (context) => AppCubit()),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(authService: authentication),
        ),
        BlocProvider<ManagerBloc>(
          create: (context) => ManagerBloc(repo: ManagerRepo()),
        ),

        // Migrate the bloc later
        BlocProvider<ResidentBloc>(
          create: (context) => ResidentBloc(repo: ResidentRepo()),
        ),
        BlocProvider<StaffBloc>(
          create: (context) => StaffBloc(repo: StaffRepo()),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
