import 'package:flutter/material.dart';
import 'package:naseem/core/core.dart';

import 'more_option_item.dart';
import 'more_options_sheet_body.dart';

class MoreOptionsBottomSheet {
  MoreOptionsBottomSheet._();

  static Future<void> show({
    required BuildContext context,
    required List<MoreOptionItem> items,
    String title = 'More Options',
    String? subtitle,
    bool showDragHandle = true,
    bool isDismissible = true,
  }) async {
    if (items.isEmpty) return;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible,
      showDragHandle: showDragHandle,
      backgroundColor: context.onPrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) =>
          MoreOptionsSheetBody(title: title, subtitle: subtitle, items: items,),
    );
  }
}
