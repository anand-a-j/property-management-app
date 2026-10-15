import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/enum/sign_up_type.dart';
import 'package:naseem/module/auth/core/controller/service/auth_service.dart';
import 'package:naseem/module/staff/controller/bloc/staff_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../../core/enum/user_role.dart';
import '../../../../../core/utils/input_vaildator.dart';
import '../../../../../core/utils/snackbar_manager.dart';
import '../../../../platform_admin/controller/bloc/manager_bloc.dart';
import '../../../core/controller/bloc/auth_bloc.dart';
import '../../../core/controller/bloc/auth_event.dart';
import '../../../core/controller/bloc/auth_state.dart';
import '../../../core/model/profile_details.dart';
import '../../../sign_in/view/widgets/auth_navigation_text.dart';
import '../../controller/sign_up_form_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, required this.type});

  final SignUpType type;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final SignUpFormController _formController;

  bool get _isResident => widget.type == SignUpType.resident;

  @override
  void initState() {
    super.initState();
    _formController = SignUpFormController();
  }

  @override
  void dispose() {
    _formController.dispose();
    super.dispose();
  }

  // ------------------------------------------------------------
  // ROLE
  // ------------------------------------------------------------

  UserRole get _userRole {
    switch (widget.type) {
      case SignUpType.resident:
        return UserRole.resident;

      case SignUpType.manager:
        return UserRole.manager;

      case SignUpType.staff:
        return _formController.selectedStaffRole ?? UserRole.security;
    }
  }

  // ------------------------------------------------------------
  // TITLE
  // ------------------------------------------------------------

  String get _title {
    switch (widget.type) {
      case SignUpType.resident:
        return authentication.isAuthenticated
            ? 'Add New Resident'
            : 'Create your Account';

      case SignUpType.manager:
        return 'Add New Manager';

      case SignUpType.staff:
        return 'Add New Staff Member';
    }
  }

  // ------------------------------------------------------------
  // SUBTITLE
  // ------------------------------------------------------------

  String get _subtitle {
    switch (widget.type) {
      case SignUpType.resident:
        return authentication.isAuthenticated
            ? 'Enter the resident details to add them to your community'
            : 'Enter your details to create a new account';

      case SignUpType.manager:
        return 'Enter details to set up a new property manager account';

      case SignUpType.staff:
        return 'Enter details and select a role to set up a new staff account';
    }
  }

  // ------------------------------------------------------------
  // BUTTON TITLE
  // ------------------------------------------------------------

  String get _buttonTitle {
    switch (widget.type) {
      case SignUpType.resident:
        return authentication.isAuthenticated
            ? 'Create'
            : 'Create your Account';

      case SignUpType.manager:
      case SignUpType.staff:
        return 'Create';
    }
  }

  // ------------------------------------------------------------
  // BUILD
  // ------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    log('Sign up type: ${widget.type}');

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          if (widget.type == SignUpType.staff) {
            context.read<StaffBloc>().add(
              FetchStaffs(orgId: authentication.profile?.orgId ?? ''),
            );

            Snack.success('Success');
            Navigator.pop(context);
          } else if (widget.type == SignUpType.manager) {
            context.read<ManagerBloc>().add(const FetchManagers());

            Snack.success('Success');
            Navigator.pop(context);
          } else if (widget.type == SignUpType.resident) {
            Snack.success('Success');
            Navigator.pop(context);
          } else {
            Snack.success('Sign up success, more features coming soon');
          }
        }

        if (state is AuthFailed) {
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
              key: _formController.formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppConsts.pMedium),

                    Text(
                      _title,
                      style: context.titleLarge?.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: AppConsts.pSmall),

                    Text(
                      _subtitle,
                      style: context.bodyMedium?.copyWith(
                        color: context.secondaryContainer,
                      ),
                    ),

                    const SizedBox(height: AppConsts.pLarge),

                    // STAFF ROLE
                    if (widget.type == SignUpType.staff) ...[
                      _staffRoleDropdown(),
                      const SizedBox(height: AppConsts.pSide),
                    ],

                    // NAME FIELDS
                    if (_isResident) ...[
                      // FIRST NAME
                      _firstNameTextField(),

                      const SizedBox(height: AppConsts.pSide),

                      // LAST NAME
                      _lastNameTextField(),

                      const SizedBox(height: AppConsts.pSide),

                      // EMIRATES ID
                      _emiratesIdTextField(),
                    ] else
                      // FULL NAME (manager / staff)
                      _fullNameTextField(),

                    const SizedBox(height: AppConsts.pSide),

                    // EMAIL
                    _emailTextField(),

                    const SizedBox(height: AppConsts.pSide),

                    // PHONE
                    _phoneNumberTextField(),

                    const SizedBox(height: AppConsts.pSide),

                    // PASSWORD
                    _passwordTextField(),

                    const SizedBox(height: AppConsts.pSide),

                    // CONFIRM PASSWORD
                    _confirmPasswordTextField(),

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
                  label: _buttonTitle,
                  isLoading: context.select<AuthBloc, bool>(
                    (bloc) => bloc.state is AuthLoading,
                  ),
                  onPressed: _signUpRequest,
                ),

                if (_isResident && !authentication.isAuthenticated) ...[
                  const SizedBox(height: AppConsts.pMedium),
                  const AuthNavigationText(isFromSignInScreen: false),
                ],

                const SizedBox(height: AppConsts.pLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // STAFF ROLE DROPDOWN
  // ------------------------------------------------------------

  Widget _staffRoleDropdown() {
    return CustomDropdownField<UserRole>(
      initialValue: _formController.selectedStaffRole,
      labelText: 'Staff Role',
      hintText: 'Select staff role',
      items: [UserRole.security, UserRole.maintenance],
      itemLabel: (item) => item.name,
      onChanged: (value) {
        setState(() {
          _formController.selectedStaffRole = value;
        });
      },
      validator: (value) {
        if (widget.type == SignUpType.staff && value == null) {
          return 'Please select a staff role';
        }

        return null;
      },
    );
  }

  // ------------------------------------------------------------
  // FULL NAME (manager / staff only)
  // ------------------------------------------------------------

  CustomTextField _fullNameTextField() {
    return CustomTextField(
      controller: _formController.fullNameController,
      textInputType: TextInputType.name,
      labelText: 'Full Name',
      hintText: 'Full Name',
      validator: (value) => InputVaildator.required(value),
    );
  }

  // ------------------------------------------------------------
  // FIRST NAME (resident only)
  // ------------------------------------------------------------

  CustomTextField _firstNameTextField() {
    return CustomTextField(
      controller: _formController.firstNameController,
      textInputType: TextInputType.name,
      labelText: 'First Name',
      hintText: 'First Name',
      validator: (value) => InputVaildator.required(value),
    );
  }

  // ------------------------------------------------------------
  // LAST NAME (resident only)
  // ------------------------------------------------------------

  CustomTextField _lastNameTextField() {
    return CustomTextField(
      controller: _formController.lastNameController,
      textInputType: TextInputType.name,
      labelText: 'Last Name',
      hintText: 'Last Name',
      validator: (value) => InputVaildator.required(value),
    );
  }

  // ------------------------------------------------------------
  // EMIRATES ID (resident only)
  // ------------------------------------------------------------

  CustomTextField _emiratesIdTextField() {
    return CustomTextField(
      controller: _formController.emiratesIdController,
      textInputType: TextInputType.number,
      labelText: 'Emirates ID',
      hintText: '784-XXXX-XXXXXXX-X',
      validator: (v) => InputVaildator.validateEmiratesId(v),
    );
  }

  // ------------------------------------------------------------
  // EMAIL
  // ------------------------------------------------------------

  CustomTextField _emailTextField() {
    return CustomTextField(
      controller: _formController.emailController,
      textInputType: TextInputType.emailAddress,
      labelText: 'Email',
      hintText: 'Email',
      validator: (value) => InputVaildator.email(value),
    );
  }

  // ------------------------------------------------------------
  // PHONE
  // ------------------------------------------------------------

  CustomTextField _phoneNumberTextField() {
    return CustomTextField(
      controller: _formController.phoneNumberController,
      textInputType: TextInputType.phone,
      labelText: 'Mobile number',
      hintText: 'Mobile number',
      validator: (value) => InputVaildator.required(value),
    );
  }

  // ------------------------------------------------------------
  // PASSWORD
  // ------------------------------------------------------------

  Widget _passwordTextField() {
    return ValueListenableBuilder<bool>(
      valueListenable: _formController.obscurePassword,
      builder: (context, obscurePassword, _) {
        return CustomTextField(
          controller: _formController.passwordController,
          labelText: 'Password',
          hintText: 'Password',
          textInputType: TextInputType.visiblePassword,
          validator: (value) => InputVaildator.password(value),
          obscureText: obscurePassword,
          suffixIcon: GestureDetector(
            onTap: _formController.togglePasswordVisibility,
            child: Icon(
              obscurePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: context.secondaryContainer,
              size: 22,
            ),
          ),
        );
      },
    );
  }

  // ------------------------------------------------------------
  // CONFIRM PASSWORD
  // ------------------------------------------------------------

  Widget _confirmPasswordTextField() {
    return ValueListenableBuilder<bool>(
      valueListenable: _formController.obscureConfirmPassword,
      builder: (context, obscurePassword, _) {
        return CustomTextField(
          controller: _formController.confirmPasswordController,
          labelText: 'Confirm password',
          hintText: 'Confirm password',
          textInputType: TextInputType.visiblePassword,
          validator: (value) {
            final password = _formController.passwordController.text.trim();

            final confirmPassword = value?.trim() ?? '';

            if (confirmPassword.isEmpty) {
              return 'Please confirm your password';
            }

            if (password != confirmPassword) {
              return 'Passwords do not match';
            }

            return null;
          },
          obscureText: obscurePassword,
          suffixIcon: GestureDetector(
            onTap: _formController.toggleConfirmPasswordVisibility,
            child: Icon(
              obscurePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: context.secondaryContainer,
              size: 22,
            ),
          ),
        );
      },
    );
  }

  // ------------------------------------------------------------
  // SIGN UP REQUEST
  // ------------------------------------------------------------

  void _signUpRequest() {
    FocusScope.of(context).unfocus();

    // Validate the form through the controller.
    if (!_formController.validate()) {
      return;
    }

    // Read values from the controller.
    final email = _formController.emailController.text.trim();
    final phone = _formController.phoneNumberController.text.trim();
    final password = _formController.passwordController.text.trim();
    final role = _userRole;

    // Resident: full name = first name + last name.
    // Manager / staff: full name comes from the full name field.
    String fullName;
    ProfileDetails? profileDetails;

    if (_isResident) {
      final firstName = _formController.firstNameController.text.trim();
      final lastName = _formController.lastNameController.text.trim();
      final emiratesId = _formController.emiratesIdController.text.trim();

      fullName = '$firstName $lastName'.trim();

      profileDetails = ProfileDetails(
        firstName: firstName,
        lastName: lastName,
        emiratesId: emiratesId.isNotEmpty ? emiratesId : null,
      );
    } else {
      fullName = _formController.fullNameController.text.trim();
    }

    // Determine organization ID.
    final String? orgId = switch (role) {
      UserRole.resident ||
      UserRole.security ||
      UserRole.maintenance => authentication.profile?.orgId,

      UserRole.manager || UserRole.platformAdmin => null,
    };

    // Organization is required for resident and staff signup.
    if (role == UserRole.resident ||
        role == UserRole.security ||
        role == UserRole.maintenance) {
      if (orgId == null || orgId.isEmpty) {
        Snack.error(
          'Manager information is missing. '
          'Please select a valid manager and try again.',
        );
        return;
      }
    }

    log('Sign up role: $role');
    log('Sign up orgId: $orgId');

    final isManagedCreation =
        authentication.isAuthenticated &&
        authentication.role == UserRole.manager;

    context.read<AuthBloc>().add(
      AuthSignUp(
        email: email,
        password: password,
        name: fullName,
        phone: phone.isNotEmpty ? phone : null,
        role: role,
        signUpType: widget.type,
        orgId: orgId,
        isManagedCreation: isManagedCreation,
        profileDetails: profileDetails,
      ),
    );
  }
}
