import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/utils/snackbar_manager.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';

import '../../../../../core/core.dart';
import '../../../../../core/enum/lease_status.dart';
import '../../../../../core/enum/payment_frequency.dart';
import '../../../../../core/utils/generate_lease_number.dart';
import '../../../../../core/utils/input_vaildator.dart';
import '../../../unit/model/unit.dart';
import '../../controller/bloc/lease_bloc.dart';
import '../../model/lease.dart';

class AddLeaseScreen extends StatefulWidget {
  const AddLeaseScreen({
    super.key,
    required this.unit,
    this.lease,
    required this.isEdit,
  });

  final Unit unit;
  final Lease? lease;
  final bool isEdit;

  @override
  State<AddLeaseScreen> createState() => _AddLeaseScreenState();
}

class _AddLeaseScreenState extends State<AddLeaseScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _leaseNumberController = TextEditingController();

  final TextEditingController _residentIdController = TextEditingController();

  final TextEditingController _startDateController = TextEditingController();

  final TextEditingController _endDateController = TextEditingController();

  final TextEditingController _annualRentController = TextEditingController();

  final TextEditingController _securityDepositController =
      TextEditingController();

  final TextEditingController _numberOfChequesController =
      TextEditingController(text: '1');

  final TextEditingController _descriptionController = TextEditingController();

  DateTime? _startDate;
  DateTime? _endDate;

  PaymentFrequency? _paymentFrequency;

  @override
  void initState() {
    super.initState();
    _leaseNumberController.text = generateLeaseNumber();
  }

  @override
  void dispose() {
    _leaseNumberController.dispose();
    _residentIdController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _annualRentController.dispose();
    _securityDepositController.dispose();
    _numberOfChequesController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LeaseBloc, LeaseState>(
      listener: (context, state) {
        if (state is LeaseAddSuccess) {
          Snack.success('Lease added successfully');

          Navigator.pop(context);
        }

        if (state is LeaseUpdateSuccess) {
          Snack.success('Lease updated successfully');

          Navigator.pop(context);
        }

        if (state is LeaseFailed) {
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
                      'Add Lease',
                      style: context.titleLarge?.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: AppConsts.pSmall),

                    Text(
                      'Enter the details to create a new lease',
                      style: context.bodyMedium?.copyWith(
                        color: context.secondaryContainer,
                      ),
                    ),

                    const SizedBox(height: AppConsts.pLarge),

                    _unitDetailsCard(),

                    const SizedBox(height: AppConsts.pSide),

                    _leaseNumberField(),

                    const SizedBox(height: AppConsts.pSide),

                    _residentIdField(),

                    const SizedBox(height: AppConsts.pSide),

                    _startDateField(),

                    const SizedBox(height: AppConsts.pSide),

                    _endDateField(),

                    const SizedBox(height: AppConsts.pSide),

                    _annualRentField(),

                    const SizedBox(height: AppConsts.pSide),

                    _securityDepositField(),

                    const SizedBox(height: AppConsts.pSide),

                    _paymentFrequencyField(),

                    const SizedBox(height: AppConsts.pSide),

                    _numberOfChequesField(),

                    const SizedBox(height: AppConsts.pSide),

                    _descriptionField(),

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
                  label: widget.isEdit ? 'Update Lease' : 'Create Lease',
                  onPressed: _submit,
                  isLoading: context.select<LeaseBloc, bool>(
                    (bloc) => bloc.state is LeaseLoading,
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

  Widget _unitDetailsCard() {
    // Replace this with your UnitDetails card later.
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConsts.pSide),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.surface),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Unit Details',
            style: context.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(widget.unit.name),
        ],
      ),
    );
  }

  Widget _leaseNumberField() {
    return CustomTextField(
      controller: _leaseNumberController,
      textInputType: TextInputType.text,
      readOnly: true,
      labelText: 'Lease Number',
      hintText: 'Enter lease number',
      validator: (value) => InputVaildator.required(value),
    );
  }

  Widget _residentIdField() {
    return CustomTextField(
      controller: _residentIdController,
      textInputType: TextInputType.text,
      labelText: 'Resident ID',
      hintText: 'Enter resident ID',
      validator: (value) => InputVaildator.required(value),
    );
  }

  Widget _startDateField() {
    return CustomTextField(
      controller: _startDateController,
      textInputType: TextInputType.datetime,
      labelText: 'Start Date',
      hintText: 'Select start date',
      readOnly: true,
      onTap: _selectStartDate,
      validator: (value) => InputVaildator.required(value),
    );
  }

  Widget _endDateField() {
    return CustomTextField(
      controller: _endDateController,
      textInputType: TextInputType.datetime,
      labelText: 'End Date',
      hintText: 'Select end date',
      readOnly: true,
      onTap: _selectEndDate,
      validator: (value) {
        final requiredError = InputVaildator.required(value);

        if (requiredError != null) {
          return requiredError;
        }

        if (_startDate != null &&
            _endDate != null &&
            !_endDate!.isAfter(_startDate!)) {
          return 'End date must be after start date';
        }

        return null;
      },
    );
  }

  Widget _annualRentField() {
    return CustomTextField(
      controller: _annualRentController,
      textInputType: const TextInputType.numberWithOptions(decimal: true),
      labelText: 'Annual Rent',
      hintText: 'Enter annual rent',
      validator: (value) {
        final requiredError = InputVaildator.required(value);

        if (requiredError != null) {
          return requiredError;
        }

        final rent = double.tryParse(value!.trim());

        if (rent == null) {
          return 'Enter a valid amount';
        }

        if (rent <= 0) {
          return 'Annual rent must be greater than 0';
        }

        return null;
      },
    );
  }

  Widget _securityDepositField() {
    return CustomTextField(
      controller: _securityDepositController,
      textInputType: const TextInputType.numberWithOptions(decimal: true),
      labelText: 'Security Deposit',
      hintText: 'Enter security deposit',
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return null;
        }

        final deposit = double.tryParse(value.trim());

        if (deposit == null) {
          return 'Enter a valid amount';
        }

        if (deposit < 0) {
          return 'Security deposit cannot be negative';
        }

        return null;
      },
    );
  }

  Widget _paymentFrequencyField() {
    return CustomDropdownField<PaymentFrequency>(
      initialValue: _paymentFrequency,
      labelText: 'Payment Frequency',
      hintText: 'Select payment frequency',
      items: PaymentFrequency.values,
      itemLabel: (item) => item.label,
      onChanged: (value) {
        setState(() {
          _paymentFrequency = value;
        });
      },
      validator: (value) {
        if (value == null) {
          return 'Please select payment frequency';
        }

        return null;
      },
    );
  }

  Widget _numberOfChequesField() {
    return CustomTextField(
      controller: _numberOfChequesController,
      textInputType: TextInputType.number,
      labelText: 'Number of Cheques',
      hintText: 'Enter number of cheques',
      validator: (value) {
        final requiredError = InputVaildator.required(value);

        if (requiredError != null) {
          return requiredError;
        }

        final number = int.tryParse(value!.trim());

        if (number == null) {
          return 'Enter a valid number';
        }

        if (number <= 0) {
          return 'Number of cheques must be greater than 0';
        }

        return null;
      },
    );
  }

  Widget _descriptionField() {
    return CustomTextField(
      controller: _descriptionController,
      textInputType: TextInputType.multiline,
      labelText: 'Description',
      hintText: 'Enter lease description',
      maxLines: 3,
    );
  }

  Future<void> _selectStartDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate == null) {
      return;
    }

    setState(() {
      _startDate = selectedDate;
      _startDateController.text = _formatDate(selectedDate);

      // Clear end date if it is no longer valid.
      if (_endDate != null && !_endDate!.isAfter(selectedDate)) {
        _endDate = null;
        _endDateController.clear();
      }
    });
  }

  Future<void> _selectEndDate() async {
    final firstDate =
        _startDate?.add(const Duration(days: 1)) ?? DateTime.now();

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _endDate ?? firstDate,
      firstDate: firstDate,
      lastDate: DateTime(2100),
    );

    if (selectedDate == null) {
      return;
    }

    setState(() {
      _endDate = selectedDate;
      _endDateController.text = _formatDate(selectedDate);
    });
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  void _submit() {
    FocusScope.of(context).unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final leaseNumber = _leaseNumberController.text.trim();
    final residentId = _residentIdController.text.trim();

    final annualRent = double.parse(_annualRentController.text.trim());

    final securityDeposit = _securityDepositController.text.trim().isEmpty
        ? 0.0
        : double.parse(_securityDepositController.text.trim());

    final numberOfCheques = int.parse(_numberOfChequesController.text.trim());

    final description = _descriptionController.text.trim().isEmpty
        ? null
        : _descriptionController.text.trim();

    if (widget.isEdit) {
      context.read<LeaseBloc>().add(
        UpdateLease(
          leaseId: widget.lease!.id,
          residentId: residentId,
          leaseNumber: leaseNumber,
          startDate: _startDate,
          endDate: _endDate,
          annualRent: annualRent,
          securityDeposit: securityDeposit,
          paymentFrequency: _paymentFrequency?.name,
          numberOfCheques: numberOfCheques,
          status: widget.lease!.status.name,
          description: description,
        ),
      );
    } else {
      context.read<LeaseBloc>().add(
        AddLease(
          orgId: authentication.profile?.orgId ?? "",
          unitId: widget.unit.id,
          residentId: residentId,
          leaseNumber: leaseNumber,
          startDate: _startDate!,
          endDate: _endDate!,
          annualRent: annualRent,
          securityDeposit: securityDeposit,
          paymentFrequency: _paymentFrequency!.name,
          numberOfCheques: numberOfCheques,
          status: LeaseStatus.draft.name,
          description: description,
        ),
      );
    }
  }
}
