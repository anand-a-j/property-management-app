import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../../core/widgets/empty_state_view.dart';
import '../../../../../core/widgets/error_state_view.dart';
import '../../../../../core/widgets/load_more_button.dart';
import '../../../../admin/visitor/controller/bloc/bloc/visitor_list_bloc.dart';
import '../../../../admin/visitor/controller/bloc/visitor_bloc.dart';
import '../../../../admin/visitor/view/list/widgets/visitor_card.dart';
import '../sheet/visitor_status_update_sheet.dart';

class SecurityVisitorTab extends StatefulWidget {
  const SecurityVisitorTab({super.key, required this.orgId});

  final String orgId;

  @override
  State<SecurityVisitorTab> createState() => _SecurityVisitorTabState();
}

class _SecurityVisitorTabState extends State<SecurityVisitorTab> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _getVisitors();
    });
  }

  void _getVisitors() {
    if (widget.orgId.trim().isEmpty) return;

    context.read<VisitorListBloc>().add(GetVisitorsEvent(orgId: widget.orgId));
  }

  void _loadMore() {
    final state = context.read<VisitorListBloc>().state;

    if (state is! VisitorListSuccess) return;
    if (!state.hasMore || state.isLoadingMore) return;

    context.read<VisitorListBloc>().add(
      LoadMoreVisitorsEvent(orgId: widget.orgId),
    );
  }

  Future<void> _refreshVisitors() async {
    if (widget.orgId.trim().isEmpty) return;

    final bloc = context.read<VisitorListBloc>();

    bloc.add(GetVisitorsEvent(orgId: widget.orgId));

    await bloc.stream.firstWhere(
      (state) => state is VisitorListSuccess || state is VisitorListFailed,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.orgId.trim().isEmpty) {
      return const EmptyStateView(
        message: 'Organization information is missing',
      );
    }

    return Column(
      children: [
        Expanded(
          child: BlocBuilder<VisitorListBloc, VisitorListState>(
            builder: (context, state) {
              if (state is VisitorListLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is VisitorListFailed) {
                return ErrorStateView(
                  message: state.message,
                  retryOnTap: _getVisitors,
                );
              }

              if (state is VisitorListSuccess) {
                final visitors = state.visitors;

                if (visitors.isEmpty) {
                  return RefreshIndicator(
                    onRefresh: _refreshVisitors,
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: const [
                        SizedBox(height: 120),
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
                      16,
                      AppConsts.pSide,
                      24,
                    ),
                    itemCount: visitors.length + 1,
                    itemBuilder: (context, index) {
                      if (index == visitors.length) {
                        if (!state.hasMore) {
                          return const SizedBox(height: 20);
                        }

                        if (state.isLoadingMore) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Center(child: CircularProgressIndicator()),
                          );
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

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}
