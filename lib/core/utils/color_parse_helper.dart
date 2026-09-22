import 'package:flutter/material.dart';

class ColorParseHelper {
    /// HEX (RRGGBB) → Color
  static Color fromHex(String hex) {
    try {
      final cleanHex = hex.replaceAll('#', '').toUpperCase();
      return Color(int.parse("0xFF$cleanHex"));
    } catch (_) {
      return const Color(0xFFB22A2A); 
    }
  }

  /// Color → HEX (RRGGBB)
  static String toHex(Color color) {
    return (color.toARGB32() & 0xFFFFFF)
        .toRadixString(16)
        .padLeft(6, '0')
        .toUpperCase();
  }
}