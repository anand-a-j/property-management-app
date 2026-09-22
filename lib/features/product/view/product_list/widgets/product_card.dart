import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/debug_container.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/extension/common.dart';
import '../../../../../routes/router_path.dart';
import '../../../model/product.dart';
import '../sheet/show_product_option_sheet.dart';

class ProductListCard extends StatelessWidget {
  const ProductListCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppConsts.rSmall),
      onTap: () {
        if (product.id != null && product.id!.isNotEmpty) {
         showProductOptionsSheet(context: context, product: product);
        }
      },
      child: Container(
        height: 80,

        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(AppConsts.rSmall),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _PlanMenuImage(imageUrl: product.imageUrl ?? ""),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        product.name ?? "",
                        style: context.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "₹${product.salePrice ?? product.price}",
                            style: context.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: context.primary,
                              height: 1,
                            ),
                            children: (product.salePrice != null)
                                ? [
                                    TextSpan(
                                      text: " ",
                                      style: context.bodySmall?.copyWith(
                                        color: context.secondary.withValues(
                                          alpha: 0.65,
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                      text: product.price.toString(),
                                      style: context.bodySmall?.copyWith(
                                        color: context.secondary.withValues(
                                          alpha: 0.65,
                                        ),
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: context.secondary,
                                      ),
                                    ),
                                  ]
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanMenuImage extends StatelessWidget {
  const _PlanMenuImage({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: context.secondaryContainer,
            borderRadius: BorderRadius.circular(7),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        );
      },
      progressIndicatorBuilder: (context, url, progress) {
        return Shimmer.fromColors(
          baseColor: context.onPrimaryContainer,
          highlightColor: context.secondaryContainer,
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: context.secondaryContainer,
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          height: 80,
          width: 80,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: context.secondaryContainer,
            borderRadius: BorderRadius.circular(7),
          ),
          child: const Center(
            child: Icon(Icons.camera_alt_outlined, color: Colors.grey),
          ),
        );
      },
    );
  }
}
