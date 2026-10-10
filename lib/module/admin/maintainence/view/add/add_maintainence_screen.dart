import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/utils/string_utils.dart';

import '../../../../../core/core.dart';
import '../../../../../core/enum/mainteance_status.dart';
import '../../../../../core/enum/maintenance_priority.dart';
import '../../../../../core/utils/input_vaildator.dart';
import '../../../../../core/utils/snackbar_manager.dart';
import '../../../../auth/core/controller/service/auth_service.dart';
import '../../../community/model/community.dart';
import '../../../unit/model/unit.dart';
import '../../controller/bloc/maintenance_bloc.dart';
import '../../model/add_maintenance.dart';
import '../../model/maintenance_request.dart';

class AddMaintenanceScreen extends StatefulWidget {
  const AddMaintenanceScreen({
    super.key,
    required this.unit,
    required this.community,
  });

  final Unit unit;
  final Community community;

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
          Snack.success('Maintenance request added successfully');

          Navigator.pop(context);
        }

        if (state is MaintenanceFailed) {
          Snack.error(state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Add Maintenance')),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Maintenance Request',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Enter the issue details to create a maintenance request.',
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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
            child: BlocBuilder<MaintenanceBloc, MaintenanceState>(
              builder: (context, state) {
                final isLoading = state is MaintenanceLoading;

                return SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : _submit,
                    child: isLoading
                        ? const SizedBox(
                            height: 22,
                            width: 22,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Create Request'),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _unitDetailsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Unit Details',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          _detailRow('Unit', widget.unit.name),
          const SizedBox(height: 8),
          _detailRow('Community', widget.community.name),
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

    final maintenance = AddMaintenance(
      orgId: profile.orgId!,
      unitId: widget.unit.id,
      createdBy: profile.id,
      residentId: profile.id,
      issueTitle: _issueTitleController.text.trim(),
      issueType: _selectedIssueType!,
      description: _descriptionController.text.trim(),
      priority: _selectedPriority,
      status: MaintenanceStatus.pendingReview,
    );

    context.read<MaintenanceBloc>().add(
      AddMaintenanceEvent(maintenance: maintenance),
    );
  }
}
