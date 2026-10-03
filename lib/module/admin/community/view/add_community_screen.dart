import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/utils/snackbar_manager.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';

import '../../../../core/core.dart';
import '../../../../core/enum/community_type.dart';
import '../../../../core/enum/development_type.dart';
import '../../../../core/utils/input_vaildator.dart';
import '../controller/bloc/community_bloc.dart';
import '../model/community.dart';

class AddCommunityScreen extends StatefulWidget {
  const AddCommunityScreen({super.key, this.isEdit = false, this.community});

  final bool isEdit;
  final Community? community;

  @override
  State<AddCommunityScreen> createState() => _AddCommunityScreenState();
}

class _AddCommunityScreenState extends State<AddCommunityScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _communityNameController =
      TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  DevelopmentType? _selectedDevelopmentType;
  CommunityType? _selectedCommunityType;

  static const List<DevelopmentType> _developmentTypes = DevelopmentType.values;

  static const List<CommunityType> _communityTypes = CommunityType.values;

  @override
  void initState() {
    super.initState();
    _initEdit();
  }

  void _initEdit() {
    if (!widget.isEdit || widget.community == null) {
      return;
    }

    final community = widget.community!;

    _communityNameController.text = community.name;
    _addressController.text = community.address;
    _descriptionController.text = community.description;

    _selectedDevelopmentType = DevelopmentType.values.firstWhere(
      (type) => type.value == community.developmentType,
    );

    _selectedCommunityType = CommunityType.values.firstWhere(
      (type) => type.value == community.communityType,
    );
  }

  @override
  void dispose() {
    _communityNameController.dispose();
    _addressController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CommunityBloc, CommunityState>(
      listener: (context, state) {
        if (state is AddUpdateCommunitySuccess) {
          if (!context.mounted) return;

          context.read<CommunityBloc>().add(GetCommunities());
          context.pop();
        }

        if (state is CommunityFailed) {
          Snack.error(state.message);
        }
      },
      child: Scaffold(
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
                      widget.isEdit ? 'Edit Community' : 'Add Community',
                      style: context.titleLarge?.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: AppConsts.pSmall),

                    Text(
                      widget.isEdit
                          ? 'Update the community details'
                          : 'Enter the details to create a new community',
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
            padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  label: widget.isEdit
                      ? 'Update Community'
                      : 'Create Community',
                  isLoading: context.select<CommunityBloc, bool>(
                    (bloc) => bloc.state is CommunityLoading,
                  ),
                  onPressed: _submit,
                ),
                const SizedBox(height: AppConsts.pLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _developmentTypeDropdown() {
    return CustomDropdownField<DevelopmentType>(
      initialValue: _selectedDevelopmentType,
      labelText: 'Development Type',
      hintText: 'Select development type',
      items: _developmentTypes,
      itemLabel: (item) => item.label,
      onChanged: (value) {
        setState(() {
          _selectedDevelopmentType = value;
        });
      },
      validator: (value) {
        if (value == null) {
          return 'Please select development type';
        }

        return null;
      },
    );
  }

  Widget _communityTypeDropdown() {
    return CustomDropdownField<CommunityType>(
      initialValue: _selectedCommunityType,
      labelText: 'Community Type',
      hintText: 'Select community type',
      items: _communityTypes,
      itemLabel: (item) => item.label,
      onChanged: (value) {
        setState(() {
          _selectedCommunityType = value;
        });
      },
      validator: (value) {
        if (value == null) {
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

  void _submit() {
    FocusScope.of(context).unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final developmentType = _selectedDevelopmentType!;
    final communityType = _selectedCommunityType!;

    final communityName = _communityNameController.text.trim();
    final address = _addressController.text.trim();
    final description = _descriptionController.text.trim();

    final bloc = context.read<CommunityBloc>();

    if (widget.isEdit) {
      final community = widget.community!;

      bloc.add(
        UpdateCommunity(
          id: community.id,
          developmentType: developmentType.value,
          communityType: communityType.value,
          name: communityName,
          address: address,
          description: description,
        ),
      );
    } else {
      bloc.add(
        CreateCommunity(
          orgId: authentication.profile?.orgId ?? "",
          developmentType: developmentType.value,
          communityType: communityType.value,
          name: communityName,
          address: address,
          description: description,
        ),
      );
    }
  }
}
