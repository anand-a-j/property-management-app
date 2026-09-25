import 'package:flutter/material.dart';
import 'package:naseem/core/extension/common.dart';

class CustomDialog {
  static void confirmationDialog({
    required BuildContext context,
    required String title,
    required String subTitle,
    required String cancelTitle,
    required String sumbitTitle,
    String? longButtonTitle,
    Function()? longButtonTap,
    required Function()? cancelOnTap,
    required Function()? sumbitOnTap,
    bool isLoading = false,
    bool isWarning = false,
    bool isDislikesDialog = false,
    bool isFromPayment = false,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      builder: (childContext) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 25,
              bottom: 15,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (title.isNotEmpty) ...[
                  Text(
                    title,
                    style: childContext.headlineSmall?.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 3),
                ],
                Text(
                  subTitle,
                  style: childContext.bodyLarge?.copyWith(
                    color: childContext.secondary,
                  ),
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: cancelOnTap,
                        child: Container(
                          height: 43,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: childContext.secondary.withValues(
                                alpha: 0.35,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              cancelTitle,
                              style: childContext.bodyLarge,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: sumbitOnTap,
                        child: Container(
                          height: 43,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: isWarning
                                ? childContext.error
                                : childContext.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: isLoading
                                ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: childContext.onPrimary,
                                    ),
                                  )
                                : Text(
                                    sumbitTitle,
                                    style: childContext.bodyLarge?.copyWith(
                                      color: childContext.onPrimary,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (longButtonTitle != null && longButtonTitle.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: longButtonTap,
                    child: Container(
                      height: 43,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: childContext.secondary.withValues(alpha: 0.35),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          longButtonTitle,
                          style: childContext.bodyLarge,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
