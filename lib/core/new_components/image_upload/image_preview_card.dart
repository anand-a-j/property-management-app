import 'dart:io';

import 'package:flutter/material.dart';
import 'package:naseem/core/extension/common.dart';
import 'package:shimmer/shimmer.dart';

class ImagePreviewCard extends StatelessWidget {
  const ImagePreviewCard({
    super.key,
    required this.file,
    required this.title,
    required this.sizeText,
    this.isLoading = false,
    this.onDelete,
  });

  final File file;
  final String title;
  final String sizeText; // e.g., "65 KB"
  final VoidCallback? onDelete;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: context.secondaryContainer),
      ),
      child: isLoading
          ? const _ImagePreviewLoading()
          : Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    file,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: context.secondary.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.image,
                            color: context.secondary.withValues(alpha: 0.25),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                // Details
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: context.secondary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        sizeText,
                        style: TextStyle(
                          fontSize: 12,
                          color: context.secondaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
                // Only Delete Action
                if (onDelete != null)
                  IconButton(
                    onPressed: onDelete,
                    icon: const Icon(
                      Icons.delete_outline_rounded,
                      color: Colors.redAccent,
                    ),
                    visualDensity: VisualDensity.compact,
                  ),
              ],
            ),
    );
  }
}

class _ImagePreviewLoading extends StatelessWidget {
  const _ImagePreviewLoading();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.secondary.withValues(alpha: 0.1),
      highlightColor: context.secondary.withValues(alpha: 0.05),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 12,
                  width: double.infinity,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Container(height: 10, width: 80, color: Colors.white),
              ],
            ),
          ),

          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
