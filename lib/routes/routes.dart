import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/core/constants/app_constants.dart';
import 'package:habitroot/features/home/view/home_screen.dart';
import 'package:habitroot/features/product/controller/data/product_repo.dart';
import 'package:habitroot/features/product/controller/provider/product_provider.dart';
import 'package:habitroot/features/product/view/add_edit_product/add_edit_product_screen.dart';
import 'package:habitroot/features/settings/view/settings/help_support_screen.dart';
import 'package:habitroot/routes/router_path.dart';

import 'package:hive_ce/hive.dart';
import 'package:provider/provider.dart';

import '../core/enum/box_types.dart';
import '../features/auth/view/sign_in/sign_in_screen.dart';
import '../features/auth/view/sign_up/sign_up_screen.dart';
import '../features/auth/view/splash/splash_screen.dart';
import '../features/auth/view/welcome/welcome_screen.dart';
import '../features/store/view/create_store_details_screen.dart';
import '../features/store/view/create_store_slug_screen.dart';
import '../features/user/view/edit_my_profile_screen.dart';
import '../old_feature/analytics/presentation/screen/analytics_screen.dart';
import '../old_feature/habit/domain/habit.dart';
import '../old_feature/habit/presentation/screen/habit_add_screen.dart';
import '../old_feature/home/presentation/screen/dashboard_screen.dart';
import '../old_feature/premium/presentation/screen/premium_screen.dart';
import '../old_feature/settings/presentation/screen/archive_screen.dart';
import '../old_feature/settings/presentation/screen/general_screen.dart';
import '../old_feature/settings/presentation/screen/import_export_screen.dart';
import '../old_feature/settings/presentation/screen/reorder_screen.dart';
import '../old_feature/settings/presentation/screen/settings_screen.dart';
import '../old_feature/splash/presentation/onboarding/screen/onboarding_screen.dart';
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
        return FadeTransitionPage(page: const WelcomeScreen());
      },
    ),

    GoRoute(
      path: RouterPath.signIn,
      name: 'signin-screen',
      pageBuilder: (context, state) {
        return FadeTransitionPage(page: const SignInScreen());
      },
    ),

    GoRoute(
      path: RouterPath.signUp,
      name: 'signup-screen',
      pageBuilder: (context, state) {
        return FadeTransitionPage(page: const SignUpScreen());
      },
    ),
    GoRoute(
      path: RouterPath.createStoreSlug,
      name: 'create-store-slug-screen',
      pageBuilder: (context, state) {
        return FadeTransitionPage(page: const CreateStoreSlugScreen());
      },
    ),
    GoRoute(
      path: RouterPath.createStore,
      name: 'create-store-details-screen',
      pageBuilder: (context, state) {
        final args = state.extra as CreateStoreArgs;

        return FadeTransitionPage(
          page: CreateStoreDetailsScreen(
            slug: args.slug,
            isEdit: args.isEdit,
            store: args.store,
          ),
        );
      },
    ),

    GoRoute(
      path: RouterPath.home,
      name: 'home-screen',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return SlideTransitionPage(
          page: const HomeScreen(),
          beginOffset: const Offset(0.0, 1.0),
        );
      },
    ),

    GoRoute(
      path: RouterPath.addEditProduct,
      name: 'add-edit-product-screen',
      pageBuilder: (BuildContext context, GoRouterState state) {
        final productId = state.extra as String?;
        return SlideTransitionPage(
          page: AddEditProductScreen(productId: productId),
          beginOffset: const Offset(0.0, 1.0),
        );
      },
    ),
    GoRoute(
      path: RouterPath.editProfile,
      name: 'edit-profile-screen',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return SlideTransitionPage(
          page: const EditMyProfileScreen(),
          beginOffset: const Offset(0.0, 1.0),
        );
      },
    ),
      GoRoute(
      path: RouterPath.helpSupport,
      name: 'help-support-screen',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return SlideTransitionPage(
          page: const HelpSupportScreen(),
          beginOffset: const Offset(0.0, 1.0),
        );
      },
    ),

    /// old ------------------------------------------------
    GoRoute(
      path: '/onboarding',
      name: 'onboarding-screen',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return FadeTransitionPage(page: const OnboardingScreen());
      },
    ),
    GoRoute(
      path: '/dashboard',
      name: 'dashboard-screen',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return FadeTransitionPage(page: const DashboardScreen());
      },
    ),
    GoRoute(
      path: '/premium',
      name: 'premium-screen',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return SlideTransitionPage(
          page: const PremiumScreen(),
          beginOffset: const Offset(0.0, 1.0),
        );
      },
    ),
    GoRoute(
      path: '/habit-add',
      name: 'habit-add-screen',
      pageBuilder: (BuildContext context, GoRouterState state) {
        final habit = state.extra as Habit?;
        return SlideTransitionPage(
          page: HabitAddScreen(habit: habit, isEdit: habit != null),
          beginOffset: const Offset(0.0, 1.0),
        );
      },
    ),
    GoRoute(
      path: '/settings',
      name: 'settings-screen',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return SlideTransitionPage(
          page: const SettingsScreen(),
          beginOffset: const Offset(0.0, 1.0),
        );
      },
    ),
    GoRoute(
      path: '/archive',
      name: 'archive-screen',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return FadeTransitionPage(page: const ArchiveScreen());
      },
    ),
    GoRoute(
      path: '/reorder',
      name: 'reorder-screen',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return FadeTransitionPage(page: const ReorderScreen());
      },
    ),
    GoRoute(
      name: 'analytics-screen',
      path: '/analytics',
      pageBuilder: (context, state) {
        final habit = state.extra as Habit?;
        return SlideTransitionPage(
          page: AnalyticsScreen(habit: habit),
          beginOffset: const Offset(0, 1),
        );
      },
    ),
    GoRoute(
      name: 'general-screen',
      path: '/general',
      pageBuilder: (context, state) {
        return SlideTransitionPage(
          page: const GeneralScreen(),
          beginOffset: const Offset(0, 1),
        );
      },
    ),
    GoRoute(
      name: 'import-export-screen',
      path: '/import-export',
      pageBuilder: (context, state) {
        return SlideTransitionPage(
          page: const ImportExportScreen(),
          beginOffset: const Offset(0, 1),
        );
      },
    ),
  ],
);
