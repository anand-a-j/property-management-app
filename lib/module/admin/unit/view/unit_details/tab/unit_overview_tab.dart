import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/widgets/empty_state_view.dart';
import 'package:naseem/core/widgets/error_state_view.dart';
import 'package:naseem/module/admin/lease/controller/blocs/bloc/active_lease_bloc.dart';
import 'package:naseem/module/admin/unit/view/unit_details/widgets/current_resident_card.dart';
import 'package:naseem/module/admin/unit/view/unit_details/widgets/no_active_lease_card.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';
import 'package:naseem/routes/args/lease_details_args.dart';
import 'package:naseem/routes/router_path.dart';

import '../../../../../../core/core.dart';
import '../../../../community/model/community.dart';
import '../../../../lease/controller/blocs/bloc/lease_bloc.dart';
import '../../../../lease/view/list/widgets/lease_card.dart';
import '../../../model/unit.dart';

class UnitOverviewTab extends StatelessWidget {
  const UnitOverviewTab({
    super.key,
    required this.unit,
    required this.community,
  });

  final Unit unit;
  final Community community;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConsts.pSide),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Resident',
            style: context.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: AppConsts.pMedium),

          _ActiveLeaseBody(unit: unit),

          const SizedBox(height: AppConsts.pSide),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lease History',
                style: context.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),

              GestureDetector(
                onTap: () {
                  // Navigate to full lease history screen.
                  //
                  // Example:
                  //
                  // context.push(
                  //   LeaseHistoryScreen.route,
                  //   extra: {
                  //     'orgId': orgId,
                  //     'unitId': unitId,
                  //   },
                  // );
                },
                child: Text(
                  'View All',
                  style: context.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.primary,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppConsts.pMedium),

          _LeaseHistoryBody(unit: unit, community: community),
        ],
      ),
    );
  }
}

class _LeaseHistoryBody extends StatelessWidget {
  const _LeaseHistoryBody({required this.unit, required this.community});

  final Unit unit;
  final Community community;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaseBloc, LeaseState>(
      builder: (context, state) {
        if (state is LeasesLoading) {
          return const SizedBox(
            height: 400,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is LeasesFailed) {
          return ErrorStateView(
            isHalf: true,
            message: state.message,
            retryOnTap: () {
              context.read<LeaseBloc>().add(
                GetLeases(
                  orgId: authentication.profile?.orgId ?? "",
                  unitId: unit.id,
                  searchQuery: "",
                ),
              );
            },
          );
        }

        if (state is LeasesSuccess) {
          if (state.leases.isEmpty) {
            return EmptyStateView(
              message: "No lease history found",
              isHalf: true,
            );
          }

          return Column(
            children: state.leases
                .take(4)
                .map(
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
                )
                .toList(),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class _ActiveLeaseBody extends StatelessWidget {
  const _ActiveLeaseBody({required this.unit});

  final Unit unit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActiveLeaseBloc, ActiveLeaseState>(
      builder: (context, state) {
        if (state is ActiveLeaseLoading) {
          return const SizedBox(
            height: 240,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is ActiveLeaseSuccess) {
          if (state.lease == null) {
            return NoActiveLeaseCard(unit: unit);
          } else {
            return CurrentResidentCard(lease: state.lease!);
          }

          // final lease = Lease(
          //   id: 'dummy-lease-id',
          //   leaseNumber: 'LEASE-001',
          //   unitId: 'unit-001',
          //   residentId: 'resident-001',
          //   startDate: DateTime(2026, 1, 1),
          //   endDate: DateTime(2026, 12, 31),
          //   annualRent: 120000,
          //   securityDeposit: 20000,
          //   paymentFrequency: PaymentFrequency.monthly,
          //   numberOfCheques: 12,
          //   status: LeaseStatus.active,
          //   description: 'Dummy active lease',
          //   createdAt: DateTime(2026, 1, 1),
          //   updatedAt: DateTime(2026, 1, 1),
          //   resident: Profile(
          //     id: 'resident-001',
          //     name: 'Ram Kumar',
          //     email: 'ram@example.com',
          //     phone: '+91 98765 43210',
          //     role: UserRole.resident,
          //     createdAt: DateTime(2026, 1, 1),
          //     updatedAt: DateTime(2026, 1, 1),
          //   ),
          // );
        }

        if (state is ActiveLeaseFailed) {
          return ErrorStateView(
            isHalf: true,
            message: state.message,
            retryOnTap: () {
              // Need orgId/unitId here if this widget owns the retry.
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
