import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:naseem/core/utils/snackbar_manager.dart';

import '../../../../../core/core.dart';
import '../../../../../core/enum/user_role.dart';
import '../../../../../core/utils/input_vaildator.dart';
import '../../../../../routes/router_path.dart';
import '../../../core/controller/bloc/auth_bloc.dart';
import '../../../core/controller/bloc/auth_event.dart';
import '../../../core/controller/bloc/auth_state.dart';
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
    _obscurePassword.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          // TODO:

          if (state.profile?.role != null) {
            switch (state.profile!.role) {
              case UserRole.platformAdmin:
                context.go(RouterPath.platformDashboard);
                break;

              case UserRole.manager:
                context.go(RouterPath.adminHome);
                break;

              case UserRole.resident:
                break;

              case UserRole.security:
                break;

              case UserRole.maintenance:
                break;
            }
          } else {
            Snack.error("User role not available please contact admin");
          }
        } else if (state is AuthFailed) {
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
                      'Sign in to your\nAccount',
                      style: context.titleLarge?.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),
                    Text(
                      'Enter your email and password to log in ',
                      style: context.bodySmall?.copyWith(color: Colors.grey),
                    ),

                    const SizedBox(height: 35),

                    _emailTextField(),

                    const SizedBox(height: AppConsts.pSide),

                    _passwordTextField(),
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
                  label: 'Sign in',
                  isLoading: context.select<AuthBloc, bool>(
                    (bloc) => bloc.state is AuthLoading,
                  ),
                  onPressed: _signInRequest,
                ),

                const SizedBox(height: AppConsts.pMedium),

                const AuthNavigationText(),
                const SizedBox(height: AppConsts.pLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }

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

  CustomTextField _emailTextField() {
    return CustomTextField(
      controller: _emailController,
      textInputType: TextInputType.emailAddress,
      labelText: 'Email',
      hintText: 'Email',
      validator: (value) => InputVaildator.email(value),
    );
  }

  void _signInRequest() {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState?.validate() ?? false) {
      final phone = _emailController.text.trim();
      final password = _passwordController.text.trim();

      context.read<AuthBloc>().add(
        AuthSignIn(email: phone, password: password),
      );
    }
  }
}
