import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/module/admin/community/controller/repo/community_repo.dart';
import 'package:naseem/module/admin/community/view/add_community_screen.dart';
import 'package:naseem/module/admin/resident/controller/bloc/resident_bloc.dart'
    show ResidentBloc;
import 'package:naseem/module/admin/resident/controller/repo/resident_repo.dart';
import 'package:naseem/module/admin/unit/view/add_unit/add_unit_screen.dart';
import 'package:naseem/module/platform_admin/view/platform_dashboard_screen.dart';

import 'package:naseem/routes/router_path.dart';

import 'package:hive_ce/hive.dart';

import '../core/enum/box_types.dart';

import '../core/enum/sign_up_type.dart';
import '../module/admin/community/controller/bloc/community_bloc.dart';
import '../module/admin/home/view/admin_home_screen.dart';
import '../module/auth/sign_in/view/screen/sign_in_screen.dart';
import '../module/auth/sign_up/view/screen/sign_up_screen.dart';
import '../module/auth/splash/splash_screen.dart';
import '../module/auth/welcome/welcome_screen.dart';
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
    GoRoute(
      path: '/',
      name: 'splash-screen',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: RouterPath.welcome,
      name: 'welcome-screen',
      pageBuilder: (context, state) {
        return PremiumPageTransition(page: const WelcomeScreen());
      },
    ),

    GoRoute(
      path: RouterPath.signIn,
      name: 'signin-screen',
      pageBuilder: (context, state) {
        return SlideTransitionPage(
          beginOffset: Offset(0, 1),
          page: const SignInScreen(),
        );
      },
    ),

    GoRoute(
      path: RouterPath.signUp,
      name: 'signup-screen',
      pageBuilder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;

        final type = extra?['type'] as SignUpType? ?? SignUpType.resident;

        return SlideTransitionPage(
          beginOffset: Offset(0, -1),
          page: SignUpScreen(type: type),
        );
      },
    ),
    // Platform Admin-----------------------------------------------------------
    GoRoute(
      path: RouterPath.platformDashboard,
      name: 'platform-dashboard-screen',
      pageBuilder: (context, state) {
        return FadeTransitionPage(page: PlatformDashboardScreen());
      },
    ),
    // Admin--------------------------------------------------------------------
    GoRoute(
      path: RouterPath.adminHome,
      name: 'admin-home-screen',
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          page: MultiBlocProvider(
            providers: [
              BlocProvider<CommunityBloc>(
                create: (context) =>
                    CommunityBloc(communityRepo: CommunityRepo()),
              ),
              BlocProvider<ResidentBloc>(
                create: (context) => ResidentBloc(repo: ResidentRepo()),
              ),
            ],
            child: AdminHomeScreen(),
          ),
        );
      },
    ),

    GoRoute(
      path: RouterPath.addCommunity,
      name: 'add-community-screen',
      pageBuilder: (context, state) {
        return SlideTransitionPage(
          beginOffset: Offset(0, 1),
          page: BlocProvider<CommunityBloc>(
            create: (context) => CommunityBloc(communityRepo: CommunityRepo()),
            child: AddCommunityScreen(),
          ),
        );
      },
    ),
    GoRoute(
      path: RouterPath.addUnit,
      name: 'add-unit-screen',
      pageBuilder: (context, state) {
        return SlideTransitionPage(
          beginOffset: Offset(0, 1),
          page: AddUnitScreen(),
        );
      },
    ),
  ],
);
