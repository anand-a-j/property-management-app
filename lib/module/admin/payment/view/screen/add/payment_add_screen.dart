import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/enum/payment_type.dart';
import 'package:naseem/module/admin/unit/model/unit.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/utils/input_vaildator.dart';
import '../../../../../../core/utils/snackbar_manager.dart';
import '../../../../../auth/core/controller/service/auth_service.dart';
import '../../../../community/model/community.dart';
import '../../../../lease/model/lease.dart';
import '../../../controller/bloc/payment_bloc.dart';

class AddPaymentScreen extends StatefulWidget {
  const AddPaymentScreen({
    super.key,
    required this.lease,
    required this.unit,
    required this.community,
  });

  final Lease lease;
  final Unit unit;
  final Community community;

  @override
  State<AddPaymentScreen> createState() => _AddPaymentScreenState();
}

class _AddPaymentScreenState extends State<AddPaymentScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _paymentNumberController =
      TextEditingController();

  final TextEditingController _dueDateController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  final TextEditingController _chequeNumberController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  DateTime? _dueDate;
  PaymentType? _paymentType;

  @override
  void initState() {
    super.initState();
    _paymentNumberController.text = _generatePaymentNumber();
  }

  @override
  void dispose() {
    _paymentNumberController.dispose();
    _dueDateController.dispose();
    _amountController.dispose();
    _chequeNumberController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  String _generatePaymentNumber() {
    final now = DateTime.now();

    return 'PAY-${now.year}'
        '${now.month.toString().padLeft(2, '0')}'
        '${now.day.toString().padLeft(2, '0')}-'
        '${now.hour.toString().padLeft(2, '0')}'
        '${now.minute.toString().padLeft(2, '0')}'
        '${now.second.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentBloc, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Snack.success("Paymment Added");
          Navigator.pop(context);
        }

        if (state is PaymentFailed) {
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
                      'Add Payment',
                      style: context.titleLarge?.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: AppConsts.pSmall),

                    Text(
                      'Enter the payment details for this lease',
                      style: context.bodyMedium?.copyWith(
                        color: context.secondaryContainer,
                      ),
                    ),

                    const SizedBox(height: AppConsts.pLarge),

                    _leaseDetailsCard(),

                    const SizedBox(height: AppConsts.pSide),

                    _paymentNumberField(),

                    const SizedBox(height: AppConsts.pSide),

                    _dueDateField(),

                    const SizedBox(height: AppConsts.pSide),

                    _amountField(),

                    const SizedBox(height: AppConsts.pSide),

                    _paymentTypeField(),

                    const SizedBox(height: AppConsts.pSide),

                    if (_paymentType == PaymentType.cheque) ...[
                      _chequeNumberField(),
                      const SizedBox(height: AppConsts.pSide),
                    ],

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
                  label: 'Create Payment',
                  onPressed: _submit,
                  isLoading: context.select<PaymentBloc, bool>(
                    (bloc) => bloc.state is PaymentLoading,
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

  Widget _leaseDetailsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.surface),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lease Details',
            style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text('${widget.unit.name} - ${widget.community.name}'),
          const SizedBox(height: 4),
          Text('Lease: ${widget.lease.leaseNumber}'),
        ],
      ),
    );
  }

  Widget _paymentNumberField() {
    return CustomTextField(
      controller: _paymentNumberController,
      textInputType: TextInputType.text,
      readOnly: true,
      labelText: 'Payment Number',
      hintText: 'Payment number',
      validator: (value) => InputVaildator.required(value),
    );
  }

  Widget _dueDateField() {
    return CustomTextField(
      controller: _dueDateController,
      textInputType: TextInputType.datetime,
      suffixIcon: const Icon(Icons.calendar_month_outlined),
      labelText: 'Due Date',
      hintText: 'Select due date',
      readOnly: true,
      onTap: _selectDueDate,
      validator: (value) => InputVaildator.required(value),
    );
  }

  Widget _amountField() {
    return CustomTextField(
      controller: _amountController,
      textInputType: const TextInputType.numberWithOptions(decimal: true),
      labelText: 'Amount',
      hintText: 'Enter payment amount',
      validator: (value) {
        final requiredError = InputVaildator.required(value);

        if (requiredError != null) {
          return requiredError;
        }

        final amount = double.tryParse(value!.trim());

        if (amount == null || !amount.isFinite) {
          return 'Enter a valid amount';
        }

        if (amount <= 0) {
          return 'Amount must be greater than 0';
        }

        return null;
      },
    );
  }

  Widget _paymentTypeField() {
    return CustomDropdownField<PaymentType>(
      initialValue: _paymentType,
      labelText: 'Payment Type',
      hintText: 'Select payment type',
      items: PaymentType.values,
      itemLabel: (item) => item.name,

      onChanged: (value) {
        setState(() {
          _paymentType = value;
        });
      },
      validator: (value) {
        if (value == null) {
          return 'Please select payment type';
        }

        return null;
      },
    );
  }

  Widget _chequeNumberField() {
    return CustomTextField(
      controller: _chequeNumberController,
      textInputType: TextInputType.text,
      labelText: 'Cheque Number',
      hintText: 'Enter cheque number',
      validator: (value) {
        if (_paymentType == PaymentType.cheque) {
          return InputVaildator.required(value);
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
      hintText: 'Enter payment description',
      maxLines: 3,
    );
  }

  Future<void> _selectDueDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate == null || !mounted) {
      return;
    }

    setState(() {
      _dueDate = selectedDate;
      _dueDateController.text = _formatDate(selectedDate);
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

    if (_dueDate == null || _paymentType == null) {
      return;
    }

    final description = _descriptionController.text.trim();
    final chequeNumber = _chequeNumberController.text.trim();

    context.read<PaymentBloc>().add(
      CreatePaymentEvent(
        orgId: authentication.profile?.orgId ?? '',
        leaseId: widget.lease.id,
        paymentNumber: _paymentNumberController.text.trim(),
        dueDate: _dueDate!,
        amount: double.parse(_amountController.text.trim()),
        paymentType: _paymentType!,
        chequeNumber: chequeNumber.isEmpty ? null : chequeNumber,
        description: description.isEmpty ? null : description,
        chequeCopyPath: null,
      ),
    );
  }
}
