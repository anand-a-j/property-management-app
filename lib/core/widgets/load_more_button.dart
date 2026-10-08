import 'package:flutter/material.dart';

class LoadMoreButton extends StatelessWidget {
  const LoadMoreButton({
    super.key,
    required this.onTap,
    this.isLoading = false,
    this.title = 'Load More',
  });

  final VoidCallback onTap;
  final bool isLoading;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Text(title),
      ),
    );
  }
}
