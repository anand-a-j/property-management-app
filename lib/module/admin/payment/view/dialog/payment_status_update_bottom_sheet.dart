import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naseem/core/utils/snackbar_manager.dart';

import '../../../../../core/core.dart';
import '../../../../../core/enum/payment_status.dart';

class PaymentStatusUpdateBottomSheet extends StatefulWidget {
  const PaymentStatusUpdateBottomSheet({
    super.key,
    required this.currentStatus,
    required this.statuses,
    required this.isLoading,
    this.onSubmit,
  });

  final PaymentStatus currentStatus;
  final List<PaymentStatus> statuses;
  final bool isLoading;

  final Future<void> Function({
    required PaymentStatus status,
    DateTime? paidDate,
    String? bounceReason,
  })?
  onSubmit;

  @override
  State<PaymentStatusUpdateBottomSheet> createState() =>
      _PaymentStatusUpdateBottomSheetState();
}

class _PaymentStatusUpdateBottomSheetState
    extends State<PaymentStatusUpdateBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _bounceReasonController = TextEditingController();

  late PaymentStatus? _selectedStatus;
  DateTime? _paidDate;
  bool _isSubmitting = false;

  bool get _isLoading => widget.isLoading || _isSubmitting;

  bool get _requiresPaidDate => _selectedStatus == PaymentStatus.paid;

  bool get _requiresBounceReason => _selectedStatus == PaymentStatus.bounced;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.statuses.isNotEmpty ? widget.statuses.first : null;

    if (_selectedStatus == PaymentStatus.paid) {
      _paidDate = DateTime.now();
    }
  }

  @override
  void dispose() {
    _bounceReasonController.dispose();
    super.dispose();
  }

  Future<void> _selectPaidDate() async {
    final now = DateTime.now();
    final initialDate = _paidDate ?? now;

    DateTime selectedDate = initialDate;

    await showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => Container(
        height: 280,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              SizedBox(
                height: 44,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      onPressed: () {
                        Navigator.of(context).pop();
                        if (mounted) {
                          setState(() => _paidDate = selectedDate);
                        }
                      },
                      child: const Text('Done'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: initialDate,
                  minimumDate: DateTime(2000),
                  maximumDate: DateTime(2100),
                  onDateTimeChanged: (date) {
                    selectedDate = date;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onStatusChanged(PaymentStatus? status) {
    setState(() {
      _selectedStatus = status;

      if (status == PaymentStatus.paid) {
        _paidDate ??= DateTime.now();
      }

      if (status != PaymentStatus.bounced) {
        _bounceReasonController.clear();
      }
    });
  }

  Future<void> _submit() async {
    if (_isLoading) return;
    if (!_formKey.currentState!.validate()) return;

    final status = _selectedStatus;
    if (status == null) return;

    if (_requiresPaidDate && _paidDate == null) {
      Snack.error('Please select the paid date');

      return;
    }

    setState(() => _isSubmitting = true);

    try {
      await widget.onSubmit?.call(
        status: status,
        paidDate: _requiresPaidDate ? _paidDate : null,
        bounceReason: _requiresBounceReason
            ? _bounceReasonController.text.trim()
            : null,
      );

      if (mounted) {
        Navigator.of(context).pop();
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
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
              const SizedBox(height: AppConsts.pMedium),

              // Header
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Update Payment Status',
                      style: context.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _isLoading
                        ? null
                        : () => Navigator.of(context).pop(),
                    child: CircleAvatar(
                      backgroundColor: context.surface.withValues(alpha: 0.5),
                      radius: 18,
                      child: Icon(
                        Icons.close,
                        size: 18,
                        color: context.secondary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppConsts.pMedium),

              // Current status
              Text(
                'Current status',
                style: context.bodyMedium?.copyWith(color: context.secondary),
              ),
              const SizedBox(height: 6),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppConsts.pMedium),
                decoration: BoxDecoration(
                  color: context.surface.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  widget.currentStatus.label,
                  style: context.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: AppConsts.pMedium),

              // New status
              CustomDropdownField<PaymentStatus>(
                items: widget.statuses,
                labelText: 'New status',
                hintText: 'Select payment status',
                initialValue: _selectedStatus,
                itemLabel: (status) => status.label,
                validator: (value) {
                  if (value == null) {
                    return 'Please select a status';
                  }
                  return null;
                },
                onChanged: _onStatusChanged,
              ),

              // Paid date
              if (_requiresPaidDate) ...[
                const SizedBox(height: AppConsts.pMedium),
                Text(
                  'Paid date',
                  style: context.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: _isLoading ? null : _selectPaidDate,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppConsts.pMedium),
                    decoration: BoxDecoration(
                      border: Border.all(color: context.surface),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: context.secondary,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            _paidDate == null
                                ? 'Select paid date'
                                : _formatDate(_paidDate!),
                          ),
                        ),
                        const Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ),
              ],

              // Bounce reason
              if (_requiresBounceReason) ...[
                const SizedBox(height: AppConsts.pMedium),
                CustomTextField(
                  controller: _bounceReasonController,
                  labelText: 'Bounce reason',
                  hintText: 'Enter the reason for the bounced payment',
                  maxLines: 3,
                  textInputType: TextInputType.multiline,
                  validator: (value) {
                    if (_requiresBounceReason &&
                        (value == null || value.trim().isEmpty)) {
                      return 'Please enter the bounce reason';
                    }
                    return null;
                  },
                ),
              ],

              const SizedBox(height: AppConsts.pMedium),

              // Submit
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  label: 'Update Payment',
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
}
