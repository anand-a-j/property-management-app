import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/routes/args/create_store_args.dart';
import 'package:habitroot/routes/router_path.dart';
import 'package:provider/provider.dart';

import '../../../core/components/core_components.dart';
import '../../../core/constants/constants.dart';
import '../../../core/extension/common.dart';
import '../../../core/new_components/custom_button.dart';
import '../../../core/utils/snackbar_manager.dart';
import '../controller/provider/store_provider.dart';

class CreateStoreSlugScreen extends StatefulWidget {
  const CreateStoreSlugScreen({super.key});

  @override
  State<CreateStoreSlugScreen> createState() => _CreateStoreSlugScreenState();
}

class _CreateStoreSlugScreenState extends State<CreateStoreSlugScreen> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StoreProvider>();

    return FormScaffold(
      appBar: HabitRootAppBar(
        title: "Store Link",
        leadingOnTap: () => context.pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConsts.pSide),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            Text(
              "Claim your link",
              style: context.headlineSmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),

            Padding(
              padding: const EdgeInsetsDirectional.only(end: 20),
              child: Text(
                "This is the unique web link your customers will use to browse and order from your shop.",
                style: context.bodyMedium?.copyWith(
                  color: context.secondary.withValues(alpha: 0.5),
                  height: 1.4, // Better readability
                ),
              ),
            ),

            const SizedBox(height: 32),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(
                    "storelnk.in/",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Text(
              "Example: storelnk.in/fashionhub",
              style: TextStyle(color: context.secondaryContainer),
            ),
          ],
        ),
      ),

      bottomNavigationBar: ColoredBox(
        color: context.onPrimary,
        child: SafeArea(
          child: CustomButton(
            label: "Continue",
            padding: const EdgeInsetsGeometry.all(AppConsts.pSide),
            isLoading: provider.isLoading,
            onPressed: _onContinue,
          ),
        ),
      ),
    );
  }

  Future<void> _onContinue() async {
    final slug = _controller.text.trim();

    if (slug.isEmpty) {
      Snack.error("Enter store name");
      return;
    }

    final provider = context.read<StoreProvider>();

    final available = await provider.checkSlug(slug);

    if (!available) return;

    /// ✅ go to next screen
    if (mounted) {
      final args = CreateStoreArgs(slug: slug);
      context.go(RouterPath.createStore, extra: args);
    }
  }
}
