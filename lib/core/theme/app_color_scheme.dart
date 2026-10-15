import 'package:flutter/material.dart';

mixin AppColorScheme {
  static const Color primary = Color(0XFF0057FF);

  static const Color onPrimary = Color(0XFFFFFFFF); // onPrimary

  static const Color secondary = Color(0XFF100C08); // Black
  static const Color secondaryContainer = Color(0XFFB7B7B7); // Grey

  static const Color error = Color(0XFFdc2b31); // Red
  static const Color errorContainer = Color(0XFF7A1E0C); // dark red

  static const Color scaffoldBackgroundColor = Color(0XFFFFFFFF); // Pure Black

  static const Color surface = Color(0XFFB0B0B0);

  // Platform Admin
  static const Color platformAdminAppBar = Color(0xff0D0D1B);

  static const Color primaryFixed = Color(0xff4F5962);

  static const List<Color> _palette = [
    Color(0xFF8D6E63), // Warm brown
    Color(0xFF78909C), // Muted blue-grey
    Color(0xFF9A8067), // Soft taupe
    Color(0xFF7D8B72), // Muted sage
    Color(0xFFAA8585), // Dusty rose
    Color(0xFF8A83A8), // Muted lavender
  ];

  /// Stable avatar icon color based on list index.
  static Color iconColor(int index) {
    return _palette[index.abs() % _palette.length];
  }

  /// Soft background derived from the same palette color.
  static Color backgroundColor(int index) {
    return Color.alphaBlend(
      iconColor(index).withValues(alpha: 0.14),
      Colors.white,
    );
  }
}
