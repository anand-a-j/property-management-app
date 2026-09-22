import 'package:flutter/material.dart';
import 'package:habitroot/core/extension/color_extension.dart';
import 'package:habitroot/core/theme/app_color_scheme.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/snackbar_manager.dart';
import '../../../../core/utils/url_launcher_utils.dart';

class FeedbackHighlightTile extends StatelessWidget {
  const FeedbackHighlightTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double largeRadius = 15;

    final borderRadius = BorderRadius.vertical(
      top: Radius.circular(largeRadius),
      bottom: Radius.circular(largeRadius),
    );

    return GestureDetector(
      onTap: () {
        _showRatingDialog(context);
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 2),
        color: AppColorScheme.feedbackPrimary,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          dense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          leading: const Icon(
            Icons.feedback_outlined,
            size: 32,
            color: AppColorScheme.feedbackOnPrimary,
            grade: 0,
          ),
          title: Text(
            "Help Shape HabitBud",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColorScheme.feedbackOnPrimary,
                  height: 1,
                ),
          ),
          subtitle: Text(
            "Share feedback and help improve the app",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColorScheme.feedbackOnPrimary,
                  height: 1,
                ),
          ),
        ),
      ),
    );
  }

  void _showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const _RatingDialogContent(),
    );
  }
}

// Separate StatefulWidget to handle the Star selection state efficiently
class _RatingDialogContent extends StatefulWidget {
  const _RatingDialogContent();

  @override
  State<_RatingDialogContent> createState() => _RatingDialogContentState();
}

class _RatingDialogContentState extends State<_RatingDialogContent> {
  int _rating = 0;

  void _handleSubmission() async {
    Navigator.of(context).pop(); // Close dialog first

    try {
      if (_rating == 5) {
       await UrlLauncherUtils.openUrl(
          AppConsts.playstoreUrl,
          forceWebView: false,
        );
      } else {
        // LOGIC: < 5 Stars -> Open Support Email
        await UrlLauncherUtils.openSupportEmail();
      }
    } catch (e) {
      Snack.error(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColorScheme.secondaryFixed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
            color: AppColorScheme.onSecondaryContainer, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Text(
              "Rate your experience",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            // Subtitle
            Text(
              "Do you like using HabitBud?",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: context.onPrimary.withValues(alpha: 0.7)
                  
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Star Rating Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Icon(
                      index < _rating
                          ? Icons.star_rounded
                          : Icons.star_outline_rounded,
                      color: index < _rating
                          ? Colors.amber
                          : AppColorScheme.onSecondaryContainer,
                      size: 36,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 32),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Not now",
                      style: TextStyle(
                        color: AppColorScheme.onPrimary.withOpacity(0.6),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _rating > 0 ? _handleSubmission : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColorScheme.primary,
                      foregroundColor:
                          AppColorScheme.secondary, // Text color on button
                      disabledBackgroundColor:
                          AppColorScheme.secondaryContainer,
                      disabledForegroundColor:
                          AppColorScheme.onPrimary.withOpacity(0.3),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
