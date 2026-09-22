import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:habitroot/core/extension/common.dart';

Future<Emoji?> showEmojiPickerSheet(BuildContext context) async {
  return await showModalBottomSheet<Emoji>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      final double height = MediaQuery.sizeOf(context).height * 0.45;
      final TextEditingController controller = TextEditingController();
      final ScrollController scrollController = ScrollController();

      return Container(
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: EmojiPicker(
          textEditingController: controller,
          scrollController: scrollController,
          onEmojiSelected: (category, emoji) {
            Navigator.pop(context, emoji);
            controller.dispose();
            scrollController.dispose();
          },
          config: Config(
            height: height,
            checkPlatformCompatibility: true,
            viewOrderConfig: const ViewOrderConfig(
              bottom: EmojiPickerItem.searchBar,
              top: EmojiPickerItem.categoryBar,
            ),
            emojiViewConfig: EmojiViewConfig(
              emojiSizeMax: 28 *
                  (defaultTargetPlatform == TargetPlatform.iOS ? 1.2 : 1.0),
              backgroundColor: context.onSecondary,
            ),
            skinToneConfig: const SkinToneConfig(),
            categoryViewConfig: CategoryViewConfig(
              backgroundColor: context.onSecondary,
              iconColor: context.onPrimary.withValues(alpha: 0.5),
              iconColorSelected: context.primary,
              indicatorColor: context.primary,
            ),
            bottomActionBarConfig: BottomActionBarConfig(
              enabled: false,
              backgroundColor: context.onSecondary,
              // buttonColor: context.onPrimary,
            ),
          ),
        ),
      );
    },
  );
}
