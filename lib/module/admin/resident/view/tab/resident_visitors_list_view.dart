import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/core.dart';

import '../../../../../core/widgets/empty_state_view.dart';
import '../../../../../core/widgets/error_state_view.dart';
import '../../../../../core/widgets/load_more_button.dart';
import '../../../visitor/controller/bloc/bloc/visitor_list_bloc.dart';
import '../../../visitor/view/list/widgets/visitor_card.dart';

class ResidentVisitorsListView extends StatefulWidget {
  const ResidentVisitorsListView({
    super.key,
    required this.orgId,
    required this.unitId,
    required this.residentId,
  });

  final String orgId;
  final String unitId;
  final String residentId;

  @override
  State<ResidentVisitorsListView> createState() =>
      _ResidentVisitorsListViewState();
}

class _ResidentVisitorsListViewState extends State<ResidentVisitorsListView> {
  @override
  void initState() {
    super.initState();
    _getVisitors();
  }

  void _getVisitors() {
    context.read<VisitorListBloc>().add(
      GetVisitorsEvent(
        orgId: widget.orgId,
        unitId: widget.unitId,
        residentId: widget.residentId,
      ),
    );
  }

  void _loadMore() {
    context.read<VisitorListBloc>().add(
      LoadMoreVisitorsEvent(
        orgId: widget.orgId,
        unitId: widget.unitId,
        residentId: widget.residentId,
      ),
    );
  }

  Future<void> _refreshVisitors() async {
    final bloc = context.read<VisitorListBloc>();

    bloc.add(
      GetVisitorsEvent(
        orgId: widget.orgId,
        unitId: widget.unitId,
        residentId: widget.residentId,
      ),
    );

    await bloc.stream.firstWhere(
      (state) => state is VisitorListSuccess || state is VisitorListFailed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VisitorListBloc, VisitorListState>(
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
                  SizedBox(height: 100),
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
                8,
                AppConsts.pSide,
                16,
              ),
              itemCount: visitors.length + 1,
              itemBuilder: (context, index) {
                // Pagination footer
                if (index == visitors.length) {
                  if (!state.hasMore) {
                    return const SizedBox(height: 20);
                  }

                  if (state.isLoadingMore) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  return LoadMoreButton(onTap: _loadMore);
                }

                final visitor = visitors[index];

                return VisitorCard(visitor: visitor);
              },
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
