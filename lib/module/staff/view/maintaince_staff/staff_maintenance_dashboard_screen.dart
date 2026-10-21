import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/widgets/empty_state_view.dart';
import 'package:naseem/core/widgets/error_state_view.dart';
import 'package:naseem/module/auth/core/controller/bloc/auth_event.dart'
    show AuthSignOut;
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';

import '../../../../core/core.dart';
import '../../../../core/utils/snackbar_manager.dart';
import '../../../../routes/router_path.dart';
import '../../../admin/maintainence/view/list/widgets/maintenance_card.dart';
import '../../../auth/core/controller/bloc/auth_bloc.dart';
import '../../../auth/core/controller/bloc/auth_state.dart';
import '../../../platform_admin/view/widgets/platform_appbar.dart';
import '../../../platform_admin/view/widgets/platform_logout_button.dart';
import '../../controller/maintaince_staff/bloc/maintenance_staff_bloc.dart';
import '../../controller/maintaince_staff/bloc/status/maintenance_status_bloc.dart';
import 'sheet/show_maintenance_update_sheet.dart';
import 'widgets/maintenance_dashboard_header.dart';

class StaffMaintenanceDashboardScreen extends StatefulWidget {
  const StaffMaintenanceDashboardScreen({super.key});

  @override
  State<StaffMaintenanceDashboardScreen> createState() =>
      _StaffMaintenanceDashboardScreenState();
}

class _StaffMaintenanceDashboardScreenState
    extends State<StaffMaintenanceDashboardScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      context.read<MaintenanceStaffBloc>().add(
        FetchStaffMaintenanceList(orgId: authentication.profile?.orgId ?? ""),
      );
    });
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    if (_scrollController.position.extentAfter < 250) {
      context.read<MaintenanceStaffBloc>().add(
        LoadMoreStaffMaintenanceList(
          orgId: authentication.profile?.orgId ?? "",
        ),
      );
    }
  }

  void _retry() {
    context.read<MaintenanceStaffBloc>().add(
      FetchStaffMaintenanceList(orgId: authentication.profile?.orgId ?? ""),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();

    super.dispose();
  }

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
        BlocListener<MaintenanceStatusBloc, MaintenanceStatusState>(
          listener: (context, state) {
            if (state is MaintenanceStatusSuccess) {
              Snack.success("Maintenance status updated successfully");
              context.read<MaintenanceStaffBloc>().add(
                FetchStaffMaintenanceList(
                  orgId: authentication.profile?.orgId ?? "",
                ),
              );
            } else if (state is MaintenanceStatusFailed) {
              Snack.error(state.errorMessage);
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: PlatformAppBar(
          title: 'Maintenance Dashboard',
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
        body: SafeArea(
          child: BlocBuilder<MaintenanceStaffBloc, MaintenanceStaffState>(
            builder: (context, state) {
              if (state is MaintenanceStaffLoading) {
                return Center(child: CircularProgressIndicator());
              }

              if (state is MaintenanceStaffFailed) {
                return ErrorStateView(
                  retryOnTap: _retry,
                  message: state.message,
                );
              }

              if (state is MaintenanceStaffSuccess) {
                return RefreshIndicator(
                  onRefresh: () async => _retry(),
                  child: CustomScrollView(
                    controller: _scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: MaintenanceDashboardHeader(
                          overview: state.overview,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                            AppConsts.pSide,
                            AppConsts.pSide,
                            AppConsts.pSide,
                            AppConsts.pSmall,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Maintenance Requests',
                                  style: context.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Text(
                                '//${state.overview.maintenanceList.length} tickets',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (state.overview.maintenanceList.isEmpty)
                        const SliverFillRemaining(
                          hasScrollBody: false,
                          child: EmptyStateView(message: "No tickets"),
                        )
                      else
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppConsts.pSide,
                          ),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                final request =
                                    state.overview.maintenanceList[index];

                                return GestureDetector(
                                  onTap: () async {
                                    showMaintenanceStatusUpdateSheet(
                                      context,
                                      request,
                                    );
                                  },
                                  child: MaintenanceCard(
                                    maintenanceRequest: request,
                                  ),
                                );
                              },
                              childCount: state.overview.maintenanceList.length,
                            ),
                          ),
                        ),
                      if (state.isLoadingMore)
                        const SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.all(AppConsts.pSide),
                            child: Center(child: CircularProgressIndicator()),
                          ),
                        ),
                      const SliverToBoxAdapter(
                        child: SizedBox(height: AppConsts.pSide),
                      ),
                    ],
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
