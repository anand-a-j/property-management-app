import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/core.dart';

import '../../../../../core/widgets/empty_state_view.dart';
import '../../../../../core/widgets/error_state_view.dart';
import '../../../../../core/widgets/load_more_button.dart';
import '../../../../auth/core/controller/service/auth_service.dart';
import '../../../lease/controller/blocs/bloc/lease_list_bloc.dart';
import '../../../lease/view/list/widgets/lease_card.dart';

class ResidentDetailsLeaseListView extends StatefulWidget {
  const ResidentDetailsLeaseListView({super.key, required this.residentId});

  final String residentId;

  @override
  State<ResidentDetailsLeaseListView> createState() =>
      _ResidentDetailsLeaseListViewState();
}

class _ResidentDetailsLeaseListViewState
    extends State<ResidentDetailsLeaseListView> {
  @override
  void initState() {
    super.initState();
    _fetchLeases();
  }

  void _fetchLeases() {
    context.read<LeaseListBloc>().add(
      GetLeases(
        orgId: authentication.profile?.orgId ?? '',
        residentId: widget.residentId,
      ),
    );
  }

  void _loadMore() {
    context.read<LeaseListBloc>().add(const LoadMoreLeases());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaseListBloc, LeaseListState>(
      builder: (context, state) {
        if (state is LeaseListInitial || state is LeaseListLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is LeaseListFailed) {
          return ErrorStateView(
            message: state.message,
            retryOnTap: _fetchLeases,
          );
        }

        if (state is! LeaseListSuccess) {
          return const SizedBox.shrink();
        }

        final leases = state.leases;

        if (leases.isEmpty) {
          return const EmptyStateView(message: 'Lease not found');
        }

        final showFooter =
            state.hasMore || state.isLoadingMore || state.loadMoreError != null;

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
          itemCount: leases.length + (showFooter ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < leases.length) {
              return LeaseCard(lease: leases[index]);
            }

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

            return Center(
              child: LoadMoreButton(onTap: _loadMore, isLoading: false),
            );
          },
        );
      },
    );
  }
}
