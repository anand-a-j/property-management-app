import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../core/enum/user_role.dart';
import '../../../../core/utils/input_vaildator.dart';
import '../../../../core/utils/snackbar_manager.dart';
import '../bloc/profile_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    super.key,
    required this.id,
    required this.role,
    required this.initialName,
    required this.initialPhone,
    required this.initialEmail,
    this.initialFirstName,
    this.initialLastName,
    this.initialNickname,
    this.initialEmiratesId,
  });


  final String id;

  final UserRole role;

  final String initialName;
  final String? initialPhone;
  final String initialEmail;

  // Resident-specific initial values
  final String? initialFirstName;
  final String? initialLastName;
  final String? initialNickname;
  final String? initialEmiratesId;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _nicknameController;
  late final TextEditingController _emiratesIdController;

  bool get _isResident => widget.role == UserRole.resident;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.initialName);

    _firstNameController = TextEditingController(
      text: widget.initialFirstName ?? '',
    );

    _lastNameController = TextEditingController(
      text: widget.initialLastName ?? '',
    );

    _phoneController = TextEditingController(text: widget.initialPhone ?? '');

    _nicknameController = TextEditingController(
      text: widget.initialNickname ?? '',
    );

    _emiratesIdController = TextEditingController(
      text: widget.initialEmiratesId ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _nicknameController.dispose();
    _emiratesIdController.dispose();
    super.dispose();
  }

  // ------------------------------------------------------------
  // BUILD
  // ------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: _profileListener,
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
                      'Edit Profile',
                      style: context.titleLarge?.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: AppConsts.pSmall),

                    Text(
                      'Keep your personal information up to date.',
                      style: context.bodyMedium?.copyWith(
                        color: context.secondaryContainer,
                      ),
                    ),

                    const SizedBox(height: AppConsts.pLarge),

                    // RESIDENT FIELDS
                    if (_isResident) ...[
                      _firstNameField(),

                      const SizedBox(height: AppConsts.pSide),

                      _lastNameField(),

                      const SizedBox(height: AppConsts.pSide),

                      _emiratesIdField(),
                    ] else
                      // MANAGER / STAFF
                      _fullNameField(),

                    const SizedBox(height: AppConsts.pSide),

                    const SizedBox(height: AppConsts.pSide),

                    _phoneField(),

                    const SizedBox(height: AppConsts.pMedium),
                  ],
                ),
              ),
            ),
          ),
        ),

        // BOTTOM BUTTON
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  label: 'Save Changes',
                  isLoading: context.select<ProfileBloc, bool>(
                    (bloc) => bloc.state is ProfileLoading,
                  ),
                  onPressed: _saveProfile,
                ),

                const SizedBox(height: AppConsts.pLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // PROFILE LISTENER
  // ------------------------------------------------------------

  void _profileListener(BuildContext context, ProfileState state) {
    if (state is ProfileSuccess) {
      if (state.action == ProfileAction.updateResidentDetails) {
        // Resident details updated successfully.
        // Now update the basic profile name and phone.

        context.read<ProfileBloc>().add(
          UpdateProfileEvent(
            name:
                '${_firstNameController.text.trim()} '
                        '${_lastNameController.text.trim()}'
                    .trim(),
            phone: _phoneController.text.trim().isEmpty
                ? null
                : _phoneController.text.trim(),
            id: widget.id,
          ),
        );

        return;
      }

      if (state.action == ProfileAction.updateProfile) {
        Snack.success('Profile updated successfully.');
        Navigator.of(context).pop();
      }
    }

    if (state is ProfileFailed) {
      Snack.error(state.message);
    }
  }

  // ------------------------------------------------------------
  // TEXT FIELDS
  // ------------------------------------------------------------

  Widget _fullNameField() {
    return CustomTextField(
      controller: _nameController,
      textInputType: TextInputType.name,
      labelText: 'Full Name',
      hintText: 'Enter your full name',
      validator: (value) => InputVaildator.required(value),
    );
  }

  Widget _firstNameField() {
    return CustomTextField(
      controller: _firstNameController,
      textInputType: TextInputType.name,
      labelText: 'First Name',
      hintText: 'Enter first name',
      validator: (value) => InputVaildator.required(value),
    );
  }

  Widget _lastNameField() {
    return CustomTextField(
      controller: _lastNameController,
      textInputType: TextInputType.name,
      labelText: 'Last Name',
      hintText: 'Enter last name',
      validator: (value) => InputVaildator.required(value),
    );
  }

  // ignore: unused_element
  Widget _nicknameField() {
    return CustomTextField(
      controller: _nicknameController,
      textInputType: TextInputType.name,
      labelText: 'Nickname',
      hintText: 'Enter nickname (optional)',
    );
  }

  Widget _emiratesIdField() {
    return CustomTextField(
      controller: _emiratesIdController,
      textInputType: TextInputType.number,
      labelText: 'Emirates ID',
      hintText: '784-XXXX-XXXXXXX-X',
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return null;
        }
        return InputVaildator.validateEmiratesId(value);
      },
    );
  }

  Widget _phoneField() {
    return CustomTextField(
      controller: _phoneController,
      textInputType: TextInputType.phone,
      labelText: 'Mobile Number',
      hintText: 'Enter mobile number',
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return null;
        }
        return InputVaildator.required(value);
      },
    );
  }

  // ------------------------------------------------------------
  // SAVE PROFILE
  // ------------------------------------------------------------

  void _saveProfile() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    final phone = _phoneController.text.trim();

    if (_isResident) {
      context.read<ProfileBloc>().add(
        UpdateResidentDetailsEvent(
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          nickname: _nicknameController.text.trim().isEmpty
              ? null
              : _nicknameController.text.trim(),
          emiratesId: _emiratesIdController.text.trim().isEmpty
              ? null
              : _emiratesIdController.text.trim(),
        ),
      );
    } else {
      context.read<ProfileBloc>().add(
        UpdateProfileEvent(
          name: _nameController.text.trim(),
          phone: phone.isEmpty ? null : phone,
          id: widget.id,
        ),
      );
    }
  }
}
