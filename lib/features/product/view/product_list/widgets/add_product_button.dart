import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/core/extension/color_extension.dart';
import 'package:habitroot/core/utils/snackbar_manager.dart';
import 'package:habitroot/features/product/controller/provider/product_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../routes/router_path.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    final productTotalCount = context.read<ProductProvider>().totalProductCount;
    return Material(
      color: context.primary,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: () {
          HapticFeedback.mediumImpact();

          /// 🚫 PRODUCT LIMIT CHECK
          if (productTotalCount >= AppConsts.allowedProductCount) {
            Snack.error(
              "You’ve reached the maximum limit of "
              "${AppConsts.allowedProductCount} products for this version. "
              "Please contact support for further assistance.",
            );

            return;
          }

          context.push(RouterPath.addEditProduct);
        },
        borderRadius: BorderRadius.circular(AppConsts.rCircle),
        child: Container(
          height: 48,
          width: 68,
          decoration: BoxDecoration(
            color: context.primary,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Icon(Icons.add, size: 24, color: context.onPrimary),
          ),
        ),
      ),
    );
  }
}
