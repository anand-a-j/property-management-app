import 'package:flutter/material.dart';

mixin AppColorScheme {
  static const Color primary = Color(0XFF007450);
  static const Color logoPrimary = Color(0xff44D62C);
  static const Color onPrimary = Color(0XFFFFFFFF); // onPrimary
  static const Color primaryContainer = Color(0XFF9b6c0d); // primary border
  static const Color onPrimaryContainer = Color(0XFFF5F5F5); // white variant

  static const Color secondary = Color(0XFF100C08); // Black
  static const Color secondaryContainer = Color(0XFFB7B7B7); // Grey

  static const Color error = Color(0XFFdc2b31); // Red
  static const Color errorContainer = Color(0XFF7A1E0C); // dark red

  static const Color scaffoldBackgroundColor = Color(0XFFFFFFFF); // Pure Black

  static const Color secondaryFixed = Color(0xff18181b); // black varaint
  static const Color onSecondary = Color(0XFF0F0F0F); // Black variant
  static const Color onSecondaryContainer = Color(
    0XFF3D3D3D,
  ); // for border stoke

  static const Color surface = Color(0XFFB0B0B0);

  static const Color primaryTouchEffect = Color(0XFF56d276);

  static const Color premiumPrimary = Color(0XFFFECD04);
  static const Color premiumOnPrimary = Color(0XFF8A4001);

  // 1. Background: Deep Forest Green (Blends well with pure black)
  static const Color feedbackPrimary = Color(0xFF132A18);

  // 2. Content: Your Primary Sage Green (Makes it pop/glow)
  static const Color feedbackOnPrimary = Color(0xFF44d62c);

  /// Preset colors for habit selection (used in habit creation UI)
  /// Carefully curated for readability on white backgrounds
  /// and long-term daily usage (no harsh neon colors).
  static const List<Color> habitColorOptions = [
    Color(0xFF00C853), // 18. Emerald Green (Mint darkened)
    // --- WARM HUES: REDS, PINKS, & MAGENTAS (5) ---
    Color(0xFFFF5252), // 1. Vibrant Red
    Color(0xFFFF6D00), // 2. Deep Sunset Orange
    Color(0xFFF50057), // 3. Deep Hot Pink
    Color(0xFFE040FB), // 4. Bright Magenta
    Color(0xFF7C4DFF), // 5. Electric Violet
    // --- PURPLES & LAVENDERS (3) ---
    Color(0xFF651FFF), // 6. Deep Purple Punch
    Color(0xFF9C27B0), // 7. Strong Purple
    Color(0xFF9575CD), // 8. Deep Lavender (Darkened for white text)
    // --- COOL HUES: BLUES & CYANS (5) ---
    Color(0xFF2962FF), // 9. Deep Electric Blue
    Color(0xFF448AFF), // 10. Electric Blue
    Color(0xFF0288D1), // 11. Rich Sky Blue (Darkened slightly)
    Color(0xFF0097A7), // 12. Deep Aqua (Darkened)
    Color(0xFF00ACC1), // 13. [UPDATED] Rich Cyan Teal (Replaces Soft Cyan)
    // --- EARTH & GROWTH: GREENS & TEALS (6) ---
    Color(0xFF00897B), // 14. Deep Teal
    Color(0xFF00BCD4), // 15. Bright Teal
    Color(0xFF43A047), // 16. Forest Green (Standard Green darkened)
    Color(0xFF7CB342), // 17. Olive Green (Lime darkened)

    Color(0xFF2E7D32), // 19. [UPDATED] Jungle Green (Replaces Spring Green)
    // --- WARM ACCENTS: YELLOWS & ORANGES (3) ---
    Color(0xFFF57C00), // 20. Deep Orange
    Color(0xFFFFA000), // 21. [UPDATED] Amber Gold (Replaces Vibrant Gold)
    Color(0xFFFF8F00), // 22. Deep Amber
    // --- NEUTRAL ACCENT (1) ---
    Color(0xFFA1887F), // 23. Brownish Rose (Darkened Dusty Rose)
    // --- SOFT BLUE ACCENT (1) ---
    Color(0xFF7986CB), // 24. Indigo (Darkened Lavender Blue)
    // --- NEW ADDITIONS (2) ---
    Color(0xFF546E7A), // 25. Slate Blue (Focus / Work habits)
    Color(0xFF558B2F), // 26. Dark Olive (Consistency / Health)
  ];
}
