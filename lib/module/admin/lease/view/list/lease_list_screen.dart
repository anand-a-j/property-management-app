import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/widgets/error_state_view.dart' show ErrorStateView;
import 'package:naseem/module/admin/lease/view/list/widgets/lease_card.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';

import '../../../../../core/core.dart';
import '../../../../../core/widgets/empty_state_view.dart';
import '../../controller/blocs/bloc/lease_bloc.dart';
import '../../model/lease.dart';

class LeaseListScreen extends StatefulWidget {
  const LeaseListScreen({super.key, this.isSelectionMode = false});

  final bool isSelectionMode;

  @override
  State<LeaseListScreen> createState() => _LeaseListScreenState();
}

class _LeaseListScreenState extends State<LeaseListScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    // Initial load
    context.read<LeaseBloc>().add(
      GetLeases(orgId: authentication.profile?.orgId ?? ""),
    );
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<LeaseBloc>().add(LoadMoreLeases());
    }
  }

  void _onSearch(String query) {
    context.read<LeaseBloc>().add(
      SearchLeases(
        orgId: authentication.profile?.orgId ?? "",
        searchQuery: query,
      ),
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
      appBar: CustomAppBar(
        title: widget.isSelectionMode ? 'Select Lease' : 'Leases',
      ),

      body: Column(
        children: [
          SearchTextField(title: 'Search Leases', onChanged: _onSearch),

          Expanded(
            child: BlocBuilder<LeaseBloc, LeaseState>(
              builder: (context, state) {
                // Initial loading
                if (state is LeasesLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                // Error
                if (state is LeasesFailed) {
                  return ErrorStateView(
                    message: state.message,
                    retryOnTap: () {
                      context.read<LeaseBloc>().add(
                        GetLeases(orgId: authentication.profile?.orgId ?? ""),
                      );
                    },
                  );
                }

                // Success
                if (state is LeasesSuccess) {
                  final leases = state.leases;

                  // Empty
                  if (leases.isEmpty) {
                    return const EmptyStateView(message: 'Lease not found');
                  }

                  return ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.fromLTRB(
                      AppConsts.pSide,
                      15,
                      AppConsts.pSide,
                      10,
                    ),
                    itemCount: leases.length + (state.isLoadingMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      // Pagination loader
                      if (index == leases.length) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      final lease = leases[index];

                      return GestureDetector(
                        onTap: () {
                          context.pop<Lease>(lease);
                        },
                        child: LeaseCard(lease: lease),
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
    );
  }
}
