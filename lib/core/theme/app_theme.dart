import 'package:flutter/material.dart';
import 'package:naseem/core/constants/constants.dart';

import 'app_color_scheme.dart';

class AppThemes with AppColorScheme {
  static ThemeData lightThemeData(BuildContext context) => ThemeData(
    primaryColor: AppColorScheme.primary,
    scaffoldBackgroundColor: AppColorScheme.scaffoldBackgroundColor,
    colorScheme: const ColorScheme.light(
      primary: AppColorScheme.primary,
      onPrimary: AppColorScheme.onPrimary,

      secondary: AppColorScheme.secondary,

      secondaryContainer: AppColorScheme.secondaryContainer,
      surface: AppColorScheme.surface,
      error: AppColorScheme.error,
      errorContainer: AppColorScheme.errorContainer,
    ),
    fontFamily: "Inter",
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        color: AppColorScheme.secondary,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        color: AppColorScheme.secondary,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        color: AppColorScheme.secondary,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: AppColorScheme.secondary,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColorScheme.secondary,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: AppColorScheme.secondary,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: 10,
        color: AppColorScheme.secondary,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        fontSize: 8,
        color: AppColorScheme.secondary,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        fontSize: 6,
        color: AppColorScheme.secondary,
        fontWeight: FontWeight.w400,
      ),
    ),
     // DATE PICKER THEME
  datePickerTheme: DatePickerThemeData(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.transparent,

    headerBackgroundColor: AppColorScheme.primary,
    headerForegroundColor: Colors.white,

    weekdayStyle: const TextStyle(
      color: Colors.black54,
    ),

    dayForegroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      }
      if (states.contains(WidgetState.disabled)) {
        return Colors.grey.shade400;
      }
      return Colors.black87;
    }),

    dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColorScheme.primary;
      }
      return Colors.transparent;
    }),

    todayForegroundColor: const WidgetStatePropertyAll(
      AppColorScheme.primary,
    ),

    todayBorder: const BorderSide(
      color: AppColorScheme.primary,
    ),

    cancelButtonStyle: TextButton.styleFrom(
      foregroundColor: AppColorScheme.primary,
    ),

    confirmButtonStyle: TextButton.styleFrom(
      foregroundColor: AppColorScheme.primary,
    ),
  ),

  // TIME PICKER THEME
  timePickerTheme: TimePickerThemeData(
    backgroundColor: Colors.white,
    dialBackgroundColor: const Color(0xFFF0F4FF),
    dialHandColor: AppColorScheme.primary,
    dialTextColor: AppColorScheme.secondary,

    hourMinuteColor: const Color(0xFFF0F4FF),
    hourMinuteTextColor: AppColorScheme.secondary,

    dayPeriodColor: const Color(0xFFE8EEFF),
    dayPeriodTextColor: AppColorScheme.primary,

    entryModeIconColor: AppColorScheme.primary,
    helpTextStyle: const TextStyle(
      color: Colors.black54,
    ),

    cancelButtonStyle: TextButton.styleFrom(
      foregroundColor: AppColorScheme.primary,
    ),

    confirmButtonStyle: TextButton.styleFrom(
      foregroundColor: AppColorScheme.primary,
    ),
  ),
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0.0,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColorScheme.secondary,
        grade: -25,
        weight: 100,
      ),
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColorScheme.secondary,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColorScheme.primary),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConsts.rSmall),
          ),
        ),
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.pressed)) {
            return AppColorScheme.primary.withValues(alpha: 0.5);
          }
          return null;
        }),
        splashFactory: InkRipple.splashFactory,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColorScheme.onPrimary,
      // weight: 100,
      // grade: -25,
    ),
    tabBarTheme: const TabBarThemeData(
      labelColor: AppColorScheme.primary,
      unselectedLabelColor: AppColorScheme.secondaryContainer,

      labelStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),

      unselectedLabelStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),

      indicatorColor: AppColorScheme.primary,

      indicatorSize: TabBarIndicatorSize.label,

      dividerColor: AppColorScheme.surface,
    ),
  );
}
