import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/core/components/core_components.dart';
import 'package:habitroot/core/new_components/custom_button.dart';
import 'package:habitroot/core/utils/input_vaildator.dart';
import 'package:habitroot/routes/router_path.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extension/common.dart';
import '../../../../core/new_components/custom_textformfield.dart';
import '../../controller/provider/auth_provider.dart';
import '../widgets/auth_navigation_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final ValueNotifier<bool> _obscurePassword = ValueNotifier(true);
  final ValueNotifier<bool> _obscureConfirmPassword = ValueNotifier(true);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _obscurePassword.dispose();
    _obscureConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();

    return FormScaffold(
      appBar: HabitRootAppBar(leadingOnTap: () => context.pop(), title: "Back"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                Text(
                  "Create Account",
                  style: context.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),

                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 20),
                  child: Text(
                    "Set up your store in seconds and start taking orders on WhatsApp.",
                    style: context.bodyMedium?.copyWith(
                      color: context.secondary.withValues(alpha: 0.5),
                      height: 1.4, // Better readability
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                CustomTextField(
                  controller: _emailController,
                  labelText: "Email",
                  hintText: "Enter your email",
                  textInputType: TextInputType.emailAddress,
                  validator: (v) => InputVaildator.email(v),
                ),

                const SizedBox(height: AppConsts.pSide),

                /// PASSWORD
                ValueListenableBuilder<bool>(
                  valueListenable: _obscurePassword,
                  builder: (context, value, _) {
                    return CustomTextField(
                      controller: _passwordController,
                      labelText: "Password",
                      hintText: "Enter password",
                      obscureText: value,
                      validator: (v) => InputVaildator.password(v),
                      suffixIcon: IconButton(
                        padding: const EdgeInsets.all(0),
                        icon: Icon(
                          value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_off_outlined,
                          color: context.secondaryContainer,
                        ),
                        onPressed: () => _obscurePassword.value = !value,
                      ),
                    );
                  },
                ),

                const SizedBox(height: AppConsts.pSide),

                ValueListenableBuilder<bool>(
                  valueListenable: _obscureConfirmPassword,
                  builder: (context, value, _) {
                    return CustomTextField(
                      controller: _confirmPasswordController,
                      labelText: "Confirm Password",
                      hintText: "Re-enter password",
                      obscureText: value,
                      validator: (v) => InputVaildator.confirmPassword(
                        v,
                        _passwordController.text,
                      ),
                      suffixIcon: IconButton(
                        padding: const EdgeInsets.all(0),
                        icon: Icon(
                          value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_off_outlined,
                          color: context.secondaryContainer,
                        ),
                        onPressed: () => _obscureConfirmPassword.value = !value,
                      ),
                    );
                  },
                ),

                const SizedBox(height: AppConsts.pMedium),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ColoredBox(
        color: context.onPrimary,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  label: "Create Account",
                  isLoading: provider.isLoading,
                  onPressed: () => _onSignUp(),
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

  Future<void> _onSignUp() async {
    FocusScope.of(context).unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) return;

    final provider = context.read<AuthProvider>();

    final success = await provider.signUp(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (success) {
      if (mounted) {
        context.go(RouterPath.createStoreSlug);
      }
    }
  }
}
