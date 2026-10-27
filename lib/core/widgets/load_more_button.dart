import 'package:flutter/material.dart';
import 'package:naseem/core/core.dart';

class LoadMoreButton extends StatelessWidget {
  const LoadMoreButton({
    super.key,
    required this.onTap,
    this.isLoading = false,
    this.isError = false,
    this.title = 'Load More',
  });

  final VoidCallback onTap;
  final bool isLoading;
  final bool isError;
  final String title;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final foregroundColor = isError ? colorScheme.error : colorScheme.primary;

    final borderColor = isError
        ? colorScheme.error.withValues(alpha: 0.35)
        : colorScheme.outline.withValues(alpha: 0.35);

    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 30),
      child: Center(
        child: GestureDetector(
          onTap: isLoading ? null : onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeInOut,
            constraints: const BoxConstraints(minWidth: 140, minHeight: 42),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: context.onPrimary,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: borderColor),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 180),
              child: isLoading
                  ? SizedBox(
                      key: const ValueKey('loading'),
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: foregroundColor,
                      ),
                    )
                  : Row(
                      key: ValueKey(isError ? 'retry' : 'load-more'),
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isError
                              ? Icons.refresh_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          size: 20,
                          color: foregroundColor,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          isError ? 'Retry' : title,
                          style: TextStyle(
                            color: foregroundColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
