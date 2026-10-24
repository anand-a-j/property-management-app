import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/core.dart';
import 'package:naseem/core/widgets/empty_state_view.dart';
import 'package:naseem/core/widgets/error_state_view.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';

import '../../../controller/security/bloc/security_lease_movement_bloc.dart';
import '../widgets/security_lease_movement_card.dart';

class SecurityRequestsTab extends StatefulWidget {
  const SecurityRequestsTab({super.key});

  @override
  State<SecurityRequestsTab> createState() => _SecurityRequestsTabState();
}

class _SecurityRequestsTabState extends State<SecurityRequestsTab> {
  @override
  void initState() {
    super.initState();
    _fetchMovements();
  }

  void _fetchMovements() {
    context.read<SecurityLeaseMovementBloc>().add(
      FetchSecurityLeaseMovements(orgId: authentication.profile?.orgId ?? ""),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _fetchMovements();
      },
      child: BlocBuilder<SecurityLeaseMovementBloc, SecurityLeaseMovementState>(
        builder: (context, state) {
          if (state is SecurityLeaseMovementLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is SecurityLeaseMovementSuccess) {
            final movements = state.movements;

            if (movements.isEmpty) {
              return EmptyStateView(message: "No requests");
            }

            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: AppConsts.pSide),
              itemCount: movements.length,

              itemBuilder: (context, index) {
                return SecurityLeaseMovementCard(
                  leaseMovement: movements[index],
                );
              },
            );
          }

          if (state is SecurityLeaseMovementFailed) {
            return ErrorStateView(
              retryOnTap: _fetchMovements,
              message: state.message,
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
