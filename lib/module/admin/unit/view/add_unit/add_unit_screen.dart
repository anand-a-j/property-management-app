import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/module/admin/community/model/community.dart';

import '../../../../../core/constants/property_type_constants.dart';
import '../../../../../core/core.dart';
import '../../../../../core/utils/input_vaildator.dart';
import '../../../../../core/utils/snackbar_manager.dart';
import '../../controller/bloc/bloc/unit_list_bloc.dart';
import '../../controller/bloc/unit_bloc.dart';
import '../../model/unit.dart';

class AddUnitScreen extends StatefulWidget {
  const AddUnitScreen({
    super.key,
    required this.community,
    required this.unit,
    required this.isEdit,
  });

  final Community community;
  final Unit? unit;
  final bool isEdit;

  @override
  State<AddUnitScreen> createState() => _AddUnitScreenState();
}

class _AddUnitScreenState extends State<AddUnitScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _unitNameController = TextEditingController();
  final TextEditingController _sizeAreaController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? _selectedUnitType;

  late final List<String> _unitTypes;

  @override
  void initState() {
    super.initState();

    _unitTypes = PropertyTypeConstants.getUnitTypes(
      widget.community.communityType,
    );

    if (widget.isEdit) {
      _unitNameController.text = widget.unit?.name ?? '';
      _sizeAreaController.text = widget.unit?.area ?? '';
      _descriptionController.text = widget.unit?.description ?? '';

      final existingUnitType = widget.unit?.unitType;

      if (existingUnitType != null && _unitTypes.contains(existingUnitType)) {
        _selectedUnitType = existingUnitType;
      }
    }
  }

  @override
  void dispose() {
    _unitNameController.dispose();
    _sizeAreaController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UnitBloc, UnitState>(
      listener: (context, state) {
        if (state is UnitAddSuccess) {
          Snack.success('Unit created successfully');

          if (!context.mounted) return;

          context.read<UnitListBloc>().add(
            GetUnits(communityId: widget.community.id??""),
          );

          Navigator.pop(context);
        }

        if (state is UnitUpdateSuccess) {
          Snack.success('Unit updated successfully');

          if (!context.mounted) return;

          context.read<UnitListBloc>().add(
            GetUnits(communityId: widget.community.id??""),
          );

          Navigator.pop(context);
        }

        if (state is UnitFailed) {
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
                      widget.isEdit ? 'Edit Unit' : 'Add Unit',
                      style: context.titleLarge?.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: AppConsts.pSmall),

                    Text(
                      widget.isEdit
                          ? 'Update the unit details'
                          : 'Enter the details to create a new unit',
                      style: context.bodyMedium?.copyWith(
                        color: context.secondaryContainer,
                      ),
                    ),

                    const SizedBox(height: AppConsts.pLarge),

                    _communityField(),

                    const SizedBox(height: AppConsts.pSide),

                    _unitTypeDropdown(),

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
                CustomButton(
                  label: widget.isEdit ? 'Update Unit' : 'Create Unit',
                  isLoading: context.select<UnitBloc, bool>(
                    (bloc) => bloc.state is UnitLoading,
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

  Widget _communityField() {
    return CustomTextField(
      controller: TextEditingController(text: widget.community.name),
      textInputType: TextInputType.text,
      labelText: 'Community',
      hintText: 'Community',
      readOnly: true,
    );
  }

  Widget _unitTypeDropdown() {
    return CustomDropdownField<String>(
      initialValue: _selectedUnitType,
      labelText: 'Unit Type',
      hintText: 'Select unit type',
      items: _unitTypes,
      itemLabel: (item) => item,
      onChanged: (value) {
        setState(() {
          _selectedUnitType = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select unit type';
        }

        return null;
      },
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

  void _submit() {
    FocusScope.of(context).unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final communityId = widget.community.id;
    final unitName = _unitNameController.text.trim();
    final sizeArea = _sizeAreaController.text.trim();
    final description = _descriptionController.text.trim();
    final unitType = _selectedUnitType!;

    if (widget.isEdit) {
      context.read<UnitBloc>().add(
        UpdateUnit(
          unitId: widget.unit?.id ?? '',
          communityId: communityId??"",
          unitType: unitType,
          name: unitName,
          area: sizeArea,
          description: description,
        ),
      );

      return;
    }

    context.read<UnitBloc>().add(
      AddUnit(
        communityId: communityId??"",
        unitType: unitType,
        name: unitName,
        area: sizeArea,
        description: description,
      ),
    );
  }
}
