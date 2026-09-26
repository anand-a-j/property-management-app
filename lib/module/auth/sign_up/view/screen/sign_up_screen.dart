import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseem/core/enum/sign_up_type.dart';

import '../../../../../core/core.dart';
import '../../../../../core/enum/user_role.dart';
import '../../../../../core/utils/input_vaildator.dart';
import '../../../../../core/utils/snackbar_manager.dart';
import '../../../core/controller/bloc/auth_bloc.dart';
import '../../../core/controller/bloc/auth_event.dart';
import '../../../core/controller/bloc/auth_state.dart';
import '../../../sign_in/view/widgets/auth_navigation_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, required this.type});

  final SignUpType type;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final ValueNotifier<bool> _obscurePassword = ValueNotifier(true);
  final ValueNotifier<bool> _obscureConfirmPassword = ValueNotifier(true);

  UserRole? _selectedStaffRole;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    _obscurePassword.dispose();
    _obscureConfirmPassword.dispose();

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
        return _selectedStaffRole ?? UserRole.security;
    }
  }

  // ------------------------------------------------------------
  // TITLE
  // ------------------------------------------------------------

  String get _title {
    switch (widget.type) {
      case SignUpType.resident:
        return 'Create your Account';

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
        return 'Enter your details to create a new account';

      case SignUpType.manager:
        return 'Enter details to set up a new property manager account';

      case SignUpType.staff:
        return 'Enter details and select a role to set up a new staff account';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          // Navigate / pop here
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
              key: _formKey,
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

                    // STAFF ROLE DROPDOWN
                    if (widget.type == SignUpType.staff) ...[
                      _staffRoleDropdown(),

                      const SizedBox(height: AppConsts.pSide),
                    ],

                    _fullNameTextField(),

                    const SizedBox(height: AppConsts.pSide),

                    _emailTextField(),

                    const SizedBox(height: AppConsts.pSide),

                    _phoneNumberTextField(),

                    const SizedBox(height: AppConsts.pSide),

                    _passwordTextField(),

                    const SizedBox(height: AppConsts.pSide),

                    _confirmPasswordTextField(),

                    const SizedBox(height: AppConsts.pMedium),
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
                  label: 'Create account',
                  isLoading: context.select<AuthBloc, bool>(
                    (bloc) => bloc.state is AuthLoading,
                  ),
                  onPressed: _signUpRequest,
                ),

                const SizedBox(height: AppConsts.pMedium),

                const AuthNavigationText(isFromSignInScreen: false),

                const SizedBox(height: AppConsts.pLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // STAFF ROLE
  // ------------------------------------------------------------

  Widget _staffRoleDropdown() {
    return CustomDropdownField<UserRole>(
      initialValue: _selectedStaffRole,
      labelText: 'Staff Role',
      hintText: 'Select staff role',
      items: [UserRole.security, UserRole.maintenance],
      itemLabel: (item) {
        return item.name;
      },

      onChanged: (value) {
        setState(() {
          _selectedStaffRole = value;
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
  // FULL NAME
  // ------------------------------------------------------------

  CustomTextField _fullNameTextField() {
    return CustomTextField(
      controller: _fullNameController,
      textInputType: TextInputType.name,
      labelText: 'Full Name',
      hintText: 'Full Name',
      validator: (value) => InputVaildator.required(value),
    );
  }

  // ------------------------------------------------------------
  // EMAIL
  // ------------------------------------------------------------

  CustomTextField _emailTextField() {
    return CustomTextField(
      controller: _emailController,
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
      controller: _phoneNumberController,
      textInputType: TextInputType.phone,
      labelText: 'Mobile number',
      hintText: 'Mobile number',
      validator: (value) => InputVaildator.phone(value),
    );
  }

  // ------------------------------------------------------------
  // PASSWORD
  // ------------------------------------------------------------

  ValueListenableBuilder<bool> _passwordTextField() {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscurePassword,
      builder: (context, value, _) {
        return CustomTextField(
          controller: _passwordController,
          labelText: 'Password',
          hintText: 'Password',
          textInputType: TextInputType.visiblePassword,
          validator: (value) => InputVaildator.password(value),
          obscureText: value,
          suffixIcon: GestureDetector(
            onTap: () {
              _obscurePassword.value = !value;
            },
            child: Icon(
              value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
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

  ValueListenableBuilder<bool> _confirmPasswordTextField() {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureConfirmPassword,
      builder: (context, value, _) {
        return CustomTextField(
          controller: _confirmPasswordController,
          labelText: 'Confirm password',
          hintText: 'Confirm password',
          textInputType: TextInputType.visiblePassword,
          validator: (value) {
            final password = _passwordController.text.trim();
            final confirmPassword = value?.trim() ?? '';

            if (confirmPassword.isEmpty) {
              return 'Please confirm your password';
            }

            if (password != confirmPassword) {
              return 'Passwords do not match';
            }

            return null;
          },
          obscureText: value,
          suffixIcon: GestureDetector(
            onTap: () {
              _obscureConfirmPassword.value = !value;
            },
            child: Icon(
              value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              color: context.secondaryContainer,
              size: 22,
            ),
          ),
        );
      },
    );
  }

  // ------------------------------------------------------------
  // SIGN UP
  // ------------------------------------------------------------

  void _signUpRequest() {
    FocusScope.of(context).unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final fullName = _fullNameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneNumberController.text.trim();
    final password = _passwordController.text.trim();

    context.read<AuthBloc>().add(
      AuthSignUp(
        email: email,
        password: password,
        name: fullName,
        phone: phone.isNotEmpty ? phone : null,
        role: _userRole,
      ),
    );
  }
}
