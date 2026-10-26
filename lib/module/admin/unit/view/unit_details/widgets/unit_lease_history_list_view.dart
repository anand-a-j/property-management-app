import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/widgets/empty_state_view.dart';
import '../../../../../../core/widgets/error_state_view.dart';
import '../../../../../../routes/args/lease_details_args.dart';
import '../../../../../../routes/router_path.dart';
import '../../../../../auth/core/controller/service/auth_service.dart';
import '../../../../community/model/community.dart';
import '../../../../lease/controller/blocs/bloc/lease_list_bloc.dart';
import '../../../../lease/view/list/widgets/lease_card.dart';
import '../../../model/unit.dart';

class UnitLeaseHistoryListView extends StatelessWidget {
  const UnitLeaseHistoryListView({super.key, required this.unit, required this.community});

  final Unit unit;
  final Community community;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaseListBloc, LeaseListState>(
      builder: (context, state) {
        if (state is LeaseListLoading) {
          return const SizedBox(
            height: 400,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is LeaseListFailed) {
          return ErrorStateView(
            isHalf: true,
            message: state.message,
            retryOnTap: () => _fetchLeases(context),
          );
        }

        if (state is! LeaseListSuccess) {
          return const SizedBox.shrink();
        }

        if (state.leases.isEmpty) {
          return EmptyStateView(
            message: 'No lease history found',
            isHalf: true,
          );
        }

        return Column(
          children: [
            ...state.leases.map(
              (lease) => Padding(
                padding: const EdgeInsets.only(bottom: AppConsts.pMedium),
                child: GestureDetector(
                  onTap: () {
                    context.push(
                      RouterPath.leaseDetails,
                      extra: LeaseDetailsArgs(
                        lease: lease,
                        unit: unit,
                        community: community,
                      ),
                    );
                  },
                  child: LeaseCard(lease: lease),
                ),
              ),
            ),

            if (state.isLoadingMore)
              const Padding(
                padding: EdgeInsets.all(AppConsts.pMedium),
                child: Center(child: CircularProgressIndicator()),
              )
            else if (state.hasMore)
              TextButton(
                onPressed: () {
                  context.read<LeaseListBloc>().add(const LoadMoreLeases());
                },
                child: const Text('Load more leases'),
              ),
          ],
        );
      },
    );
  }

  void _fetchLeases(BuildContext context) {
    context.read<LeaseListBloc>().add(
      GetLeases(
        orgId: authentication.profile?.orgId ?? '',
        unitId: unit.id,
        searchQuery: '',
        isDraftOnly: false,
      ),
    );
  }
}
