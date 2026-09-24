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

 
  ],
);
