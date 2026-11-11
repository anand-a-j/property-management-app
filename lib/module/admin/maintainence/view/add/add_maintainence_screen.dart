import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/utils/string_utils.dart';

import '../../../../../core/core.dart';
import '../../../../../core/enum/mainteance_status.dart';
import '../../../../../core/enum/maintenance_priority.dart';
import '../../../../../core/utils/input_vaildator.dart';
import '../../../../../core/utils/snackbar_manager.dart';
import '../../../../auth/core/controller/service/auth_service.dart';
import '../../../community/model/community.dart';
import '../../../unit/model/unit.dart';
import '../../controller/bloc/bloc/maintenance_list_bloc.dart';
import '../../controller/bloc/maintenance_bloc.dart';
import '../../model/add_maintenance.dart';

class AddMaintenanceScreen extends StatefulWidget {
  const AddMaintenanceScreen({
    super.key,
    required this.unit,
    required this.community,
    required this.isEdit,
    this.maintenance,
  });

  final Unit? unit;
  final Community? community;
  final bool isEdit;
  final AddMaintenance? maintenance;

  @override
  State<AddMaintenanceScreen> createState() => _AddMaintenanceScreenState();
}

class _AddMaintenanceScreenState extends State<AddMaintenanceScreen> {
  final _formKey = GlobalKey<FormState>();

  final _issueTitleController = TextEditingController();
  final _descriptionController = TextEditingController();

  final List<String> _issueTypes = const [
    'Plumbing',
    'Electrical',
    'Air Conditioning',
    'Civil',
    'Cleaning',
    'Other',
  ];

  String? _selectedIssueType;
  MaintenancePriority _selectedPriority = MaintenancePriority.medium;

  @override
  void initState() {
    super.initState();

    _initializeForm();
  }

  void _initializeForm() {
    if (!widget.isEdit || widget.maintenance == null) return;

    final maintenance = widget.maintenance!;

    _issueTitleController.text = maintenance.issueTitle ?? '';
    _descriptionController.text = maintenance.description ?? '';

    _selectedIssueType = maintenance.issueType;

    _selectedPriority = maintenance.priority ?? MaintenancePriority.medium;
  }

