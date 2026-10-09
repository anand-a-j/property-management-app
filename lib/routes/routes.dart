import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/module/admin/community/controller/repo/community_repo.dart';
import 'package:naseem/module/admin/community/view/add_community_screen.dart';
import 'package:naseem/module/admin/resident/controller/bloc/resident_bloc.dart'
    show ResidentBloc;
import 'package:naseem/module/admin/resident/controller/repo/resident_repo.dart';
import 'package:naseem/module/admin/unit/view/add_unit/add_unit_screen.dart';
import 'package:naseem/module/admin/unit/view/unit_details/unit_details_screen.dart';
import 'package:naseem/module/platform_admin/view/platform_dashboard_screen.dart';
import 'package:naseem/module/staff/view/staff_list/staff_list_screen.dart';

import 'package:naseem/routes/router_path.dart';

import 'package:hive_ce/hive.dart';

import '../core/enum/box_types.dart';

import '../core/enum/sign_up_type.dart';
import '../module/admin/community/controller/bloc/community_bloc.dart';
import '../module/admin/home/view/admin_home_screen.dart';
import '../module/admin/lease/view/add/add_lease_screen.dart';
import '../module/admin/lease/view/details/lease_details_screen.dart';
import '../module/admin/lease/view/list/lease_list_screen.dart';
import '../module/admin/resident/view/resident_list_screen.dart';
import '../module/admin/unit/view/unit_list/unit_list_screen.dart';
import '../module/auth/sign_in/view/screen/sign_in_screen.dart';
import '../module/auth/sign_up/view/screen/sign_up_screen.dart';
import '../module/auth/splash/splash_screen.dart';
import '../module/auth/welcome/welcome_screen.dart';
import 'args/add_lease_args.dart';
import 'args/add_unit_args.dart';
import 'args/lease_details_args.dart';
import 'args/unit_details_args.dart';
import 'args/unit_list_args.dart';
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
            ],
            child: AdminHomeScreen(),
          ),
        );
      },
    ),

    GoRoute(
      path: RouterPath.residentList,
      name: 'resident-list-screen',
      pageBuilder: (context, state) {
        final isSelectionMode = state.extra as bool? ?? false;

        return SlideTransitionPage(
          beginOffset: const Offset(1, 0),
          page: ResidentListScreen(isSelectionMode: isSelectionMode),
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
        final args = state.extra as AddUnitArgs;
        return SlideTransitionPage(
          beginOffset: Offset(0, 1),
          page: AddUnitScreen(
            community: args.community,
            isEdit: args.isEdit,
            unit: args.unit,
          ),
        );
      },
    ),

    GoRoute(
      path: RouterPath.unitList,
      name: 'unit-list-screen',
      pageBuilder: (context, state) {
        final args = state.extra as UnitListArgs;

        return SlideTransitionPage(
          beginOffset: const Offset(1, 0),
          page: UnitListScreen(community: args.community),
        );
      },
    ),

    GoRoute(
      path: RouterPath.unitDetails,
      name: 'unit-details-screen',
      pageBuilder: (context, state) {
        final args = state.extra as UnitDetailsArgs;

        return SlideTransitionPage(
          beginOffset: const Offset(1, 0),
          page: UnitDetailsScreen(unit: args.unit, community: args.community),
        );
      },
    ),

    GoRoute(
      path: RouterPath.leaseList,
      name: 'lease-list-screen',
      pageBuilder: (context, state) {
        final isSelectionMode = state.extra as bool? ?? false;
        return SlideTransitionPage(
          beginOffset: const Offset(1, 0),
          page: LeaseListScreen(isSelectionMode: isSelectionMode),
        );
      },
    ),

    GoRoute(
      path: RouterPath.addLease,
      name: 'add-lease-screen',
      pageBuilder: (context, state) {
        final args = state.extra as AddLeaseArgs;

        return SlideTransitionPage(
          beginOffset: const Offset(1, 0),
          page: AddLeaseScreen(
            unit: args.unit,
            lease: args.lease,
            isEdit: args.isEdit,
            community: args.community,
          ),
        );
      },
    ),

    GoRoute(
      path: RouterPath.leaseDetails,
      name: 'lease-details-screen',
      pageBuilder: (context, state) {
        final args = state.extra as LeaseDetailsArgs;

        return SlideTransitionPage(
          beginOffset: const Offset(1, 0),
          page: LeaseDetailsScreen(
            lease: args.lease,
            unit: args.unit,
            community: args.community,
          ),
        );
      },
    ),

    GoRoute(
      path: RouterPath.staffList,
      name: 'staff-list-screen',
      pageBuilder: (context, state) {
        return SlideTransitionPage(
          beginOffset: Offset(1, 0),
          page: StaffListScreen(),
        );
      },
    ),
  ],
);
