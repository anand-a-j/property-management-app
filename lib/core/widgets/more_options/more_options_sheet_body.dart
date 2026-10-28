import 'package:flutter/material.dart';

import '../custom_dialog.dart';
import 'more_option_item.dart';

class MoreOptionsSheetBody extends StatelessWidget {
  const MoreOptionsSheetBody({
    super.key,
    required this.items,
    this.title = 'More Options',
    this.subtitle,
  });

  final List<MoreOptionItem> items;
  final String title;
  final String? subtitle;

  Future<void> _handleAction(BuildContext context, MoreOptionItem item) async {
    if (!item.enabled) return;

    if (item.confirmTitle != null) {
      final confirmed = await CustomDialog.deleteConfirmationDialog(
        context: context,
        title: item.confirmTitle!,
        subTitle: item.confirmMessage ?? '',
        cancelTitle: 'Cancel',
        sumbitTitle: 'Confirm',
        isWarning: item.isDestructive,
      );

      if (confirmed != true || !context.mounted) return;
    }

    Navigator.pop(context);
    await item.onTap();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),

            if (subtitle != null) ...[
              const SizedBox(height: 4),
              Text(
                subtitle!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],

            const SizedBox(height: 12),

            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: items.length,
                separatorBuilder: (_, _) => const SizedBox(height: 4),
                itemBuilder: (context, index) {
                  final item = items[index];

                  final foregroundColor = item.isDestructive
                      ? colors.error
                      : colors.secondary;

                  return ListTile(
                    enabled: item.enabled,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    leading: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: item.isDestructive
                            ? colors.errorContainer
                            : colors.secondaryContainer,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(
                        item.icon,
                        color: item.isDestructive
                            ? colors.onErrorContainer
                            : colors.onSurfaceVariant,
                        size: 21,
                      ),
                    ),
                    title: Text(
                      item.title,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: foregroundColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: item.subtitle == null
                        ? null
                        : Text(item.subtitle!),
                    trailing: Icon(
                      Icons.chevron_right_rounded,
                      color: colors.onSurfaceVariant,
                    ),
                    onTap: item.enabled
                        ? () => _handleAction(context, item)
                        : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
