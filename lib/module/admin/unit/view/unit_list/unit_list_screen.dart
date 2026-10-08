import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/widgets/empty_state_view.dart';
import 'package:naseem/core/widgets/error_state_view.dart';
import 'package:naseem/core/widgets/load_more_button.dart';
import 'package:naseem/module/admin/community/model/community.dart';
import 'package:naseem/module/admin/unit/view/unit_list/widgets/unit_card.dart';
import 'package:naseem/routes/args/add_unit_args.dart';
import 'package:naseem/routes/args/unit_details_args.dart';
import 'package:naseem/routes/router_path.dart';

import '../../../../../core/core.dart';
import '../../controller/bloc/unit_bloc.dart';

class UnitListScreen extends StatefulWidget {
  const UnitListScreen({super.key, required this.community});

  final Community community;

  @override
  State<UnitListScreen> createState() => _UnitListScreenState();
}

class _UnitListScreenState extends State<UnitListScreen> {
  @override
  void initState() {
    super.initState();

    context.read<UnitBloc>().add(GetUnits(communityId: widget.community.id));
  }

  void _onSearch(String query) {
    context.read<UnitBloc>().add(
      SearchUnits(communityId: widget.community.id, searchQuery: query),
    );
  }

  void _loadMore() {
    context.read<UnitBloc>().add(
      LoadMoreUnits(communityId: widget.community.id),
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
            child: BlocBuilder<UnitBloc, UnitState>(
              builder: (context, state) {
                // Initial loading
                if (state is UnitLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                // Error
                if (state is UnitFailed) {
                  return ErrorStateView(
                    retryOnTap: () {
                      context.read<UnitBloc>().add(
                        GetUnits(communityId: widget.community.id),
                      );
                    },
                    message: state.message,
                  );
                }

                // Success
                if (state is UnitLoadSuccess) {
                  final units = state.units;

                  // Empty
                  if (units.isEmpty) {
                    return const EmptyStateView(message: 'Unit not found');
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.fromLTRB(
                      AppConsts.pSide,
                      15,
                      AppConsts.pSide,
                      0,
                    ),
                    itemCount: units.length + 1,
                    itemBuilder: (context, index) {
                      if (index == units.length) {
                        if (!state.hasMore) {
                          return const SizedBox(height: 20);
                        }

                        return LoadMoreButton(
                          onTap: () {
                            if (state.isLoadingMore) {
                              _loadMore();
                            }
                          },
                        );
                      }

                      final unit = units[index];

                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          context.push(
                            RouterPath.unitDetails,
                            extra: UnitDetailsArgs(
                              unit: unit,
                              community: widget.community,
                            ),
                          );
                        },
                        child: UnitCard(unit: unit),
                      );
                    },
                  );
                }

                return const SizedBox.shrink();
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
