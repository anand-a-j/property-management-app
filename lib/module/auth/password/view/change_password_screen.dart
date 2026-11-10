import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../../core/utils/input_vaildator.dart';
import '../../../../core/utils/snackbar_manager.dart';
import '../controller/bloc/change_password_bloc.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _newPasswordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final ValueNotifier<bool> _obscureNewPassword = ValueNotifier(true);
  final ValueNotifier<bool> _obscureConfirmPassword = ValueNotifier(true);

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _obscureNewPassword.dispose();
    _obscureConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordBloc, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          Snack.success('Password changed successfully');

          context.pop();
        } else if (state is ChangePasswordFailed) {
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
                      'Change Your\nPassword',
                      style: context.titleLarge?.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Create a new password for your account.',
                      style: context.bodySmall?.copyWith(color: Colors.grey),
                    ),

                    const SizedBox(height: 35),

                    _newPasswordTextField(),

                    const SizedBox(height: AppConsts.pSide),

                    _confirmPasswordTextField(),
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
                  label: 'Change Password',
                  isLoading: context.select<ChangePasswordBloc, bool>(
                    (bloc) => bloc.state is ChangePasswordLoading,
                  ),
                  onPressed: _changePasswordRequest,
                ),

                const SizedBox(height: AppConsts.pLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ValueListenableBuilder<bool> _newPasswordTextField() {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureNewPassword,
      builder: (context, value, _) {
        return CustomTextField(
          controller: _newPasswordController,
          labelText: 'New Password',
          hintText: 'New Password',
          textInputType: TextInputType.visiblePassword,
          validator: (value) => InputVaildator.password(value),
          obscureText: value,
          suffixIcon: GestureDetector(
            onTap: () {
              _obscureNewPassword.value = !value;
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

  ValueListenableBuilder<bool> _confirmPasswordTextField() {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureConfirmPassword,
      builder: (context, value, _) {
        return CustomTextField(
          controller: _confirmPasswordController,
          labelText: 'Confirm New Password',
          hintText: 'Confirm New Password',
          textInputType: TextInputType.visiblePassword,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please confirm your new password';
            }

            if (value != _newPasswordController.text) {
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

  void _changePasswordRequest() {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState?.validate() ?? false) {
      context.read<ChangePasswordBloc>().add(
        ChangePasswordSubmitted(
          newPassword: _newPasswordController.text.trim(),
        ),
      );
    }
  }
}
