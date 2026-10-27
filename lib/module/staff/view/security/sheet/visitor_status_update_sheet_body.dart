import 'package:flutter/material.dart';
import 'package:naseem/module/admin/visitor/model/visitor.dart' show Visitor;

import '../../../../../core/core.dart';
import '../../../../../core/enum/visitor_status.dart';

class VisitorStatusUpdateSheetBody extends StatefulWidget {
  const VisitorStatusUpdateSheetBody({
    super.key,
    required this.visitor,
    required this.statuses,
    required this.itemLabel,
    required this.isLoading,
    required this.onSubmit,
  });

  final Visitor visitor;
  final List<VisitorStatus> statuses;
  final String Function(VisitorStatus status) itemLabel;
  final bool isLoading;
  final Future<void> Function(VisitorStatus status) onSubmit;

  @override
  State<VisitorStatusUpdateSheetBody> createState() =>
      _VisitorStatusUpdateSheetBodyState();
}

class _VisitorStatusUpdateSheetBodyState
    extends State<VisitorStatusUpdateSheetBody> {
  final _formKey = GlobalKey<FormState>();

  VisitorStatus? _selectedStatus;
  bool _isSubmitting = false;

  bool get _isLoading => widget.isLoading || _isSubmitting;

  bool get _isResidentCreated => widget.visitor.residentId != null;

  bool get _isCheckedIn => widget.visitor.checkedInAt != null;

  bool get _isCheckedOut => widget.visitor.checkedOutAt != null;

  @override
  void initState() {
    super.initState();
    _selectedStatus = null;
  }

  Future<void> _submit() async {
    if (_isLoading) return;
    if (!_formKey.currentState!.validate()) return;

    final status = _selectedStatus;
    if (status == null) return;

    setState(() => _isSubmitting = true);

    try {
      await widget.onSubmit(status);

      if (mounted) {
        Navigator.of(context).pop();
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.only(
          left: AppConsts.pSide,
          right: AppConsts.pSide,
          top: AppConsts.pMedium,
          bottom: MediaQuery.of(context).viewInsets.bottom + AppConsts.pMedium,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Update Visitor Status',
                      style: context.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _isLoading
                        ? null
                        : () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),

              const SizedBox(height: AppConsts.pMedium),

              // Visitor information
              Text(
                widget.visitor.name,
                style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
              ),

              if (widget.visitor.visitorCode != null)
                Text('Visitor code: ${widget.visitor.visitorCode}'),

              if (widget.visitor.phone != null)
                Text('Phone: ${widget.visitor.phone}'),

              const SizedBox(height: AppConsts.pMedium),

              // Existing visit timestamps
              _TimestampInfo(
                label: 'Checked in',
                value: widget.visitor.checkedInAt,
              ),

              const SizedBox(height: 8),

              _TimestampInfo(
                label: 'Checked out',
                value: widget.visitor.checkedOutAt,
              ),

              if (_isResidentCreated) ...[
                const SizedBox(height: 8),
                Text(
                  'Resident-linked visitor: timestamps will be '
                  'recorded when the status changes.',
                  style: context.bodySmall,
                ),
              ],

              const SizedBox(height: AppConsts.pMedium),

              CustomDropdownField<VisitorStatus>(
                items: widget.statuses,
                labelText: 'Status',
                hintText: 'Select visitor status',
                initialValue: _selectedStatus,
                itemLabel: widget.itemLabel,
                validator: (value) {
                  if (value == null) {
                    return 'Please select a status';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() => _selectedStatus = value);
                },
              ),

              if (_selectedStatus != null) ...[
                const SizedBox(height: 8),
                _buildTransitionHint(context),
              ],

              const SizedBox(height: AppConsts.pMedium),

              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  label: 'Update Status',
                  isLoading: _isLoading,
                  onPressed: _submit,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppConsts.pMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransitionHint(BuildContext context) {
    final value = _selectedStatus!.dbValue;

    String? message;

    if (value == 'checked_in') {
      message = _isCheckedIn
          ? 'The visitor already has a check-in time.'
          : 'Check-in time will be recorded when this update is saved.';
    } else if (value == 'checked_out') {
      message = _isCheckedOut
          ? 'The visitor already has a check-out time.'
          : 'Check-out time will be recorded when this update is saved.';
    }

    if (message == null) return const SizedBox.shrink();

    return Text(message, style: context.bodySmall);
  }
}

class _TimestampInfo extends StatelessWidget {
  const _TimestampInfo({required this.label, required this.value});

  final String label;
  final DateTime? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(label)),
        Text(
          value == null
              ? 'Not recorded'
              : value!.toLocal().toString().substring(0, 16),
          style: context.bodySmall,
        ),
      ],
    );
  }
}