  @override
  void dispose() {
    _issueTitleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MaintenanceBloc, MaintenanceState>(
      listener: (context, state) {
        if (state is MaintenanceAddSuccess) {
          Snack.success(
            widget.isEdit
                ? 'Maintenance request updated successfully'
                : 'Maintenance request added successfully',
          );

          context.read<MaintenanceListBloc>().add(
            GetMaintenanceListEvent(
              orgId: authentication.profile?.orgId ?? '',
              unitId: widget.unit?.id,
            ),
          );

          Navigator.pop(context);
        }

        if (state is MaintenanceFailed) {
          Snack.error(state.message);
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: widget.isEdit ? 'Edit Maintenance' : 'Add Maintenance',
          leadingOnTap: () => context.pop(),
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.isEdit
                        ? 'Update Maintenance Request'
                        : 'New Maintenance Request',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    widget.isEdit
                        ? 'Update the issue details below.'
                        : 'Enter the issue details to create a maintenance request.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  const SizedBox(height: 24),

                  _unitDetailsCard(),

                  const SizedBox(height: 24),

                  _issueTitleField(),

                  const SizedBox(height: 20),

                  _issueTypeField(),

                  const SizedBox(height: 20),

                  _priorityField(),

                  const SizedBox(height: 20),

                  _descriptionField(),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),

        bottomNavigationBar: SafeArea(
          child: BlocBuilder<MaintenanceBloc, MaintenanceState>(
            builder: (context, state) {
              final isLoading = state is MaintenanceLoading;

              return CustomButton(
                label: widget.isEdit ? 'Update' : 'Create',
                padding: const EdgeInsetsGeometry.symmetric(
                  horizontal: AppConsts.pSide,
                  vertical: AppConsts.pSide,
                ),
                isLoading: isLoading,
                onPressed: _submit,
              );
            },
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------
  // UNIT DETAILS
  // --------------------------------------------------

  Widget _unitDetailsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: context.surface),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Unit Details',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 12),

          _detailRow(
            'Unit',
            widget.unit?.name ?? widget.maintenance?.unitName ?? '',
          ),

          const SizedBox(height: 8),

          _detailRow(
            'Community',
            widget.community?.name ?? widget.maintenance?.communityName ?? '',
          ),
        ],
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).hintColor,
            ),
          ),
        ),

        Expanded(
          child: Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  // --------------------------------------------------
  // ISSUE TITLE
  // --------------------------------------------------

  Widget _issueTitleField() {
    return CustomTextField(
      controller: _issueTitleController,
      labelText: 'Issue Title',
      hintText: 'e.g. Leaking bathroom tap',
      validator: (value) {
        final requiredError = InputVaildator.required(value);

        if (requiredError != null) {
          return requiredError;
        }

        if (value!.trim().length < 3) {
          return 'Issue title must be at least 3 characters';
        }

        return null;
      },
    );
  }

  // --------------------------------------------------
  // ISSUE TYPE
  // --------------------------------------------------

  Widget _issueTypeField() {
    return CustomDropdownField<String>(
      initialValue: _selectedIssueType,
      labelText: 'Issue Type',
      hintText: 'Select issue type',
      items: _issueTypes,
      itemLabel: (item) => item,
      onChanged: (value) {
        setState(() {
          _selectedIssueType = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select an issue type';
        }

        return null;
      },
    );
  }

  // --------------------------------------------------
  // PRIORITY
  // --------------------------------------------------

  Widget _priorityField() {
    return CustomDropdownField<MaintenancePriority>(
      initialValue: _selectedPriority,
      labelText: 'Priority',
      hintText: 'Select priority',
      items: MaintenancePriority.values,
      itemLabel: (item) => item.label,
      onChanged: (value) {
        if (value != null) {
          setState(() {
            _selectedPriority = value;
          });
        }
      },
      validator: (value) {
        if (value == null) {
          return 'Please select a priority';
        }

        return null;
      },
    );
  }

  // --------------------------------------------------
  // DESCRIPTION
  // --------------------------------------------------

  Widget _descriptionField() {
    return CustomTextField(
      controller: _descriptionController,
      labelText: 'Description',
      hintText: 'Describe the issue and where it occurred...',
      maxLines: 6,
      validator: (value) {
        final requiredError = InputVaildator.required(value);

        if (requiredError != null) {
          return requiredError;
        }

        if (value!.trim().length < 10) {
          return 'Description must be at least 10 characters';
        }

        return null;
      },
    );
  }

  // --------------------------------------------------
  // SUBMIT
  // --------------------------------------------------

  void _submit() {
    FocusScope.of(context).unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final profile = authentication.profile;

    if (profile == null ||
        profile.id.isEmpty ||
        profile.orgId == null ||
        profile.orgId!.isEmpty) {
      Snack.error('Unable to identify the current user or organization');
      return;
    }

    // --------------------------------------------------
    // EDIT MAINTENANCE
    // --------------------------------------------------

    if (widget.isEdit) {
      final existingMaintenance = widget.maintenance;

      if (existingMaintenance == null ||
          existingMaintenance.id == null ||
          existingMaintenance.id!.isEmpty) {
        Snack.error('Unable to identify maintenance request');
        return;
      }

      final maintenance = AddMaintenance(
        orgId: existingMaintenance.orgId,
        unitId: existingMaintenance.unitId,
        unitName: existingMaintenance.unitName,
        communityId: existingMaintenance.communityId,
        communityName: existingMaintenance.communityName,
        createdBy: existingMaintenance.createdBy,
        residentId: existingMaintenance.residentId,
        issueTitle: _issueTitleController.text.trim(),
        issueType: _selectedIssueType!,
        description: _descriptionController.text.trim(),
        priority: _selectedPriority,
        status: existingMaintenance.status,
        ticketNumber: existingMaintenance.ticketNumber,
      );

      context.read<MaintenanceBloc>().add(
        UpdateMaintenanceEvent(
          maintenanceId: existingMaintenance.id!,
          maintenance: maintenance,
        ),
      );

      return;
    }

    // --------------------------------------------------
    // ADD MAINTENANCE
    // --------------------------------------------------

    final maintenance = AddMaintenance(
      orgId: profile.orgId!,
      unitId: widget.unit?.id ?? '',
      unitName: widget.unit?.name,
      communityId: widget.community?.id,
      communityName: widget.community?.name,
      createdBy: profile.id,
      residentId: profile.id,
      issueTitle: _issueTitleController.text.trim(),
      issueType: _selectedIssueType!,
      description: _descriptionController.text.trim(),
      priority: _selectedPriority,
      status: MaintenanceStatus.pendingReview,
      ticketNumber: StrHelper.generateMaintenanceTicketNumber(),
    );

    context.read<MaintenanceBloc>().add(
      AddMaintenanceEvent(maintenance: maintenance),
    );
  }
}
