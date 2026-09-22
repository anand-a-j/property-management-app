import 'package:flutter/material.dart';
import 'package:habitroot/core/extension/common.dart';

class LoadMoreButton extends StatelessWidget {
  const LoadMoreButton({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
            borderRadius: BorderRadius.circular(6),
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.transparent,
          border: Border.all(width: 1, color: context.secondaryContainer),
        ),
        child: Center(
          child: Text("Load More", style: context.bodyMedium?.copyWith()),
        ),
      ),
    );
  }
}
