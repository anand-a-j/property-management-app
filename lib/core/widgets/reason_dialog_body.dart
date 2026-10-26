import 'package:flutter/material.dart';
import 'package:naseem/core/core.dart' show CustomTextField;

class ReasonDialogBody extends StatefulWidget {
  const ReasonDialogBody({
    super.key,
    required this.title,
    this.cancelTitle = 'Cancel',
    this.submitTitle = 'Reject',
    this.isWarning = true,
    this.isLoading = false,
  });

  final String title;
  final String cancelTitle;
  final String submitTitle;
  final bool isWarning;
  final bool isLoading;

  @override
  State<ReasonDialogBody> createState() => _ReasonDialogBodyState();
}

class _ReasonDialogBodyState extends State<ReasonDialogBody> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (widget.isLoading) return;

    if (_formKey.currentState!.validate()) {
      Navigator.pop(context, _controller.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      title: Text(widget.title),
      content: Form(
        key: _formKey,
        child: CustomTextField(
          controller: _controller,
    
          hintText: 'Enter reason',
          labelText: 'Reason',
          maxLines: 3,
          validator: (value) => value == null || value.trim().isEmpty
              ? 'Reason is required'
              : null,
        ),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: widget.isLoading ? null : () => Navigator.pop(context),
                child: Container(
                  height: 43,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: theme.colorScheme.secondary.withValues(
                        alpha: 0.35,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      widget.cancelTitle,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: widget.isLoading ? null : _onSubmit,
                child: Container(
                  height: 43,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: widget.isWarning
                        ? theme.colorScheme.error
                        : theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: widget.isLoading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: theme.colorScheme.onPrimary,
                            ),
                          )
                        : Text(
                            widget.submitTitle,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
