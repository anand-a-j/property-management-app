import 'package:flutter/material.dart';

import '../core.dart';

class StatusUpdateBottomSheet<T extends Object> extends StatefulWidget {
  const StatusUpdateBottomSheet({
    super.key,
    required this.title,
    required this.statuses,
    required this.itemLabel,
    required this.isLoading,
    this.initialStatus,
    this.showRemark = false,
    this.initialRemark,
    this.remarkLabel = 'Remark',
    this.remarkHint = 'Enter remark (optional)',
    this.submitLabel = 'Update Status',
    this.onSubmit,
  });

  final String title;

  /// Supports String, Enum, custom models, or any other type.
  final List<T> statuses;

  /// Converts each status into a readable dropdown label.
  final String Function(T item) itemLabel;

  final T? initialStatus;
  final bool isLoading;

  /// Whether the remark field should be displayed.
  final bool showRemark;

  final String? initialRemark;
  final String remarkLabel;
  final String remarkHint;
  final String submitLabel;

  /// Returns the selected status and optional remark.
  final Future<void> Function(T status, String? remark)? onSubmit;

  @override
  State<StatusUpdateBottomSheet<T>> createState() =>
      _StatusUpdateBottomSheetState<T>();
}

class _StatusUpdateBottomSheetState<T extends Object>
    extends State<StatusUpdateBottomSheet<T>> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _remarkController;

  T? _selectedStatus;
  bool _isSubmitting = false;

  bool get _isLoading => widget.isLoading || _isSubmitting;

  @override
  void initState() {
    super.initState();

    _selectedStatus = widget.statuses.contains(widget.initialStatus)
        ? widget.initialStatus
        : null;

    _remarkController = TextEditingController(text: widget.initialRemark ?? '');
  }

  @override
  void dispose() {
    _remarkController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_isLoading) return;

    if (!_formKey.currentState!.validate()) return;

    final status = _selectedStatus;
    if (status == null) return;

    final remark = widget.showRemark ? _remarkController.text.trim() : '';

    setState(() => _isSubmitting = true);

    try {
      await widget.onSubmit?.call(status, remark.isEmpty ? null : remark);

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
              const SizedBox(height: AppConsts.pLarge),

              // Title
              Text(
                widget.title,
                style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: AppConsts.pLarge),

              // Generic dropdown
              CustomDropdownField<T>(
                items: widget.statuses,
                labelText: 'Status',
                hintText: 'Select status',
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

              // Optional remark field
              if (widget.showRemark) ...[
                const SizedBox(height: AppConsts.pMedium),

                CustomTextField(
                  controller: _remarkController,
                  labelText: widget.remarkLabel,
                  hintText: widget.remarkHint,
                  maxLines: 3,
                  textInputType: TextInputType.multiline,
                ),
              ],

              const SizedBox(height: AppConsts.pLarge),

              // Submit button
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  label: widget.submitLabel,
                  isLoading: _isLoading,
                  onPressed: _submit,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppConsts.pMedium,
                  ),
                ),
              ),

              const SizedBox(height: AppConsts.pSmall),
            ],
          ),
        ),
      ),
    );
  }
}
