import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide DateUtils;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/enum/visitor_type.dart';
import 'package:naseem/module/admin/visitor/model/create_visitor.dart';

import '../../../../../core/core.dart';
import '../../../../../core/utils/input_vaildator.dart';
import '../../../../../core/utils/snackbar_manager.dart';
import '../../../../auth/core/controller/service/auth_service.dart';
import '../../controller/bloc/visitor_bloc.dart';

class AddVisitorScreen extends StatefulWidget {
  const AddVisitorScreen({super.key});

  @override
  State<AddVisitorScreen> createState() => _AddVisitorScreenState();
}

class _AddVisitorScreenState extends State<AddVisitorScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _visitDateController = TextEditingController();
  final TextEditingController _purposeController = TextEditingController();

  DateTime? _visitDate;

  VisitType? _visitType;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _visitDateController.dispose();
    _purposeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VisitorBloc, VisitorState>(
      listener: (context, state) {
        if (state is VisitorCreateSuccess) {
          Snack.success('Visitor added successfully');

         

          context.pop<bool>(true);
        }

        if (state is VisitorFailed) {
          Snack.error(state.message);
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Back',
          leadingOnTap: () => Navigator.pop(context),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppConsts.pMedium),

                    Text(
                      'Add Visitor',
                      style: context.titleLarge?.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: AppConsts.pSmall),

                    Text(
                      'Enter the visitor details below',
                      style: context.bodyMedium?.copyWith(
                        color: context.secondaryContainer,
                      ),
                    ),

                    const SizedBox(height: AppConsts.pLarge),

                    _nameField(),

                    const SizedBox(height: AppConsts.pSide),

                    _phoneField(),

                    const SizedBox(height: AppConsts.pSide),

                    _visitTypeField(),

                    const SizedBox(height: AppConsts.pSide),

                    _visitDateField(),

                    const SizedBox(height: AppConsts.pSide),

                    _purposeField(),

                    const SizedBox(height: AppConsts.pLarge),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  label: 'Create Visitor',
                  onPressed: _submit,
                  isLoading: context.select<VisitorBloc, bool>(
                    (bloc) => bloc.state is VisitorLoading,
                  ),
                ),
                const SizedBox(height: AppConsts.pLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _nameField() {
    return CustomTextField(
      controller: _nameController,
      textInputType: TextInputType.name,
      labelText: 'Visitor Name',
      hintText: 'Enter visitor name',
      validator: (value) => InputVaildator.required(value),
    );
  }

  Widget _phoneField() {
    return CustomTextField(
      controller: _phoneController,
      textInputType: TextInputType.phone,
      labelText: 'Phone Number',
      hintText: 'Enter visitor phone number',
    );
  }

  Widget _visitTypeField() {
    return CustomDropdownField<VisitType>(
      initialValue: _visitType,
      labelText: 'Visit Type',
      hintText: 'Select visit type',
      items: VisitType.values,
      itemLabel: (item) => item.label,
      onChanged: (value) {
        setState(() {
          _visitType = value;
        });
      },
      validator: (value) {
        if (value == null) {
          return 'Please select visit type';
        }
        return null;
      },
    );
  }

  Widget _visitDateField() {
    return CustomTextField(
      controller: _visitDateController,
      textInputType: TextInputType.datetime,
      labelText: 'Visit Date',
      hintText: 'Select visit date',
      readOnly: true,
      suffixIcon: const Icon(Icons.calendar_month_outlined),
      onTap: _selectVisitDate,
      validator: (value) => InputVaildator.required(value),
    );
  }

  Widget _purposeField() {
    return CustomTextField(
      controller: _purposeController,
      textInputType: TextInputType.multiline,
      labelText: 'Purpose of Visit',
      hintText: 'Enter purpose of visit',
      maxLines: 3,
    );
  }

  Future<void> _selectVisitDate() async {
    final now = DateTime.now();
    DateTime selectedDateTime =
        _visitDate ?? now.add(const Duration(minutes: 15));

    final pickedDateTime = await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (context) => Container(
        height: 320,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              // Header
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    CupertinoButton(
                      onPressed: () => Navigator.pop(context, selectedDateTime),
                      child: const Text('Done'),
                    ),
                  ],
                ),
              ),

              // Date and time picker
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.dateAndTime,
                  initialDateTime: selectedDateTime.isBefore(now)
                      ? now.add(const Duration(minutes: 15))
                      : selectedDateTime,
                  minimumDate: now,
                  maximumDate: DateTime(2100),
                  use24hFormat: true,
                  onDateTimeChanged: (dateTime) {
                    selectedDateTime = dateTime;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (pickedDateTime == null || !mounted) return;

    if (pickedDateTime.isBefore(DateTime.now())) {
      Snack.error('Visit date and time cannot be in the past');
      return;
    }

    setState(() {
      _visitDate = pickedDateTime;
      _visitDateController.text = _formatDateTime(pickedDateTime);
    });
  }

  String _formatDateTime(DateTime date) {
    final datePart =
        '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';

    final timePart =
        '${date.hour.toString().padLeft(2, '0')}:'
        '${date.minute.toString().padLeft(2, '0')}';

    return '$datePart $timePart';
  }

  void _submit() {
    FocusScope.of(context).unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    if (_visitDate == null) {
      Snack.error('Select visit date and time');
      return;
    }

    final visitAt = DateTime(
      _visitDate!.year,
      _visitDate!.month,
      _visitDate!.day,
      _visitDate!.hour,
      _visitDate!.minute,
    );

    if (visitAt.isBefore(DateTime.now())) {
      Snack.error('Visit date and time cannot be in the past');
      return;
    }

    final visitor = CreateVisitor(
      orgId: authentication.profile?.orgId ?? '',
      createdBy: authentication.profile?.id ?? "",
      name: _nameController.text.trim(),
      phone: _phoneController.text.trim().isEmpty
          ? null
          : _phoneController.text.trim(),
      visitAt: visitAt,
      visitType: _visitType!,
      purpose: _purposeController.text.trim().isEmpty
          ? null
          : _purposeController.text.trim(),
    );

    context.read<VisitorBloc>().add(CreateVisitorEvent(visitor: visitor));
  }
}
