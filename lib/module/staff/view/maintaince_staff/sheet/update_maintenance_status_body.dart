

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/core.dart';
import '../../../../../core/enum/mainteance_status.dart';
import '../../../../../routes/router_path.dart';
import '../../../../admin/maintainence/model/maintenance_request.dart';
import '../../../../auth/core/model/profile.dart';

class UpdateMaintenanceStatusBody extends StatefulWidget {
  const UpdateMaintenanceStatusBody({
    super.key,
    required this.request,
    required this.isManager,
    required this.isLoading,
    required this.onSubmit,
  });

  final MaintenanceRequest request;
  final bool isManager;
  final bool isLoading;

  final Future<void> Function({
    required MaintenanceStatus status,
    required String? assignedTo,
    required String? note,
    required String? rejectionReason,
  })
  onSubmit;

  @override
  State<UpdateMaintenanceStatusBody> createState() =>
      _UpdateMaintenanceStatusBodyState();
}

class _UpdateMaintenanceStatusBodyState
    extends State<UpdateMaintenanceStatusBody> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _staffController;
  late final TextEditingController _remarkController;

  MaintenanceStatus? _selectedStatus;
  Profile? _selectedStaff;

  bool _isSubmitting = false;

  bool get _isLoading => widget.isLoading || _isSubmitting;

  bool get _requiresStaffAssignment =>
      widget.isManager && _selectedStatus == MaintenanceStatus.approved;

  @override
  void initState() {
    super.initState();

    _staffController = TextEditingController();
    _remarkController = TextEditingController();
  }

  @override
  void dispose() {
    _staffController.dispose();
    _remarkController.dispose();
    super.dispose();
  }

  Widget _staffField() {
    return CustomTextField(
      controller: _staffController,
      textInputType: TextInputType.text,
      labelText: 'Assign Staff',
      hintText: 'Select the staff member',
      suffixIcon: const Icon(Icons.arrow_forward_ios),
      readOnly: true,
      validator: (value) {
        if (_requiresStaffAssignment && _selectedStaff == null) {
          return 'Please select a staff member';
        }

        return null;
      },
      onTap: () async {
        if (_isLoading) return;

        final staff = await context.push<Profile>(
          RouterPath.staffList,
          extra: true,
        );

        if (staff != null && mounted) {
          setState(() {
            _selectedStaff = staff;
            _staffController.text = staff.name;
          });
        }
      },
    );
  }

  Future<void> _submit() async {
    if (_isLoading) return;

    if (!_formKey.currentState!.validate()) return;

    final status = _selectedStatus;
    if (status == null) return;

    if (_requiresStaffAssignment && _selectedStaff == null) {
      return;
    }

    final remark = _remarkController.text.trim();

    setState(() => _isSubmitting = true);

    try {
      await widget.onSubmit(
        status: status,
        assignedTo: _requiresStaffAssignment ? _selectedStaff!.id : null,
        note: status == MaintenanceStatus.rejected
            ? null
            : remark.isEmpty
            ? null
            : remark,
        rejectionReason: status == MaintenanceStatus.rejected
            ? remark.isEmpty
                  ? null
                  : remark
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

  @override
  Widget build(BuildContext context) {
    final nextStatuses = widget.request.status.nextStatuses(
      isManager: widget.isManager,
    );

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

              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Update Maintenance Status',
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
                      backgroundColor: context.secondaryContainer,
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

              CustomDropdownField<MaintenanceStatus>(
                items: nextStatuses,
                labelText: 'Status',
                hintText: 'Select status',
                initialValue: _selectedStatus,
                itemLabel: (status) => status.label,
                validator: (value) {
                  if (value == null) {
                    return 'Please select a status';
                  }

                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _selectedStatus = value;

                    // Clear the previous selection when the
                    // selected status no longer requires staff.
                    if (!_requiresStaffAssignment &&
                        value != MaintenanceStatus.approved) {
                      _selectedStaff = null;
                      _staffController.clear();
                    }
                  });
                },
              ),

              if (_requiresStaffAssignment) ...[
                const SizedBox(height: AppConsts.pMedium),
                _staffField(),
              ],

              const SizedBox(height: AppConsts.pMedium),

              CustomTextField(
                controller: _remarkController,
                labelText: _selectedStatus == MaintenanceStatus.rejected
                    ? 'Rejection Reason'
                    : 'Remarks',
                hintText: _selectedStatus == MaintenanceStatus.rejected
                    ? 'Enter reason for rejection'
                    : 'Enter remarks or describe the work performed',
                maxLines: 3,
                textInputType: TextInputType.multiline,
              ),

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
}
