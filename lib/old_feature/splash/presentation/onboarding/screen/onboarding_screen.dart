import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/core/constants/constants.dart';
import 'package:habitroot/core/extension/common.dart';

import '../../../../../routes/routes.dart';
import '../../../domain/onboarding_slide.dart';
import '../widgets/onboarding_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  bool get _isLastPage => _currentPage == onBoardingSlideData.length - 1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onButtonPressed() {
    HapticFeedback.mediumImpact();

    if (!_isLastPage) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      settings.put(onboardingCompleteKey, true);
      context.go('/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onBoardingSlideData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final slide = onBoardingSlideData[index];
                return OnboardingSlideView(
                  emoji: slide.emoji,
                  title: slide.title,
                  subtitle: slide.subtitle,
                );
              },
            ),
          ),

          // Dot Indicator
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onBoardingSlideData.length,
                (index) => DotIndicator(
                  isSelected: index == _currentPage,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: OnboardingButton(
        label: _isLastPage ? "Get Started" : "Continue",
        onPressed: _onButtonPressed,
      ),
    );
  }
}

// 3. The Single Slide View (Like your HabitEmptyView structure)
class OnboardingSlideView extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;

  const OnboardingSlideView({
    super.key,
    required this.emoji,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    // Note: I'm using default TextStyles for simplicity here.
    // Replace with your custom theme/context extensions (like context.bodyLarge)
    // if you have them defined.
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            emoji,
            style: const TextStyle(
              fontSize: 78,
            ),
          ),
          const SizedBox(height: 24),

          // 2. Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.bodyLarge?.copyWith(
              fontSize: 22,
              color: context.onPrimary,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: context.bodyMedium?.copyWith(
              color: context.onPrimary.withOpacity(0.7),
              height: 1.5,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

// 4. The Dot Indicator Widget
class DotIndicator extends StatelessWidget {
  final bool isSelected;

  const DotIndicator({
    super.key,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isSelected ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isSelected ? context.primary : context.onSecondaryContainer,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}


// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: const OnboardingBody(),
//       bottomNavigationBar: OnboardingButton(
//         label: "Continue",
//         onPressed: () {
//           HapticFeedback.mediumImpact();
//           settings.put(onboardingCompleteKey, true);
//           context.go('/dashboard');
//         },
//       ),
//     );
//   }
// }

// class OnboardingBody extends StatefulWidget {
//   const OnboardingBody({super.key});

//   @override
//   State<OnboardingBody> createState() => _OnboardingBodyState();
// }

// class _OnboardingBodyState extends State<OnboardingBody> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           // PageView handles the swipeable slides
//           child: PageView.builder(
//             controller: _pageController,
//             itemCount: onBoardingSlideData.length,
//             onPageChanged: (index) {
//               setState(() {
//                 _currentPage = index;
//               });
//             },
//             itemBuilder: (context, index) {
//               final slide = onBoardingSlideData[index];
//               return OnboardingSlideView(
//                 emoji: slide.emoji,
//                 title: slide.title,
//                 subtitle: slide.subtitle,
//               );
//             },
//           ),
//         ),

//         // Dots Indicator
//         Padding(
//           padding: const EdgeInsets.only(bottom: 24.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//               onBoardingSlideData.length,
//               (index) => DotIndicator(
//                 isSelected: index == _currentPage,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // 3. The Single Slide View (Like your HabitEmptyView structure)
// class OnboardingSlideView extends StatelessWidget {
//   final String emoji;
//   final String title;
//   final String subtitle;

//   const OnboardingSlideView({
//     super.key,
//     required this.emoji,
//     required this.title,
//     required this.subtitle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Note: I'm using default TextStyles for simplicity here.
//     // Replace with your custom theme/context extensions (like context.bodyLarge)
//     // if you have them defined.
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 32.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             emoji,
//             style: const TextStyle(
//               fontSize: 78,
//             ),
//           ),
//           const SizedBox(height: 24),

//           // 2. Title
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: context.bodyLarge?.copyWith(
//               fontSize: 22,
//               color: context.onPrimary,
//               fontWeight: FontWeight.bold,
//               height: 1.2,
//             ),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             subtitle,
//             textAlign: TextAlign.center,
//             style: context.bodyMedium?.copyWith(
//               color: context.onPrimary.withOpacity(0.7),
//               height: 1.5,
//               fontSize: 16,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // 4. The Dot Indicator Widget
// class DotIndicator extends StatelessWidget {
//   final bool isSelected;

//   const DotIndicator({
//     super.key,
//     required this.isSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       margin: const EdgeInsets.symmetric(horizontal: 4.0),
//       height: 8.0,
//       width: isSelected ? 24.0 : 8.0,
//       decoration: BoxDecoration(
//         color: isSelected ? context.primary : context.onSecondaryContainer,
//         borderRadius: BorderRadius.circular(4.0),
//       ),
//     );
//   }
// }








// Single page onboarding UI
// class OnboardingScreen extends StatelessWidget {
//   const OnboardingScreen({super.key});

//   final List<Map<String, dynamic>> features = const [
//     {
//       'emoji': '🧱',
//       'title':
//           'Check your habits with one tap so you stay aware and keep going every day.',
//       'highlights': ['one tap', 'keep going'],
//     },
//     {
//       'emoji': '🌱',
//       'title':
//           'Watch your progress grow, turning small steps into habits that feel good.',
//       'highlights': ['progress grow', 'feel good'],
//     },
//     {
//       'emoji': '🔔',
//       'title':
//           'Get calm nudges at the right time, so even on busy days you don’t lose track.',
//       'highlights': ['calm nudges', 'don’t lose track'],
//     },
//     {
//       'emoji': '📊',
//       'title':
//           'See clean charts and easy stats that show how far you’ve come with every small win.',
//       'highlights': ['clean charts', 'easy stats', 'small win'],
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black, // Dark/Black background for modern feel
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // // 2. Visual Hook (Placeholder for your graphic/image)
//               // Center(
//               //   child: Padding(
//               //       padding: EdgeInsets.symmetric(vertical: 40.0),
//               //       child: Image.asset(
//               //         "assets/icons/Group_1.png",
//               //       )
//               //       // SvgPicture.asset(
//               //       //   "assets/Group 1.png",
//               //       // )

//               //       //  Icon(
//               //       //   Icons
//               //       //       .park_rounded, // Use a placeholder icon for the "tree/growth" graphic
//               //       //   color: AppColorScheme.primary,
//               //       //   size: 150,
//               //       // ),
//               //       ),
//               // ),
//               const Spacer(),
//               Text(
//                 "🌱",
//                 style: TextStyle(fontSize: 92),
//               ),
//               const SizedBox(height: 22),
//               // 3. Headline
//               const Text(
//                 'Build small habits.\nGrow every day.',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 34,
//                   fontWeight: FontWeight.bold,
//                   height: 1.1,
//                 ),
//               ),
//               const SizedBox(height: 54),
//               // 4. Feature List
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 spacing: 20,
//                 children: features
//                     .map((feature) => OnboardingFeatureTile(
//                           icon: feature['emoji']!,
//                           title: feature['title']!,
//                           highlights: feature['highlights'],
//                         ))
//                     .toList(),
//               ),
//               const SizedBox(height: 34),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: OnboardingButton(
//         label: "Start Growing",
//         onPressed: () {
//           context.goNamed('dashboard-screen');
//         },
//       ),
//     );
//   }
// }

// // class OnboardingScreen extends StatelessWidget {
// //   const OnboardingScreen({super.key});
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Column(
// //            crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Column(
// //             mainAxisSize: MainAxisSize.min,
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             spacing: 15,
// //             children: [
// //              OnboardingFeatureTile(icon: "", title: title)
// //             ],
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }
