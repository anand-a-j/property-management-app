class OnboardingSlide {
  final String emoji;
  final String title;
  final String subtitle;

  const OnboardingSlide({
    required this.emoji,
    required this.title,
    required this.subtitle,
  });
}

const List<OnboardingSlide> onBoardingSlideData = [
  OnboardingSlide(
    emoji: "🎯",
    title: "Create Your Habits",
    subtitle:
        "Add small habits you want to build. Keep them simple and easy to start.",
  ),
  OnboardingSlide(
    emoji: "🔔",
    title: "Set Reminders",
    subtitle:
        "Gentle reminders to help you remember. No pressure, just support.",
  ),
  OnboardingSlide(
    emoji: "📈",
    title: "See Your Progress",
    subtitle:
        "Watch your progress grow over time. Missing a day won’t erase your effort.",
  ),
];
