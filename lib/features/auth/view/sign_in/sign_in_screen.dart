import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/features/user/controller/provider/user_provider.dart';
import 'package:habitroot/routes/router_path.dart';
import 'package:provider/provider.dart';

import '../../../../core/components/core_components.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/extension/common.dart';
import '../../../../core/new_components/custom_button.dart';
import '../../../../core/new_components/custom_textformfield.dart';
import '../../../../core/utils/input_vaildator.dart';
import '../../../store/controller/provider/store_provider.dart';
import '../../controller/provider/auth_provider.dart';
import '../widgets/auth_navigation_text.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final ValueNotifier<bool> _obscurePassword = ValueNotifier(true);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _obscurePassword.dispose();
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
                  "Welcome Back",
                  style: context.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),

                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 20),
                  child: Text(
                    "Log in to manage your products and check your latest WhatsApp orders.",
                    style: context.bodyMedium?.copyWith(
                      color: context.secondary.withValues(alpha: 0.5),
                      height: 1.4, // Better readability
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                /// EMAIL
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
                      key: const ValueKey("password_field"),
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
                  label: "Sign In",
                  isLoading: provider.isLoading,
                  onPressed: () => _onSignIn(),
                ),
                const SizedBox(height: AppConsts.pMedium),
                const AuthNavigationText(isFromSignInScreen: true),
                const SizedBox(height: AppConsts.pLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onSignIn() async {
    FocusScope.of(context).unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) return;

    final provider = context.read<AuthProvider>();

    final success = await provider.signIn(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (success) {
      // 👉 Navigate to dashboard (or check store exists)
      if (mounted) {
        context.read<UserProvider>().loadUserInitial();
        context.read<StoreProvider>().loadStore();
        context.go(RouterPath.home);
      }
    }
  }
}
