class AppConsts {
  static bool isProd = false;

  static const String appName = "StoreRoot";

  // Border Radius
  static const double rMicro = 6.0;
  static const double rMacro = 8.0;
  static const double rSmall = 10.0;
  static const double rMedium = 12.0;
  static const double rCircle = 50.0;

  // Padding
  static const double pMicro = 5;
  static const double pSmall = 10;
  static const double pMedium = 15;
  static const double pSide = 20; // side padding
  static const double pLarge = 25;
  static const double pExtraLarge = 30;
  static const double pUltra = 35;
  static const double pUltraLarge = 40;

  static const String defaultHexColor = "b22a2a";

  // Contact support
  static const String appSupportEmail = "anandbuilds.app@gmail.com";
  static const privacyUrl = "https://storeroot.in/privacy";
  static const termsUrl = "https://storeroot.in/terms";

  // playstore url
  static const playstoreUrl = "";

  static const storeBaseUrl = "storeroot.in/";

  static getStoreLink(String slug) {
    return slug.isEmpty
        ? "https://$storeBaseUrl"
        : "https://$storeBaseUrl$slug";
  }

  // configs
  static const int allowedProductCount = 10;
}

// keys
const String themeModeKey = 'key_theme_mode';
const String weekStartKey = 'key_week_start';
const String habitCardModeKey = 'key_habit_card_mode';
const String onboardingCompleteKey = 'key_onboarding_complete';

const String firstInstallAtKey = 'firstInstallAt';
const String isEarlyUserKey = 'isEarlyUser';
