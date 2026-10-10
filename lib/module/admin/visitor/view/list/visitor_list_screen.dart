import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/module/admin/visitor/view/list/widgets/visitor_card.dart';

import '../../../../../core/core.dart';
import '../../../../../core/widgets/empty_state_view.dart';
import '../../../../../core/widgets/error_state_view.dart';
import '../../../../../core/widgets/load_more_button.dart';
import '../../../../../routes/router_path.dart';
import '../../controller/bloc/visitor_bloc.dart';

class VisitorListScreen extends StatefulWidget {
  const VisitorListScreen({super.key, required this.orgId, this.unitId});

  final String orgId;
  final String? unitId;

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
    context.read<VisitorBloc>().add(
      GetVisitorsEvent(orgId: widget.orgId, unitId: widget.unitId),
    );
  }

  void _loadMore() {
    context.read<VisitorBloc>().add(
      LoadMoreVisitorsEvent(orgId: widget.orgId, unitId: widget.unitId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Visitors',
        leadingOnTap: () => Navigator.pop(context),
      ),
      body: BlocBuilder<VisitorBloc, VisitorState>(
        builder: (context, state) {
          // Initial loading
          if (state is VisitorLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Error
          if (state is VisitorFailed) {
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
              return const EmptyStateView(message: 'No visitors found');
            }

            return RefreshIndicator(
              onRefresh: () async {
                _getVisitors();
                await context.read<VisitorBloc>().stream.firstWhere(
                  (state) =>
                      state is VisitorListSuccess || state is VisitorFailed,
                );
              },
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(
                  AppConsts.pSide,
                  16,
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
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    return LoadMoreButton(onTap: _loadMore);
                  }

                  final visitor = visitors[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: VisitorCard(visitor: visitor),
                  );
                },
              ),
            );
          }

          return const SizedBox.shrink();
        },
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
              GetVisitorsEvent(orgId: widget.orgId, unitId: widget.unitId),
            );
          }
        },
      ),
    );
  }
}
