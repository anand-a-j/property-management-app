# Naseem App Theme Design Context

## App

- App name: Naseem
- Platform: Flutter mobile-first Property Management MVP
- Font family: Inter

## Color Scheme

```dart
mixin AppColorScheme {
  static const Color primary = Color(0XFF0057FF);
  static const Color onPrimary = Color(0XFFFFFFFF);

  static const Color secondary = Color(0XFF100C08);
  static const Color secondaryContainer = Color(0XFFB7B7B7);

  static const Color error = Color(0XFFdc2b31);
  static const Color errorContainer = Color(0XFF7A1E0C);

  static const Color scaffoldBackgroundColor = Color(0XFFFFFFFF);
  static const Color surface = Color(0XFFB0B0B0);
}
Color Usage
primary: Primary interactive/action color.
onPrimary: Content displayed on the primary color.
secondary: Main dark text/content color.
secondaryContainer: Grey supporting container color.
error: Error state color.
errorContainer: Dark red error container color.
scaffoldBackgroundColor: White application background.
surface: Grey surface color.
Context Color Extension

Use the BuildContext color extension instead of directly accessing Theme.of(context).colorScheme throughout UI code.

Available extensions:

extension ColorHelper on BuildContext {
  Color get primary => colorScheme.primary;
  Color get onPrimary => colorScheme.onPrimary;
  Color get primaryContainer => colorScheme.primaryContainer;
  Color get onPrimaryContainer => colorScheme.onPrimaryContainer;

  Color get secondary => colorScheme.secondary;
  Color get secondaryFixed => colorScheme.secondaryFixed;
  Color get secondaryContainer => colorScheme.secondaryContainer;
  Color get onSecondary => colorScheme.onSecondary;
  Color get onSecondaryContainer => colorScheme.onSecondaryContainer;

  Color get error => colorScheme.error;
  Color get errorContainer => colorScheme.errorContainer;

  Color get surface => colorScheme.surface;
  Color get onSurface => colorScheme.onSurface;
}

Use:

context.primary
context.secondary
context.surface
context.error

instead of directly referencing AppColorScheme or Theme.of(context).colorScheme inside UI widgets where the context extension is available.

Theme
Light theme.
primaryColor: AppColorScheme.primary
scaffoldBackgroundColor: AppColorScheme.scaffoldBackgroundColor
fontFamily: Inter
Text Theme
titleLarge:
  fontSize: 24
  color: secondary
  fontWeight: FontWeight.w500

titleMedium:
  fontSize: 20
  color: secondary
  fontWeight: FontWeight.w500

titleSmall:
  fontSize: 18
  color: secondary
  fontWeight: FontWeight.w500

bodyLarge:
  fontSize: 16
  color: secondary
  fontWeight: FontWeight.w400

bodyMedium:
  fontSize: 14
  color: secondary
  fontWeight: FontWeight.w400

bodySmall:
  fontSize: 12
  color: secondary
  fontWeight: FontWeight.w400

labelLarge:
  fontSize: 10
  color: secondary
  fontWeight: FontWeight.w400

labelMedium:
  fontSize: 8
  color: secondary
  fontWeight: FontWeight.w400

labelSmall:
  fontSize: 6
  color: secondary
  fontWeight: FontWeight.w400
Context TextStyle Extension

Use the BuildContext text-style extension instead of directly accessing Theme.of(context).textTheme throughout UI code.

Available extensions:

extension TextStyleHelper on BuildContext {
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;
}

Use:

context.titleLarge
context.titleMedium
context.bodyMedium
context.bodySmall
context.labelLarge

instead of directly referencing Theme.of(context).textTheme inside UI widgets where the context extension is available.

Border Radius
rMicro = 6.0;
rMacro = 8.0;
rSmall = 10.0; // primary radius
rMedium = 12.0;
rCircle = 50.0;
Padding
pMicro = 5;
pSmall = 10;
pMedium = 15;
pSide = 20; // side padding
pLarge = 25;
pExtraLarge = 30;
pUltra = 35;
pUltraLarge = 40;
Primary Button

Component: CustomButton

Properties:

label
onPressed
padding
isLoading

Defaults:

padding = const EdgeInsets.all(0);
isLoading = false;

Use the application's primary color scheme for the primary button.

Text Field

Component: CustomTextField

Properties:

controller
focusNode
initialValue
enabled
readOnly
hintText
labelText
textInputType
obscureText
maxLines
maxLength
textAlign
validator
onChanged
suffix
suffixIcon
hideErrorText
isOnPrimary
contentPaddingBotttom
onTap

Defaults:

enabled = true;
readOnly = false;
textAlign = TextAlign.start;
hideErrorText = false;
isOnPrimary = true;
contentPaddingBotttom = 15;
App Bar

Component: CustomAppBar

Properties:

title
backgroundColor
actions
leadingOnTap
bottom
isAnimate
isTabContain
isSmallWidth

Defaults:

backgroundColor = AppColorScheme.scaffoldBackgroundColor;
isAnimate = false;
isTabContain = false;
isSmallWidth = false;
Design Context Rules
Use the existing color scheme.
Use Inter.
Use the existing text sizes and weights.
Use the existing border-radius values.
Use the existing padding values.
Use CustomButton, CustomTextField, and CustomAppBar when applicable.
Use BuildContext color extensions for colors.
Use BuildContext text-style extensions for text styles.
Do not directly access Theme.of(context).colorScheme when an available color extension can be used.
Do not directly access Theme.of(context).textTheme when an available text-style extension can be used.
Keep the visual language consistent across the Property Management MVP.
Do not introduce additional colors, typography scales, spacing systems, radius systems, or visual styles unless explicitly provided later.