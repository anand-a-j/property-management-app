// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:naseem/features/home/controller/provider/home_provider.dart';
// import 'package:provider/provider.dart';

// import '../../features/auth/controller/provider/auth_provider.dart';
// import '../../features/store/controller/provider/store_provider.dart';
// import '../../features/user/controller/provider/user_provider.dart';
// import '../../routes/router_path.dart';
// import '../utils/snackbar_manager.dart';

// Future<void> handleLogout(BuildContext context) async {
//   final authProvider = context.read<AuthProvider>();
//   final storeProvider = context.read<StoreProvider>();
//   final userProvider = context.read<UserProvider>();

//   try {
//     await authProvider.signOut();
//     await Future.wait([storeProvider.clearStore(), userProvider.logout()]);

//     if (!context.mounted) return;

//     context.read<HomeProvider>().setCurrentIndex(0);

//     context.go(RouterPath.welcome);
//   } catch (e) {
//     if (!context.mounted) return;

//     Snack.error("Logout Failed Something went wrong");
//   }
// }
