
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../core/utils/input_vaildator.dart';

class AddCommunityScreen extends StatefulWidget {
  const AddCommunityScreen({super.key});

  @override
  State<AddCommunityScreen> createState() => _AddCommunityScreenState();
}

class _AddCommunityScreenState extends State<AddCommunityScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _communityNameController =
      TextEditingController();

  final TextEditingController _addressController =
      TextEditingController();

  final TextEditingController _descriptionController =
      TextEditingController();

  String? _selectedDevelopmentType;
  String? _selectedCommunityType;

  static const List<String> _developmentTypes = [
    'Standalone',
    'Development Type 2',
    'Development Type 3',
  ];

  static const List<String> _communityTypes = [
    'Villa',
    'Apartment',
    'Townhouse',
    'Studio',
    'Penthouse',
  ];

  @override
  void dispose() {
    _communityNameController.dispose();
    _addressController.dispose();
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
          padding: const EdgeInsets.symmetric(
            horizontal: AppConsts.pSide,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppConsts.pMedium),

                  Text(
                    'Add Community',
                    style: context.titleLarge?.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: AppConsts.pSmall),

                  Text(
                    'Enter the details to create a new community',
                    style: context.bodyMedium?.copyWith(
                      color: context.secondaryContainer,
                    ),
                  ),

                  const SizedBox(height: AppConsts.pLarge),

                  _developmentTypeDropdown(),

                  const SizedBox(height: AppConsts.pSide),

                  _communityTypeDropdown(),

                  const SizedBox(height: AppConsts.pSide),

                  _communityNameField(),

                  const SizedBox(height: AppConsts.pSide),

                  _addressField(),

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
          padding: const EdgeInsets.symmetric(
            horizontal: AppConsts.pSide,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                label: 'Create Community',
                onPressed: _createCommunity,
              ),
              const SizedBox(height: AppConsts.pLarge),
            ],
          ),
        ),
      ),
    );
  }

  Widget _developmentTypeDropdown() {
    return CustomDropdownField<String>(
      initialValue: _selectedDevelopmentType,
      labelText: 'Development Type',
      hintText: 'Select development type',
      items: _developmentTypes,
      itemLabel: (item) => item,
      onChanged: (value) {
        setState(() {
          _selectedDevelopmentType = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select development type';
        }

        return null;
      },
    );
  }

  Widget _communityTypeDropdown() {
    return CustomDropdownField<String>(
      initialValue: _selectedCommunityType,
      labelText: 'Community Type',
      hintText: 'Select community type',
      items: _communityTypes,
      itemLabel: (item) => item,
      onChanged: (value) {
        setState(() {
          _selectedCommunityType = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select community type';
        }

        return null;
      },
    );
  }

  Widget _communityNameField() {
    return CustomTextField(
      controller: _communityNameController,
      textInputType: TextInputType.text,
      labelText: 'Community Name',
      hintText: 'Enter community name',
      validator: (value) => InputVaildator.required(value),
    );
  }

  Widget _addressField() {
    return CustomTextField(
      controller: _addressController,
      textInputType: TextInputType.streetAddress,
      labelText: 'Address',
      hintText: 'Enter community address',
      maxLines: 3,
      validator: (value) => InputVaildator.required(value),
    );
  }

  Widget _descriptionField() {
    return CustomTextField(
      controller: _descriptionController,
      textInputType: TextInputType.multiline,
      labelText: 'Description',
      hintText: 'Enter community description',
      maxLines: 3,
      validator: (value) => InputVaildator.required(value),
    );
  }

  void _createCommunity() {
    FocusScope.of(context).unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final developmentType = _selectedDevelopmentType!;
    final communityType = _selectedCommunityType!;
    final communityName = _communityNameController.text.trim();
    final address = _addressController.text.trim();
    final description = _descriptionController.text.trim();

    // TODO: Connect to Bloc/API later.
  }
}

