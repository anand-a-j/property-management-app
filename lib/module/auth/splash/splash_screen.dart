import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/constants/constants.dart';
import '../../../core/extension/common.dart';
import '../../../core/service/logout_service.dart';
import '../../../core/theme/app_color_scheme.dart';
import '../../../core/utils/snackbar_manager.dart';
import '../../../routes/router_path.dart';

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
    final supabase = Supabase.instance.client;

    /// small delay for logo (optional, 1 sec max)
    await Future.delayed(const Duration(milliseconds: 800));

    if (!mounted) return;

    final session = supabase.auth.currentSession;

    if (session != null) {
      /// ✅ User logged in
      // await _handleLoggedIn();
    } else {
      /// ❌ Not logged in
      _goToLogin();
    }
  }

  // Future<void> _handleLoggedIn() async {
  //   final userProvider = context.read<UserProvider>();

  //   final res = await userProvider.loadUserInitial();

  //   if (!mounted) return;

  //   if (res == false) {
  //     Snack.error("Your session expired. Please login again.");
  //     handleLogout(context);
  //     return;
  //   }


  //   context.go(RouterPath.home);
  // }

  void _goToLogin() {
    context.go(RouterPath.welcome);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primary,
      body: Padding(
        padding: const EdgeInsets.all(AppConsts.pSide),
        child: Center(
          child: Text(
            "Naseem",
            style: context.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: context.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
