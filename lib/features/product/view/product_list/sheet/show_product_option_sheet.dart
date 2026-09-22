import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../core/components/custom_dialog.dart';
import '../../../../../core/extension/common.dart';
import '../../../../../routes/router_path.dart';
import '../../../controller/provider/product_provider.dart';
import '../../../model/product.dart';
import '../widgets/product_card.dart';

void showProductOptionsSheet({
  required BuildContext context,
  required Product product,
}) {
  final rootContext = context;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (ctx) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// SAME CARD UI
              ProductListCard(product: product),

              const SizedBox(height: 20),

              /// BUTTONS
              Row(
                children: [
                  /// DELETE BUTTON
                  Expanded(
                    child: Consumer<ProductProvider>(
                      builder: (productContext, provider, _) {
                        return _OptionButton(
                          title: "Delete",
                          isDanger: true,
                          onTap: () async {
                            Navigator.pop(ctx);

                            await CustomDialog.confirmationDialog(
                              context: rootContext,
                              title: "",
                              subTitle:
                                  "Are you sure you want to delete this product?",
                              cancelTitle: "Cancel",
                              sumbitTitle: "Delete",
                              isWarning: true,
                              isLoading: provider.isDeleting,
                              cancelOnTap: () {
                                Navigator.pop(rootContext);
                              },
                              sumbitOnTap: () async {
                                final success = await rootContext
                                    .read<ProductProvider>()
                                    .deleteProduct(product);

                                if (success && rootContext.mounted) {
                                  Navigator.pop(rootContext);
                                }
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: _OptionButton(
                      title: "Edit",
                      onTap: () {
                        Navigator.pop(ctx);
                        if (product.id != null) {
                          context.push(
                            RouterPath.addEditProduct,
                            extra: product.id,
                          );
                        }
                      },
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

class _OptionButton extends StatelessWidget {
  const _OptionButton({this.isDanger = false, required this.title, this.onTap});

  final String title;
  final void Function()? onTap;

  final bool isDanger;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: isDanger ? context.error : context.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: context.bodyLarge?.copyWith(
              color: context.onPrimary,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
