// import 'package:flutter/material.dart';

// import 'package:go_router/go_router.dart';
// import 'package:habitroot/core/constants/app_constants.dart';

// import 'package:habitroot/core/service/logout_service.dart';
// import 'package:habitroot/core/theme/app_color_scheme.dart';
// import 'package:habitroot/core/utils/snackbar_manager.dart';
// import 'package:habitroot/features/store/controller/provider/store_provider.dart';
// import 'package:habitroot/routes/router_path.dart';
// import 'package:provider/provider.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// import '../../../core/extension/common.dart';
// import '../../../features/user/controller/provider/user_provider.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }

//   Future<void> _init() async {
//     final supabase = Supabase.instance.client;

//     /// small delay for logo (optional, 1 sec max)
//     await Future.delayed(const Duration(milliseconds: 800));

//     if (!mounted) return;

//     final session = supabase.auth.currentSession;

//     if (session != null) {
//       /// ✅ User logged in
//       await _handleLoggedIn();
//     } else {
//       /// ❌ Not logged in
//       _goToLogin();
//     }
//   }

//   Future<void> _handleLoggedIn() async {
//     final userProvider = context.read<UserProvider>();

//     final res = await userProvider.loadUserInitial();

//     if (!mounted) return;

//     if (res == false) {
//       Snack.error("Your session expired. Please login again.");
//       handleLogout(context);
//       return;
//     }

//     context.read<StoreProvider>().loadStore();

//     context.go(RouterPath.home);
//   }

//   void _goToLogin() {
//     context.go(RouterPath.welcome);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColorScheme.logoPrimary,
//       body: Padding(
//         padding: const EdgeInsets.all(AppConsts.pSide),
//         child: Center(
//           child: Text(
//             "StoreRoot",
//             style: context.titleMedium?.copyWith(
//               fontWeight: FontWeight.w600,
//               color: context.secondary,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }