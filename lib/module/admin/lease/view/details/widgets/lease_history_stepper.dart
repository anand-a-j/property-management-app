import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:naseem/core/core.dart';
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
    required this.currentUserId, // the logged-in manager
  });

  final Lease lease;
  final String currentUserId;

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

  void _fetch() => _bloc.add(FetchMovementsEvent(leaseId: widget.lease.id));

  // ---------------------------------------------------------------- actions

  void _request(String type) => _bloc.add(
    CreateMovementEvent(
      leaseId: widget.lease.id,
      movementType: type,
      requestedBy: widget.currentUserId,
    ),
  );

  void _managerApprove(LeaseMovement m) => _bloc.add(
    ApproveMovementByManagerEvent(
      movementId: m.id,
      managerId: widget.currentUserId,
    ),
  );

  Future<void> _managerReject(LeaseMovement m) async {
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

  // Manager acting on behalf of security
  void _securityAccept(LeaseMovement m) => _bloc.add(
    CompleteMovementBySecurityEvent(
      movementId: m.id,
      securityId: widget.currentUserId,
    ),
  );

  Future<void> _securityReject(LeaseMovement m) async {
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

  Future<String?> _askReason(String title) => showDialog<String>(
    context: context,
    builder: (_) => _ReasonDialog(title: title),
  );

  void _snack(String message, {bool error = false}) {
    final cs = Theme.of(context).colorScheme;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: error ? cs.error : null,
        ),
      );
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
          // create / approve / reject / complete -> toast, then refresh timeline
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
                  absorbing: busy, // blocks double taps while a call is running
                  child: Column(children: _buildTiles()),
                ),
                if (nextRequest != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: CustomButton(
                      label: nextRequest == 'move_in'
                          ? 'Request Move-in'
                          : 'Request Move-out',

                      onPressed: busy ? () {} : () => _request(nextRequest),
                    ),

                    //  FilledButton(
                    //   onPressed: busy ? null : () => _request(nextRequest),
                    //   child: Text(
                    //     nextRequest == 'move_in'
                    //         ? 'Request Move-in'
                    //         : 'Request Move-out',
                    //   ),
                    // ),
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
      for (final m in sorted) ..._movementTiles(m),
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

  String _fmt(DateTime? d) =>
      d == null ? '-' : DateFormat('d MMM yyyy, h:mm a').format(d.toLocal());

  LeaseMovement? _latest(bool moveIn) {
    final list = _movements.where((m) => m.isMoveIn == moveIn).toList()
      ..sort((a, b) => b.requestedAt.compareTo(a.requestedAt));
    return list.isEmpty ? null : list.first;
  }

  /// Which request can be created next (null = none).
  String? _nextRequestType() {
    final moveIn = _latest(true);
    final moveOut = _latest(false);

    if (moveIn == null || moveIn.isFailed) return 'move_in';
    if (moveIn.status == LeaseMovementStatus.completed &&
        (moveOut == null || moveOut.isFailed)) {
      return 'move_out';
    }
    return null; // something is still in progress
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

    final tiles = <Widget>[
      // 1. Request submitted (requestedBy is only an id, so no name subtitle)
      LeaseHistoryStepperTile(
        title: '$label Request Submitted',
        date: _fmt(m.requestedAt),
        status: LeaseStepperStatus.completed,
      ),
    ];

    // Cancelled before or during review
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

    // 2. Manager review
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
        showActions: pendingManager,
        onAccept: pendingManager ? () => _managerApprove(m) : null,
        onReject: pendingManager ? () => _managerReject(m) : null,
      ),
    );
    if (managerRejected) return tiles;

    // 3. Security check (manager acts on behalf of security)
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
        showActions: pendingSecurity,
        onAccept: pendingSecurity ? () => _securityAccept(m) : null,
        onReject: pendingSecurity ? () => _securityReject(m) : null,
      ),
    );
    if (securityRejected) return tiles;

    // 4. Completed
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
          validator: (v) =>
              (v == null || v.trim().isEmpty) ? 'Reason is required' : null,
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
  Widget build(BuildContext context) => Center(
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
