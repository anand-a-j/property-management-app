import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/core.dart';
import 'package:naseem/core/utils/snackbar_manager.dart';
import 'package:naseem/core/widgets/empty_state_view.dart';
import 'package:naseem/core/widgets/error_state_view.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';

import '../../../../../core/widgets/reason_dialog_body.dart';
import '../../../../admin/lease/controller/blocs/bloc/lease_movement_bloc.dart';
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
    return BlocListener<LeaseMovementBloc, LeaseMovementState>(
      listener: (context, state) {
        if (state is LeaseMovementSuccess) {
          Snack.success("Updated successfully");
          _fetchMovements();
        } else if (state is LeaseMovementFailed) {
          Snack.error(state.message);
        }
      },
      child: RefreshIndicator(
        onRefresh: () async {
          _fetchMovements();
        },
        child:
            BlocBuilder<SecurityLeaseMovementBloc, SecurityLeaseMovementState>(
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
                      return GestureDetector(
                        onTap: () => _showSecurityMovementActions(
                          movements[index].movementId,
                        ),
                        child: SecurityLeaseMovementCard(
                          leaseMovement: movements[index],
                        ),
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
      ),
    );
  }

  void _showSecurityMovementActions(String leaseMovementId) {
    CustomDialog.confirmationDialog(
      context: context,
      title: 'Lease Movement',
      subTitle: 'Choose an action for this check-in/out request.',
      cancelTitle: 'Reject',
      sumbitTitle: 'Accept',
      isWarning: false,
      cancelOnTap: () {
        Navigator.pop(context);
        _securityReject(leaseMovementId);
      },
      sumbitOnTap: () {
        Navigator.pop(context);
        _securityAccept(leaseMovementId);
      },
    );
  }

  // Manager acting on behalf of security.
  void _securityAccept(String leaseMovementId) {
    context.read<LeaseMovementBloc>().add(
      CompleteMovementBySecurityEvent(
        movementId: leaseMovementId,
        securityId: authentication.profile?.id ?? "",
      ),
    );
  }

  Future<void> _securityReject(String leaseMovementId) async {
    final reason = await _askReason('Reject check-in/out');

    if (reason == null || !mounted) return;

    context.read<LeaseMovementBloc>().add(
      RejectMovementBySecurityEvent(
        movementId: leaseMovementId,
        securityId: authentication.profile?.id ?? "",
        reason: reason,
      ),
    );
  }

  Future<String?> _askReason(String title) {
    return showDialog<String>(
      context: context,
      builder: (_) => ReasonDialogBody(
        title: title,
        cancelTitle: 'Cancel',
        submitTitle: 'Reject',
        isWarning: true,
      ),
    );
  }
}
