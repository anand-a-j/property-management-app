import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/core/new_components/danger_outline_button.dart';
import 'package:provider/provider.dart';

import '../../../core/components/core_components.dart';
import '../../../core/constants/constants.dart';
import '../../../core/extension/common.dart';
import '../../../core/new_components/custom_button.dart';
import '../../../core/new_components/custom_textformfield.dart';
import '../../../core/utils/input_vaildator.dart';
import '../../../core/utils/snackbar_manager.dart' show Snack;
import '../../auth/view/delete/delete_account_dialog.dart';
import '../controller/provider/user_provider.dart';

class EditMyProfileScreen extends StatefulWidget {
  const EditMyProfileScreen({super.key});

  @override
  State<EditMyProfileScreen> createState() => _EditMyProfileScreenState();
}

class _EditMyProfileScreenState extends State<EditMyProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final user = context.read<UserProvider>().user;

    _nameController.text = user?.name ?? "";
    _emailController.text = user?.email ?? "";
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();

    return FormScaffold(
      appBar: HabitRootAppBar(
        title: "Edit Profile",
        leadingOnTap: () => context.pop(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              Text(
                "Profile",
                style: context.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),

              Padding(
                padding: const EdgeInsetsDirectional.only(end: 20),
                child: Text(
                  "Manage your account information and keep your profile up to date.",
                  style: context.bodyMedium?.copyWith(
                    color: context.secondary.withValues(alpha: 0.5),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              /// NAME
              CustomTextField(
                controller: _nameController,

                labelText: "Name",
                hintText: "Enter your name",
                validator: (v) =>
                    v == null || v.isEmpty ? "Name required" : null,
              ),

              const SizedBox(height: AppConsts.pSide),

              /// EMAIL
              CustomTextField(
                controller: _emailController,
                labelText: "Email",
                hintText: "Enter your email",
                textInputType: TextInputType.emailAddress,
                validator: (v) => InputVaildator.email(v),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(AppConsts.pSide),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 20,

            children: [
              CustomButton(
                label: "Save Changes",

                isLoading: provider.isLoading,
                onPressed: _onSave,
              ),
              DangerOutlinedButton(
                label: "Delete Your Account",
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => const DeleteAccountDialog(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onSave() async {
    FocusScope.of(context).unfocus();

    if (!(_formKey.currentState?.validate() ?? false)) return;

    final provider = context.read<UserProvider>();

    final success = await provider.updateProfile(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
    );

    if (success) {
      Snack.success("Profile updated");
      context.pop();
    }
  }
}
