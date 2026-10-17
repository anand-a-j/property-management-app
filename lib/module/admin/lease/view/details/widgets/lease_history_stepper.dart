import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:naseem/core/core.dart';
import 'package:naseem/core/utils/snackbar_manager.dart';
import 'package:naseem/module/admin/lease/model/lease.dart';

import '../../../../../../core/enum/lease_movement_status.dart';
import '../../../../../../core/enum/lease_status.dart';
import '../../../../../../core/extension/lease_movement_extension.dart';
import '../../../../../../core/extension/lease_stepper_status.dart';
import '../../../controller/blocs/bloc/lease_movement_bloc.dart';
import '../../../model/lease_movement.dart';
import 'lease_history_stepper_tile.dart';

class LeaseHistoryStepper extends StatefulWidget {
  const LeaseHistoryStepper({
    super.key,
    required this.lease,
    required this.currentUserId,
    required this.isFromResident,
  });

  final Lease lease;
  final String currentUserId;
  final bool isFromResident;

  @override
  State<LeaseHistoryStepper> createState() => _LeaseHistoryStepperState();
}

class _LeaseHistoryStepperState extends State<LeaseHistoryStepper> {
  List<LeaseMovement> _movements = const [];
  bool _loaded = false;

  LeaseMovementBloc get _bloc => context.read<LeaseMovementBloc>();

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  void _fetch() {
    _bloc.add(FetchMovementsEvent(leaseId: widget.lease.id));
  }

  // ---------------------------------------------------------------- actions

  // Residents can request move-in / move-out.
  void _request(String type) {
    _bloc.add(
      CreateMovementEvent(
        leaseId: widget.lease.id,
        movementType: type,
        requestedBy: widget.currentUserId,
      ),
    );
  }

  // Manager actions.
  void _managerApprove(LeaseMovement m) {
    if (widget.isFromResident) return;

    _bloc.add(
      ApproveMovementByManagerEvent(
        movementId: m.id,
        managerId: widget.currentUserId,
      ),
    );
  }

  Future<void> _managerReject(LeaseMovement m) async {
    if (widget.isFromResident) return;

    final reason = await _askReason('Reject request');

    if (reason == null || !mounted) return;

    _bloc.add(
      RejectMovementByManagerEvent(
        movementId: m.id,
        managerId: widget.currentUserId,
        reason: reason,
      ),
    );
  }

  // Manager acting on behalf of security.
  void _securityAccept(LeaseMovement m) {
    if (widget.isFromResident) return;

    _bloc.add(
      CompleteMovementBySecurityEvent(
        movementId: m.id,
        securityId: widget.currentUserId,
      ),
    );
  }

  Future<void> _securityReject(LeaseMovement m) async {
    if (widget.isFromResident) return;

    final reason = await _askReason('Reject check-in/out');

    if (reason == null || !mounted) return;

    _bloc.add(
      RejectMovementBySecurityEvent(
        movementId: m.id,
        securityId: widget.currentUserId,
        reason: reason,
      ),
    );
  }

  Future<String?> _askReason(String title) {
    return showDialog<String>(
      context: context,
      builder: (_) => _ReasonDialog(title: title),
    );
  }

  void _snack(String message, {bool error = false}) {
    if (error) {
      Snack.error(message);
    } else {
      Snack.success(message);
    }
  }

  // ------------------------------------------------------------------ build

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LeaseMovementBloc, LeaseMovementState>(
      listener: (context, state) {
        if (state is LeaseMovementSuccess<List<LeaseMovement>>) {
          setState(() {
            _movements = state.data;
            _loaded = true;
          });
        } else if (state is LeaseMovementSuccess) {
          // Create / approve / reject / complete.
          _snack(state.message ?? 'Done');
          _fetch();
        } else if (state is LeaseMovementFailed && _loaded) {
          _snack(state.message, error: true);
        }
      },
      builder: (context, state) {
        final busy = state is LeaseMovementLoading;

        if (!_loaded) {
          if (state is LeaseMovementFailed) {
            return _ErrorView(message: state.message, onRetry: _fetch);
          }

          return const Center(child: CircularProgressIndicator());
        }

        final nextRequest = _nextRequestType();

        return Padding(
          padding: const EdgeInsets.all(AppConsts.pSide),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 4,
                  child: busy ? const LinearProgressIndicator() : null,
                ),

                AbsorbPointer(
                  absorbing: busy,
                  child: Column(children: _buildTiles()),
                ),

                // RESIDENT ACCESS RULE:
                // Residents can request move-in / move-out.
                // This button is independent of approval actions.
                if (widget.isFromResident && nextRequest != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: CustomButton(
                      label: nextRequest == 'move_in'
                          ? 'Request Move-in'
                          : 'Request Move-out',
                      onPressed: busy ? () {} : () => _request(nextRequest),
                    ),
                  ),

                // Non-resident views retain the existing
                // request button behavior.
                if (!widget.isFromResident && nextRequest != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: CustomButton(
                      label: nextRequest == 'move_in'
                          ? 'Request Move-in'
                          : 'Request Move-out',
                      onPressed: busy ? () {} : () => _request(nextRequest),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool get _leaseEnded =>
      widget.lease.endDate.isBefore(DateTime.now()) ||
      widget.lease.status == LeaseStatus.expired ||
      widget.lease.status == LeaseStatus.terminated;

  List<Widget> _buildTiles() {
    final lease = widget.lease;

    final sorted = [..._movements]
      ..sort((a, b) => a.requestedAt.compareTo(b.requestedAt));

    final ended = _leaseEnded;

    return [
      LeaseHistoryStepperTile(
        title: 'Lease Created',
        date: _fmt(lease.createdAt),
        status: LeaseStepperStatus.completed,
      ),

      for (final movement in sorted) ..._movementTiles(movement),

      LeaseHistoryStepperTile(
        title: 'Lease Expired / Terminated',
        date: ended ? _fmt(lease.endDate) : '-',
        status: ended
            ? LeaseStepperStatus.completed
            : LeaseStepperStatus.pending,
        isLast: true,
      ),
    ];
  }

  // ------------------------------------------------------------ flow rules

  String _fmt(DateTime? date) {
    return date == null
        ? '-'
        : DateFormat('d MMM yyyy, h:mm a').format(date.toLocal());
  }

  LeaseMovement? _latest(bool moveIn) {
    final list =
        _movements.where((movement) => movement.isMoveIn == moveIn).toList()
          ..sort((a, b) => b.requestedAt.compareTo(a.requestedAt));

    return list.isEmpty ? null : list.first;
  }

  /// Determines which request can be created next.
  /// Returns null when no new request is currently allowed.
  String? _nextRequestType() {
    final moveIn = _latest(true);
    final moveOut = _latest(false);

    if (moveIn == null || moveIn.isFailed) {
      return 'move_in';
    }

    if (moveIn.status == LeaseMovementStatus.completed &&
        (moveOut == null || moveOut.isFailed)) {
      return 'move_out';
    }

    return null;
  }

  List<Widget> _movementTiles(LeaseMovement m) {
    final label = m.isMoveIn ? 'Move-in' : 'Move-out';
    final check = m.isMoveIn ? 'Check-in' : 'Check-out';

    final s = m.status;

    final managerRejected = s == LeaseMovementStatus.managerRejected;

    final securityRejected = s == LeaseMovementStatus.securityRejected;

    final cancelled = s == LeaseMovementStatus.cancelled;

    final pendingManager = s == LeaseMovementStatus.pendingManager;

    final pendingSecurity = s == LeaseMovementStatus.pendingSecurity;

    final done = s == LeaseMovementStatus.completed;

    // RESIDENT ACCESS RULE:
    // A resident may view the workflow but cannot perform
    // manager or security approval actions.
    final canReviewAsManager = !widget.isFromResident && pendingManager;

    final canReviewAsSecurity = !widget.isFromResident && pendingSecurity;

    final tiles = <Widget>[
      // 1. Request submitted.
      LeaseHistoryStepperTile(
        title: '$label Request Submitted',
        date: _fmt(m.requestedAt),
        status: LeaseStepperStatus.completed,
      ),
    ];

    // Cancelled before or during review.
    if (cancelled) {
      tiles.add(
        LeaseHistoryStepperTile(
          title: '$label Cancelled',
          date: _fmt(m.updatedAt),
          status: LeaseStepperStatus.rejected,
        ),
      );

      return tiles;
    }

    // 2. Manager review.
    // Residents can see the manager's decision, but cannot
    // approve or reject the request.
    tiles.add(
      LeaseHistoryStepperTile(
        title: managerRejected
            ? '$label Rejected'
            : pendingManager
            ? '$label Pending Approval'
            : '$label Approved',
        subtitle: managerRejected ? m.managerRejectionReason : null,
        date: _fmt(m.managerReviewedAt),
        badgeText: 'Manager',
        status: managerRejected
            ? LeaseStepperStatus.rejected
            : pendingManager
            ? LeaseStepperStatus.active
            : LeaseStepperStatus.completed,

        // Only non-resident views receive these actions.
        showActions: canReviewAsManager,
        onAccept: canReviewAsManager ? () => _managerApprove(m) : null,
        onReject: canReviewAsManager ? () => _managerReject(m) : null,
      ),
    );

    if (managerRejected) return tiles;

    // 3. Security check.
    // Residents can see security status and rejection reasons,
    // but cannot accept or reject check-in / check-out.
    tiles.add(
      LeaseHistoryStepperTile(
        title: securityRejected
            ? 'Security $check Rejected'
            : done
            ? 'Security $check Accepted'
            : 'Security $check',
        subtitle: securityRejected ? m.securityRejectionReason : null,
        date: _fmt(m.securityReviewedAt),
        badgeText: 'Security',
        status: securityRejected
            ? LeaseStepperStatus.rejected
            : done
            ? LeaseStepperStatus.completed
            : pendingSecurity
            ? LeaseStepperStatus.active
            : LeaseStepperStatus.pending,

        // Only non-resident views receive these actions.
        showActions: canReviewAsSecurity,
        onAccept: canReviewAsSecurity ? () => _securityAccept(m) : null,
        onReject: canReviewAsSecurity ? () => _securityReject(m) : null,
      ),
    );

    if (securityRejected) return tiles;

    // 4. Completed.
    tiles.add(
      LeaseHistoryStepperTile(
        title: '$label Completed',
        date: _fmt(m.completedAt),
        status: done
            ? LeaseStepperStatus.completed
            : LeaseStepperStatus.pending,
      ),
    );

    return tiles;
  }
}

// -------------------------------------------------------------- helpers

class _ReasonDialog extends StatefulWidget {
  const _ReasonDialog({required this.title});

  final String title;

  @override
  State<_ReasonDialog> createState() => _ReasonDialogState();
}

class _ReasonDialogState extends State<_ReasonDialog> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          autofocus: true,
          maxLines: 3,
          decoration: const InputDecoration(labelText: 'Reason'),
          validator: (value) => (value == null || value.trim().isEmpty)
              ? 'Reason is required'
              : null,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.pop(context, _controller.text.trim());
            }
          },
          child: const Text('Reject'),
        ),
      ],
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 12),
          OutlinedButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}
