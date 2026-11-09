import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/utils/snackbar_manager.dart';
import 'package:naseem/module/admin/maintainence/model/add_maintenance.dart';
import 'package:naseem/module/staff/controller/maintaince_staff/bloc/status/maintenance_status_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../../core/widgets/empty_state_view.dart';
import '../../../../../core/widgets/error_state_view.dart';
import '../../../../../core/widgets/load_more_button.dart';
import '../../../../../core/widgets/more_options/more_option_item.dart';
import '../../../../../core/widgets/more_options/more_options_sheet.dart';
import '../../../../../routes/args/add_maintenance_args.dart';
import '../../../../../routes/router_path.dart';
import '../../../../auth/core/controller/service/auth_service.dart';
import '../../../../staff/view/maintaince_staff/sheet/show_maintenance_update_sheet.dart';
import '../../controller/bloc/bloc/maintenance_list_bloc.dart';
import '../../controller/bloc/maintenance_bloc.dart';
import 'widgets/maintenance_card.dart';

class MaintenanceListScreen extends StatefulWidget {
  const MaintenanceListScreen({
    super.key,
    this.unitId,
    required this.isFromResident,
  });

  final String? unitId;
  final bool isFromResident;

  @override
  State<MaintenanceListScreen> createState() => _MaintenanceListScreenState();
}

class _MaintenanceListScreenState extends State<MaintenanceListScreen> {
  MaintenanceListBloc get _maintenanceBloc =>
      context.read<MaintenanceListBloc>();

  @override
  void initState() {
    super.initState();
    _getMaintenanceList();
  }

  void _getMaintenanceList() {
    log(
      "isFromResident: ${widget.isFromResident} "
      "unitId: ${widget.unitId}",
    );

    // If opened from resident and unitId is null or empty, don't fetch.
    if (widget.isFromResident &&
        (widget.unitId == null || widget.unitId!.trim().isEmpty)) {
      return;
    }

    _maintenanceBloc.add(
      GetMaintenanceListEvent(
        orgId: authentication.profile?.orgId ?? '',
        unitId: widget.unitId,
      ),
    );
  }

  // REFRESH / RETRY

  void _retry() {
    if (!mounted) return;

    _getMaintenanceList();
  }

  Future<void> _refresh() async {
    if (!mounted) return;

    // Wait for the next first-page response.
    final refreshFuture = _maintenanceBloc.stream.firstWhere(
      (state) =>
          state is MaintenanceListSuccess || state is MaintenanceListFailed,
    );

    _getMaintenanceList();

    await refreshFuture;
  }

  // LOAD MORE

  void _loadMore() {
    if (!mounted) return;

    _maintenanceBloc.add(const LoadMoreMaintenanceEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<MaintenanceBloc, MaintenanceState>(
          listener: (context, state) {
            if (state is MaintenanceAddSuccess) {
              _refresh();
            } else if (state is MaintenanceFailed) {
              Snack.error(state.message);
            }
          },
        ),
        BlocListener<MaintenanceStatusBloc, MaintenanceStatusState>(
          listener: (context, state) {
            if (state is MaintenanceStatusSuccess) {
              _refresh();
            } else if (state is MaintenanceStatusFailed) {
              Snack.error(state.errorMessage);
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Maintenance Requests',
          leadingOnTap: () => context.pop(),
        ),
        body: BlocBuilder<MaintenanceListBloc, MaintenanceListState>(
          builder: (context, state) {
            // INITIAL LOADING
            if (state is MaintenanceListLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // SUCCESS
            if (state is MaintenanceListSuccess) {
              final maintenanceList = state.maintenanceList;

              // EMPTY
              if (maintenanceList.isEmpty) {
                return RefreshIndicator(
                  onRefresh: _refresh,
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.65,
                        child: EmptyStateView(
                          message: 'No matching maintenance requests',
                        ),
                      ),
                    ],
                  ),
                );
              }

              final showFooter =
                  state.hasMore ||
                  state.isLoadingMore ||
                  state.loadMoreError != null;

              return RefreshIndicator(
                onRefresh: _refresh,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(
                    AppConsts.pSide,
                    0,
                    AppConsts.pSide,
                    16,
                  ),
                  itemCount: maintenanceList.length + (showFooter ? 1 : 0),
                  itemBuilder: (context, index) {
                    // MAINTENANCE ITEM
                    if (index < maintenanceList.length) {
                      final maintenance = maintenanceList[index];

                      return GestureDetector(
                        onTap: () {
                          MoreOptionsBottomSheet.show(
                            context: context,
                            items: [
                              // UPDATE STATUS
                              MoreOptionItem(
                                title: 'Update Status',
                                icon: Icons.sync_alt_rounded,
                                onTap: () {
                                  showMaintenanceStatusUpdateSheet(
                                    context,
                                    maintenance,
                                    true,
                                  );
                                },
                              ),

                              // EDIT MAINTENANCE
                              MoreOptionItem(
                                title: 'Edit Maintenance',
                                icon: Icons.edit_outlined,
                                onTap: () {
                                  context.push(
                                    RouterPath.addMaintenance,
                                    extra: AddMaintenanceArgs(
                                      maintenance: AddMaintenance(
                                        id: maintenance.id,
                                        orgId: maintenance.orgId,
                                        unitId: maintenance.unitId,
                                        createdBy: maintenance.createdBy,
                                        residentId: maintenance.residentId,
                                        issueTitle: maintenance.issueTitle,
                                        issueType: maintenance.issueType,
                                        ticketNumber: maintenance.ticketNumber,
                                        description: maintenance.description,
                                        priority: maintenance.priority,
                                        status: maintenance.status,
                                        unitName: maintenance.unitName,
                                        communityId: maintenance.communityId,
                                        communityName:
                                            maintenance.communityName,
                                      ),
                                      isEdit: true,
                                    ),
                                  );
                                },
                              ),

                              // DELETE MAINTENANCE
                              MoreOptionItem(
                                title: 'Delete Maintenance',
                                icon: Icons.delete_outline_rounded,
                                isDestructive: true,
                                confirmTitle: 'Delete Maintenance Request?',
                                confirmMessage:
                                    'Are you sure you want to delete this maintenance request?',
                                onTap: () {
                                  context.read<MaintenanceBloc>().add(
                                    DeleteMaintenanceEvent(
                                      maintenanceId: maintenance.id,
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                        child: MaintenanceCard(maintenanceRequest: maintenance),
                      );
                    }

                    // PAGINATION FOOTER

                    if (state.isLoadingMore) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    if (state.loadMoreError != null) {
                      return LoadMoreButton(
                        onTap: _loadMore,
                        title: 'Retry',
                        isError: true,
                      );
                    }

                    if (!state.hasMore) {
                      return const SizedBox.shrink();
                    }

                    return Center(
                      child: LoadMoreButton(onTap: _loadMore, isLoading: false),
                    );
                  },
                ),
              );
            }

            // INITIAL ERROR
            if (state is MaintenanceListFailed) {
              return ErrorStateView(message: state.message, retryOnTap: _retry);
            }

            return EmptyStateView(message: 'No matching maintenance requests');
          },
        ),
      ),
    );
  }
}
