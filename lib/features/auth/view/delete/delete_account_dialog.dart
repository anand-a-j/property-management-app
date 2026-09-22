import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/extension/common.dart';
import '../../../../core/service/logout_service.dart';
import '../../../../routes/router_path.dart';
import '../../controller/provider/auth_provider.dart';

class DeleteAccountDialog extends StatefulWidget {
  const DeleteAccountDialog({super.key});

  @override
  State<DeleteAccountDialog> createState() => _DeleteAccountDialogState();
}

class _DeleteAccountDialogState extends State<DeleteAccountDialog> {
  final TextEditingController _controller = TextEditingController();

  bool get isValid => _controller.text.trim() == "DELETE";

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, _) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// 🔴 Title
                Text(
                  "Delete Account",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 10),

                /// ⚠️ Description
                Text(
                  "This will permanently delete your account, stores, products, and images.\n\nThis action cannot be undone.",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 16),

                /// ✍️ Input
                TextField(
                  controller: _controller,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: "Type DELETE to confirm",
                    hintStyle: context.bodyMedium?.copyWith(
                      color: context.secondary.withValues(alpha: 0.5),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// 🔘 Buttons
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 43,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: context.secondary.withValues(alpha: 0.35),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text("Cancel", style: context.bodyLarge),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: (!isValid || provider.isLoading)
                            ? null
                            : () async {
                                final success = await provider.deleteAccount();

                                if (success && context.mounted) {
                                  handleLogout(context);
                                  Navigator.pop(context);

                                  context.go(RouterPath.welcome);
                                }
                              },
                        child: Container(
                          height: 43,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: context.error,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: provider.isLoading
                                ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: context.onPrimary,
                                    ),
                                  )
                                : Text(
                                    "Delete",
                                    style: context.bodyLarge?.copyWith(
                                      color: context.onPrimary,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
