import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/module/admin/visitor/view/list/widgets/visitor_card.dart';
import 'package:naseem/routes/args/add_visitor_args.dart';

import '../../../../../core/core.dart';
import '../../../../../core/utils/snackbar_manager.dart';
import '../../../../../core/widgets/empty_state_view.dart';
import '../../../../../core/widgets/error_state_view.dart';
import '../../../../../core/widgets/load_more_button.dart';
import '../../../../staff/view/security/sheet/visitor_status_update_sheet.dart';
import '../../controller/bloc/bloc/visitor_list_bloc.dart';
import '../../controller/bloc/visitor_bloc.dart';

class VisitorListScreen extends StatefulWidget {
  const VisitorListScreen({
    super.key,
    required this.orgId,
    this.unitId,
    this.residentId,
    this.leaseId,
    required this.isFromResident,
  });

  final String orgId;
  final String? unitId;
  final String? residentId;
  final String? leaseId;
  final bool isFromResident;

  @override
  State<VisitorListScreen> createState() => _VisitorListScreenState();
}

class _VisitorListScreenState extends State<VisitorListScreen> {
  @override
  void initState() {
    super.initState();
    _getVisitors();
  }

  bool get _hasValidResidentUnit =>
      !widget.isFromResident || (widget.unitId?.trim().isNotEmpty ?? false);

  void _getVisitors() {
    if (!_hasValidResidentUnit) return;

    context.read<VisitorListBloc>().add(
      GetVisitorsEvent(
        orgId: widget.orgId,
        unitId: widget.unitId,
        residentId: widget.residentId,
      ),
    );
  }

  void _loadMore() {
    if (!_hasValidResidentUnit) return;

    context.read<VisitorListBloc>().add(
      LoadMoreVisitorsEvent(
        orgId: widget.orgId,
        unitId: widget.unitId,
        residentId: widget.residentId,
      ),
    );
  }

  Future<void> _refreshVisitors() async {
    if (!_hasValidResidentUnit) return;

    final bloc = context.read<VisitorListBloc>();

    // Listen before dispatching the event to avoid missing a fast response.
    final completed = bloc.stream.firstWhere(
      (state) => state is VisitorListSuccess || state is VisitorListFailed,
    );

    bloc.add(
      GetVisitorsEvent(
        orgId: widget.orgId,
        unitId: widget.unitId,
        residentId: widget.residentId,
      ),
    );

    // If the current state is already loading, wait for the next result.
    // The stream subscription above is established before the event.
    await completed;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VisitorBloc, VisitorState>(
      listener: (context, state) {
        if (state is VisitorStatusUpdated) {
          Snack.success('Visitor status updated successfully!');

          // Preserve the active organization and filters.
          _getVisitors();
        } else if (state is VisitorStatusUpdateFailed) {
          Snack.error(state.message);
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Visitors',
          leadingOnTap: () {
            if (!widget.isFromResident) {
              Navigator.pop(context);
            }
          },
        ),
        body: BlocBuilder<VisitorListBloc, VisitorListState>(
          builder: (context, state) {
            if (state is VisitorListInitial || state is VisitorListLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is VisitorListFailed) {
              return ErrorStateView(
                message: state.message,
                retryOnTap: _getVisitors,
              );
            }

            if (state is! VisitorListSuccess) {
              return widget.isFromResident
                  ? const EmptyStateView(message: 'No visitors found')
                  : const SizedBox.shrink();
            }

            final visitors = state.visitors;

            return RefreshIndicator(
              onRefresh: _refreshVisitors,
              child: visitors.isEmpty
                  ? EmptyStateView(message: 'No visitors found')
                  : ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(
                        AppConsts.pSide,
                        0,
                        AppConsts.pSide,
                        40,
                      ),
                      itemCount:
                          visitors.length +
                          (state.hasMore ||
                                  state.isLoadingMore ||
                                  state.loadMoreError != null
                              ? 1
                              : 0),
                      itemBuilder: (context, index) {
                        // Pagination footer.
                        if (index == visitors.length) {
                          if (state.isLoadingMore) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }

                          if (state.loadMoreError != null) {
                            return LoadMoreButton(
                              onTap: _loadMore,
                              isError: true,
                              title: 'Retry',
                            );
                          }

                          if (!state.hasMore) {
                            return const SizedBox(height: 20);
                          }

                          return LoadMoreButton(onTap: _loadMore);
                        }

                        final visitor = visitors[index];

                        return GestureDetector(
                          onTap: () {
                            if (!widget.isFromResident) {
                              showVisitorStatusUpdateSheet(
                                context,
                                visitor,
                                true,
                              );
                            }
                          },
                          child: VisitorCard(visitor: visitor),
                        );
                      },
                    ),
            );
          },
        ),
        floatingActionButton:
            widget.isFromResident &&
                (widget.unitId == null ||
                    widget.residentId == null ||
                    widget.leaseId == null)
            ? null
            : FloatingAddButton(
                title: 'Add Visitor',
                onTap: () async {
                  final result = await context.push<bool>(
                    '/add-visitor',
                    extra: AddVisitorArgs(
                      isResident: widget.isFromResident,
                      leaseId: widget.isFromResident ? widget.leaseId : null,
                      residentId: widget.isFromResident
                          ? widget.residentId
                          : null,
                      unitId: widget.isFromResident ? widget.unitId : null,
                    ),
                  );

                  if (!mounted) return;

                  if (result == true) {
                    _getVisitors();
                  }
                },
              ),
      ),
    );
  }
}
