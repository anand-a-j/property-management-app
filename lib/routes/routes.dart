import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/constants/app_constants.dart';

import 'package:naseem/routes/router_path.dart';

import 'package:hive_ce/hive.dart';
import 'package:provider/provider.dart';

import '../core/enum/box_types.dart';

import 'args/create_store_args.dart';
import 'page_transition.dart';

final Box<dynamic> settings = Hive.box(BoxType.settings.name);

final GoRouter router = GoRouter(
  initialLocation: "/",

  debugLogDiagnostics: true,
  observers: [HeroController()],
  redirect: (BuildContext context, GoRouterState state) {
    // final bool onboardingCompleted =
    //     settings.get(onboardingCompleteKey, defaultValue: false);

    // final bool isOnboardingRoute = state.matchedLocation == '/onboarding';

    // // If onboarding NOT completed → force onboarding
    // if (!onboardingCompleted && !isOnboardingRoute) {
    //   return '/onboarding';
    // }

    // // If onboarding completed → skip onboarding
    // if (onboardingCompleted && isOnboardingRoute) {
    //   return '/dashboard';
    // }

    return null; // no redirect
  },
  routes: <RouteBase>[

    
    // GoRoute(
    //   path: '/',
    //   name: 'splash-screen',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const SplashScreen();
    //   },
    // ),
    // GoRoute(
    //   path: RouterPath.welcome,
    //   name: 'welcome-screen',
    //   pageBuilder: (context, state) {
    //     return FadeTransitionPage(page: const WelcomeScreen());
    //   },
    // ),

    // GoRoute(
    //   path: RouterPath.signIn,
    //   name: 'signin-screen',
    //   pageBuilder: (context, state) {
    //     return FadeTransitionPage(page: const SignInScreen());
    //   },
    // ),

    // GoRoute(
    //   path: RouterPath.signUp,
    //   name: 'signup-screen',
    //   pageBuilder: (context, state) {
    //     return FadeTransitionPage(page: const SignUpScreen());
    //   },
    // ),

    // // OLD+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // GoRoute(
    //   path: RouterPath.createStoreSlug,
    //   name: 'create-store-slug-screen',
    //   pageBuilder: (context, state) {
    //     return FadeTransitionPage(page: const CreateStoreSlugScreen());
    //   },
    // ),
    // GoRoute(
    //   path: RouterPath.createStore,
    //   name: 'create-store-details-screen',
    //   pageBuilder: (context, state) {
    //     final args = state.extra as CreateStoreArgs;

    //     return FadeTransitionPage(
    //       page: CreateStoreDetailsScreen(
    //         slug: args.slug,
    //         isEdit: args.isEdit,
    //         store: args.store,
    //       ),
    //     );
    //   },
    // ),

    // GoRoute(
    //   path: RouterPath.home,
    //   name: 'home-screen',
    //   pageBuilder: (BuildContext context, GoRouterState state) {
    //     return SlideTransitionPage(
    //       page: const HomeScreen(),
    //       beginOffset: const Offset(0.0, 1.0),
    //     );
    //   },
    // ),

    // GoRoute(
    //   path: RouterPath.addEditProduct,
    //   name: 'add-edit-product-screen',
    //   pageBuilder: (BuildContext context, GoRouterState state) {
    //     final productId = state.extra as String?;
    //     return SlideTransitionPage(
    //       page: AddEditProductScreen(productId: productId),
    //       beginOffset: const Offset(0.0, 1.0),
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: RouterPath.editProfile,
    //   name: 'edit-profile-screen',
    //   pageBuilder: (BuildContext context, GoRouterState state) {
    //     return SlideTransitionPage(
    //       page: const EditMyProfileScreen(),
    //       beginOffset: const Offset(0.0, 1.0),
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: RouterPath.helpSupport,
    //   name: 'help-support-screen',
    //   pageBuilder: (BuildContext context, GoRouterState state) {
    //     return SlideTransitionPage(
    //       page: const HelpSupportScreen(),
    //       beginOffset: const Offset(0.0, 1.0),
    //     );
    //   },
    // ),

    // NEW ---------------------------------------------------------------------
  ],
);
