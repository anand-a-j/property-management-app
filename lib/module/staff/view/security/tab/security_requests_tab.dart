import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/core.dart';
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
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 120),
                  Center(child: Text('No lease movements found')),
                ],
              );
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
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                const SizedBox(height: 100),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        const Icon(Icons.error_outline, size: 40),
                        const SizedBox(height: 12),
                        Text(state.message, textAlign: TextAlign.center),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _fetchMovements,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
