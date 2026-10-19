import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';
import 'package:naseem/module/platform_admin/view/widgets/platform_logout_button.dart'
    show PlatformLogoutButton;
import 'package:naseem/module/staff/view/security/tab/security_requests_tab.dart';
import 'package:naseem/module/staff/view/security/tab/security_visitor_tab.dart';

import '../../../../core/core.dart';
import '../../../../core/utils/snackbar_manager.dart';
import '../../../../routes/router_path.dart';
import '../../../admin/visitor/controller/bloc/visitor_bloc.dart'
    show
        GetVisitorsEvent,
        VisitorBloc,
        VisitorState,
        VisitorStatusUpdateFailed,
        VisitorStatusUpdated;
import '../../../auth/core/controller/bloc/auth_bloc.dart';
import '../../../auth/core/controller/bloc/auth_event.dart';
import '../../../auth/core/controller/bloc/auth_state.dart';
import '../../../platform_admin/view/widgets/platform_appbar.dart';

class SecurityDashboardScreen extends StatefulWidget {
  const SecurityDashboardScreen({super.key});

  @override
  State<SecurityDashboardScreen> createState() =>
      _SecurityDashboardScreenState();
}

class _SecurityDashboardScreenState extends State<SecurityDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLogoutSuccess) {
              context.go(RouterPath.welcome);
            }
          },
        ),
        BlocListener<VisitorBloc, VisitorState>(
          listener: (context, state) {
            if (state is VisitorStatusUpdated) {
              Snack.success("Update status successfully!!!");

              context.read<VisitorBloc>().add(
                GetVisitorsEvent(orgId: authentication.profile?.orgId ?? ""),
              );
            } else if (state is VisitorStatusUpdateFailed) {
              Snack.error(state.message);
              context.read<VisitorBloc>().add(
                GetVisitorsEvent(orgId: authentication.profile?.orgId ?? ""),
              );
            }
          },
        ),
      ],
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: PlatformAppBar(
            title: 'Security',
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: AppConsts.pSide),
                child: PlatformLogoutButton(
                  onPressed: () {
                    CustomDialog.confirmationDialog(
                      context: context,
                      title: 'Sign Out',
                      subTitle: 'Are you sure you want to sign out?',
                      cancelTitle: 'Cancel',
                      sumbitTitle: 'Sign Out',
                      cancelOnTap: () {
                        Navigator.pop(context);
                      },
                      sumbitOnTap: () {
                        context.read<AuthBloc>().add(const AuthSignOut());
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              ColoredBox(
                color: context.secondary,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: AppConsts.pSide,
                    right: AppConsts.pSide,
                    bottom: 15,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Hello, //${authentication.profile?.name ?? ''}',
                      style: context.bodyMedium?.copyWith(
                        color: context.secondaryContainer,
                      ),
                    ),
                  ),
                ),
              ),

              const TabBar(
                tabs: [
                  Tab(text: 'Visitors'),
                  Tab(text: 'Requests'),
                ],
              ),

              // Tab content
              Expanded(
                child: TabBarView(
                  children: [
                    SecurityVisitorTab(
                      orgId: authentication.profile?.orgId ?? "",
                    ),
                    SecurityRequestsTab(),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingAddButton(
            title: 'Add Visitor',
            onTap: () async {
              // context.push(RouterPath.addVisitor);

              final result = await context.push<bool>('/add-visitor');

              if (!mounted) return;

              if (result == true) {
                // ignore: use_build_context_synchronously
                context.read<VisitorBloc>().add(
                  GetVisitorsEvent(
                    orgId: authentication.profile?.orgId ?? "",
                    unitId: null,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
