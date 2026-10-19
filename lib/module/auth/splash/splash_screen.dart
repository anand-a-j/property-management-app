// ignore_for_file: avoid_returning_null_for_void

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/bloc/cubit/app_cubit.dart';
import '../../../core/constants/constants.dart';
import '../../../core/enum/user_role.dart';
import '../../../core/extension/common.dart';

import '../../../routes/router_path.dart';
import '../core/controller/bloc/auth_bloc.dart';
import '../core/controller/bloc/auth_event.dart';
import '../core/controller/service/auth_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    // Give splash/logo a little time
    await Future.delayed(const Duration(milliseconds: 1500));

    if (!mounted) return;

    final initialized = await AuthService.instance.initialize();

    if (!mounted) return;

    if (!initialized) {
      context.go(RouterPath.welcome);
      return;
    }

    switch (authentication.role) {
      case UserRole.platformAdmin:
        return context.go(RouterPath.platformDashboard);

      case UserRole.manager:
        return context.go(RouterPath.adminHome);
      case UserRole.resident:
        return context.go(RouterPath.residentHome);
      case UserRole.security:
        context.go(RouterPath.securityHome);
      case UserRole.maintenance:
        context.go(RouterPath.maintenanceStaffHome);

      case null:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primary,
      body: Padding(
        padding: const EdgeInsets.all(AppConsts.pSide),
        child: Center(
          child: GestureDetector(
            onTap: () {
              context.read<AppCubit>().setAdminDashIndex(0);
              context.read<AuthBloc>().add(const AuthSignOut());
            },
            child: Text(
              "Naseem",
              style: context.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
                color: context.onPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
