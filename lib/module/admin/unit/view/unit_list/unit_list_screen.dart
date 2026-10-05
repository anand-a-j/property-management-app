import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/widgets/empty_state_view.dart';
import 'package:naseem/core/widgets/error_state_view.dart';
import 'package:naseem/module/admin/community/model/community.dart';
import 'package:naseem/module/admin/unit/view/unit_list/widgets/unit_card.dart';

import '../../../../../core/core.dart';
import '../../controller/bloc/unit_bloc.dart';

class UnitListScreen extends StatefulWidget {
  const UnitListScreen({super.key, required this.community});

  final Community community;

  @override
  State<UnitListScreen> createState() => _UnitListScreenState();
}

class _UnitListScreenState extends State<UnitListScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    _scrollController.addListener(_onScroll);

    // Initial load
    context.read<UnitBloc>().add(GetUnits(communityId: widget.community.id));
  }

  void _onScroll() {
    // Start loading when user gets near the bottom.
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<UnitBloc>().add(
        LoadMoreUnits(communityId: widget.community.id),
      );
    }
  }

  void _onSearch(String query) {
    context.read<UnitBloc>().add(
      SearchUnits(communityId: widget.community.id, searchQuery: query),
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
    return Scaffold(
      appBar: const CustomAppBar(title: 'Units'),

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
                    return EmptyStateView(message: "Unit not found");
                  }

                  return ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
                    itemCount: units.length + (state.isLoadingMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      // Pagination loader at bottom
                      if (index == units.length) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      final unit = units[index];

                      return UnitCard(
                        // Pass unit if your UnitCard accepts it.
                        // unit: unit,
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
          // Add unit action
        },
      ),
    );
  }
}
