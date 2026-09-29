import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../../../core/utils/input_vaildator.dart';

class AddUnitScreen extends StatefulWidget {
  const AddUnitScreen({super.key});

  @override
  State<AddUnitScreen> createState() => _AddUnitScreenState();
}

class _AddUnitScreenState extends State<AddUnitScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _unitNameController = TextEditingController();

  final TextEditingController _sizeAreaController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  // TODO: Replace this with the actual community name/data later.
  final String _communityName = 'Community Name';

  @override
  void dispose() {
    _unitNameController.dispose();
    _sizeAreaController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Back',
        leadingOnTap: () => Navigator.of(context).pop(),
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
                    'Add Unit',
                    style: context.titleLarge?.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: AppConsts.pSmall),

                  Text(
                    'Enter the details to create a new unit',
                    style: context.bodyMedium?.copyWith(
                      color: context.secondaryContainer,
                    ),
                  ),

                  const SizedBox(height: AppConsts.pLarge),

                  _communityField(),

                  const SizedBox(height: AppConsts.pSide),

                  _unitNameField(),

                  const SizedBox(height: AppConsts.pSide),

                  _sizeAreaField(),

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
              CustomButton(label: 'Create Unit', onPressed: _createUnit),
              const SizedBox(height: AppConsts.pLarge),
            ],
          ),
        ),
      ),
    );
  }

  Widget _communityField() {
    return CustomTextField(
      controller: TextEditingController(text: _communityName),
      textInputType: TextInputType.text,
      labelText: 'Community',
      hintText: 'Community',
      readOnly: true,
    );
  }

  Widget _unitNameField() {
    return CustomTextField(
      controller: _unitNameController,
      textInputType: TextInputType.text,
      labelText: 'Unit Name',
      hintText: 'Enter unit name',
      validator: (value) => InputVaildator.required(value),
    );
  }

  Widget _sizeAreaField() {
    return CustomTextField(
      controller: _sizeAreaController,
      textInputType: const TextInputType.numberWithOptions(decimal: true),
      labelText: 'Size / Area',
      hintText: 'Enter size or area',
      validator: (value) => InputVaildator.required(value),
    );
  }

  Widget _descriptionField() {
    return CustomTextField(
      controller: _descriptionController,
      textInputType: TextInputType.multiline,
      labelText: 'Description',
      hintText: 'Enter unit description',
      maxLines: 3,
      validator: (value) => InputVaildator.required(value),
    );
  }

  void _createUnit() {
    FocusScope.of(context).unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final community = _communityName;
    final unitName = _unitNameController.text.trim();
    final sizeArea = _sizeAreaController.text.trim();
    final description = _descriptionController.text.trim();

    // TODO: Connect to Bloc/API later.
  }
}
