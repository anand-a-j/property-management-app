import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/module/admin/visitor/view/list/widgets/visitor_card.dart';

import '../../../../../core/core.dart';
import '../../../../../core/utils/snackbar_manager.dart';
import '../../../../../core/widgets/empty_state_view.dart';
import '../../../../../core/widgets/error_state_view.dart';
import '../../../../../core/widgets/load_more_button.dart';
import '../../../../auth/core/controller/service/auth_service.dart';
import '../../../../staff/view/security/sheet/visitor_status_update_sheet.dart';
import '../../controller/bloc/bloc/visitor_list_bloc.dart';
import '../../controller/bloc/visitor_bloc.dart';

class VisitorListScreen extends StatefulWidget {
  const VisitorListScreen({
    super.key,
    required this.orgId,
    this.unitId,
    required this.isFromResident,
  });

  final String orgId;
  final String? unitId;
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

  void _getVisitors() {
    if (widget.isFromResident && (widget.unitId?.trim().isEmpty ?? true)) {
      return;
    }

    context.read<VisitorListBloc>().add(
      GetVisitorsEvent(orgId: widget.orgId, unitId: widget.unitId),
    );
  }

  void _loadMore() {
    if (widget.isFromResident && (widget.unitId?.trim().isEmpty ?? true)) {
      return;
    }

    context.read<VisitorListBloc>().add(
      LoadMoreVisitorsEvent(orgId: widget.orgId, unitId: widget.unitId),
    );
  }

  Future<void> _refreshVisitors() async {
    if (widget.isFromResident && (widget.unitId?.trim().isEmpty ?? true)) {
      return;
    }

    final bloc = context.read<VisitorListBloc>();

    bloc.add(GetVisitorsEvent(orgId: widget.orgId, unitId: widget.unitId));

    await bloc.stream.firstWhere(
      (state) => state is VisitorListSuccess || state is VisitorListFailed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VisitorBloc, VisitorState>(
      listener: (context, state) {
        if (state is VisitorStatusUpdated) {
          Snack.success("Update status successfully!!!");

          context.read<VisitorListBloc>().add(
            GetVisitorsEvent(orgId: authentication.profile?.orgId ?? ""),
          );
        } else if (state is VisitorStatusUpdateFailed) {
          Snack.error(state.message);
        }
      },

      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Visitors',
          leadingOnTap: () =>
              widget.isFromResident ? null : Navigator.pop(context),
        ),
        body: BlocBuilder<VisitorListBloc, VisitorListState>(
          builder: (context, state) {
            // Initial loading
            if (state is VisitorListLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // Error
            if (state is VisitorListFailed) {
              return ErrorStateView(
                message: state.message,
                retryOnTap: _getVisitors,
              );
            }

            // Success
            if (state is VisitorListSuccess) {
              final visitors = state.visitors;

              // Empty
              if (visitors.isEmpty) {
                return RefreshIndicator(
                  onRefresh: _refreshVisitors,
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: const [
                      SizedBox(height: 180),
                      EmptyStateView(message: 'No visitors found'),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: _refreshVisitors,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(
                    AppConsts.pSide,
                    4,
                    AppConsts.pSide,
                    0,
                  ),
                  itemCount: visitors.length + 1,
                  itemBuilder: (context, index) {
                    // Pagination
                    if (index == visitors.length) {
                      if (!state.hasMore) {
                        return const SizedBox(height: 20);
                      }

                      if (state.isLoadingMore) {
                        return Center(child: CircularProgressIndicator());
                      }

                      return LoadMoreButton(onTap: _loadMore);
                    }

                    final visitor = visitors[index];

                    return GestureDetector(
                      onTap: () {
                        showVisitorStatusUpdateSheet(context, visitor, true);
                      },
                      child: VisitorCard(visitor: visitor),
                    );
                  },
                ),
              );
            }

            return widget.isFromResident
                ? const EmptyStateView(message: 'No visitors found')
                : const SizedBox.shrink();
          },
        ),
        floatingActionButton: widget.isFromResident
            ? null
            : FloatingAddButton(
                title: 'Add Visitor',
                onTap: () async {
                  final result = await context.push<bool>('/add-visitor');

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
