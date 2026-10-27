import 'dart:async' show Timer;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/widgets/error_state_view.dart' show ErrorStateView;
import 'package:naseem/module/admin/lease/view/list/widgets/lease_card.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';

import '../../../../../core/core.dart';
import '../../../../../core/widgets/empty_state_view.dart';
import '../../../../../core/widgets/load_more_button.dart';
import '../../controller/blocs/bloc/lease_list_bloc.dart';
import '../../model/lease.dart';

class LeaseListScreen extends StatefulWidget {
  const LeaseListScreen({super.key, this.isSelectionMode = false});

  final bool isSelectionMode;

  @override
  State<LeaseListScreen> createState() => _LeaseListScreenState();
}

class _LeaseListScreenState extends State<LeaseListScreen> {
  Timer? _searchDebounce;

  @override
  void initState() {
    super.initState();
    _fetchLeases();
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    super.dispose();
  }

  void _fetchLeases({String searchQuery = ''}) {
    context.read<LeaseListBloc>().add(
      GetLeases(
        orgId: authentication.profile?.orgId ?? '',
        searchQuery: searchQuery,
        isDraftOnly: widget.isSelectionMode,
      ),
    );
  }

  void _onSearch(String query) {
    _searchDebounce?.cancel();

    _searchDebounce = Timer(const Duration(milliseconds: 350), () {
      if (!mounted) return;

      context.read<LeaseListBloc>().add(
        SearchLeases(
          orgId: authentication.profile?.orgId ?? '',
          searchQuery: query.trim(),
          isDraftOnly: widget.isSelectionMode,
        ),
      );
    });
  }

  void _loadMore() {
    context.read<LeaseListBloc>().add(const LoadMoreLeases());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.isSelectionMode ? 'Select Lease' : 'Leases',
        leadingOnTap: () => context.pop(),
      ),
      body: Column(
        children: [
          SearchTextField(title: 'Search Leases', onChanged: _onSearch),
          const SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<LeaseListBloc, LeaseListState>(
              builder: (context, state) {
                if (state is LeaseListInitial || state is LeaseListLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is LeaseListFailed) {
                  return ErrorStateView(
                    message: state.message,
                    retryOnTap: () => _fetchLeases(),
                  );
                }

                if (state is! LeaseListSuccess) {
                  return const SizedBox.shrink();
                }

                final leases = state.leases;

                if (leases.isEmpty) {
                  return const EmptyStateView(message: 'Lease not found');
                }

                // Include the footer as a list item so it appears
                // immediately after the last lease card.
                final showFooter =
                    state.hasMore ||
                    state.isLoadingMore ||
                    state.loadMoreError != null;

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConsts.pSide,
                  ),
                  itemCount: leases.length + (showFooter ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < leases.length) {
                      final lease = leases[index];

                      return GestureDetector(
                        onTap: () {
                          if (widget.isSelectionMode) {
                            context.pop<Lease>(lease);
                          }
                        },
                        child: LeaseCard(lease: lease),
                      );
                    }

                    // Pagination footer.
                    if (state.isLoadingMore) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    if (state.loadMoreError != null) {
                      LoadMoreButton(
                        onTap: _loadMore,
                        title: 'View More',
                        isError: true,
                      );
                    }

                    return Center(
                      child: LoadMoreButton(onTap: _loadMore, isLoading: false),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
