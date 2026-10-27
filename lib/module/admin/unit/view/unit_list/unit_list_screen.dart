import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/widgets/empty_state_view.dart';
import 'package:naseem/core/widgets/error_state_view.dart';
import 'package:naseem/core/widgets/load_more_button.dart';
import 'package:naseem/module/admin/community/model/community.dart';
import 'package:naseem/module/admin/unit/model/unit_list_item.dart';
import 'package:naseem/module/admin/unit/view/unit_list/widgets/unit_card.dart';
import 'package:naseem/routes/args/add_unit_args.dart';
import 'package:naseem/routes/args/unit_details_args.dart';
import 'package:naseem/routes/router_path.dart';

import '../../../../../core/core.dart';
import '../../controller/bloc/bloc/unit_list_bloc.dart';

class UnitListScreen extends StatefulWidget {
  const UnitListScreen({super.key, required this.community});

  final Community community;

  @override
  State<UnitListScreen> createState() => _UnitListScreenState();
}

class _UnitListScreenState extends State<UnitListScreen> {
  Timer? _searchDebounce;

  @override
  void initState() {
    super.initState();

    context.read<UnitListBloc>().add(
      GetUnits(communityId: widget.community.id ?? ''),
    );
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    super.dispose();
  }

  void _onSearch(String query) {
    _searchDebounce?.cancel();

    _searchDebounce = Timer(const Duration(milliseconds: 350), () {
      if (!mounted) return;

      context.read<UnitListBloc>().add(
        SearchUnits(communityId: widget.community.id ?? '', searchQuery: query),
      );
    });
  }

  void _loadMore() {
    context.read<UnitListBloc>().add(
      LoadMoreUnits(communityId: widget.community.id ?? ''),
    );
  }

  void _refresh() {
    context.read<UnitListBloc>().add(
      GetUnits(communityId: widget.community.id ?? ''),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Units',
        leadingOnTap: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          SearchTextField(title: 'Search Units', onChanged: _onSearch),
          Expanded(
            child: BlocBuilder<UnitListBloc, UnitListState>(
              builder: (context, state) {
                if (state is UnitListInitial || state is UnitListLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is UnitListFailed) {
                  return ErrorStateView(
                    message: state.message,
                    retryOnTap: _refresh,
                  );
                }

                if (state is! UnitLoadSuccess) {
                  return const SizedBox.shrink();
                }

                final units = state.units;

                if (units.isEmpty) {
                  return const EmptyStateView(message: 'Unit not found');
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    _refresh();

                    // Wait for the first-page request to finish.
                    await context.read<UnitListBloc>().stream.firstWhere(
                      (nextState) =>
                          nextState is UnitLoadSuccess ||
                          nextState is UnitListFailed,
                    );
                  },
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(
                      AppConsts.pSide,
                      15,
                      AppConsts.pSide,
                      16,
                    ),
                    itemCount: units.length + 1,
                    itemBuilder: (context, index) {
                      if (index < units.length) {
                        final unit = units[index];

                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            context.push(
                              RouterPath.unitDetails,
                              extra: UnitDetailsArgs(
                                unit: unit.toUnit(),
                                community: widget.community,
                              ),
                            );
                          },
                          child: UnitCard(unit: unit, index: index),
                        );
                      }

                      // Footer remains below the last item.
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

                      if (!state.hasMore) return const SizedBox.shrink();

                      return Center(
                        child: LoadMoreButton(
                          onTap: _loadMore,
                          isLoading: false,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingAddButton(
        title: 'Add Unit',
        onTap: () {
          context.push(
            RouterPath.addUnit,
            extra: AddUnitArgs(community: widget.community),
          );
        },
      ),
    );
  }
}
