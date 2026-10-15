import 'package:flutter/material.dart';

import '../../../../core/enum/user_role.dart';

class SignUpFormController {
  final formKey = GlobalKey<FormState>();

  // Text controllers
  final fullNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emiratesIdController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // UI state
  final obscurePassword = ValueNotifier<bool>(true);
  final obscureConfirmPassword = ValueNotifier<bool>(true);

  // Selected staff role
  UserRole? selectedStaffRole;

  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  void dispose() {
    fullNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    emiratesIdController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    obscurePassword.dispose();
    obscureConfirmPassword.dispose();
  }
}
