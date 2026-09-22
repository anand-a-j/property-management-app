import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/core/constants/app_constants.dart';
import 'package:habitroot/core/extension/common.dart';

import '../../../../core/components/custom_dialog.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "title": "Start your store today",
      "desc":
          "Set up your own online shop in just 30 seconds. It is very easy to use.",
      "icon": "📱",
    },
    {
      "title": "Showcase your work",
      "desc":
          "Add all your items in one place. Your customers can see everything you sell in one click.",
      "icon": "🛍️",
    },
    {
      "title": "Get orders on WhatsApp",
      "desc":
          "Stop the chat confusion. Receive clear, ready-made orders directly in your WhatsApp messages.",
      "icon": "💬",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        CustomDialog.confirmationDialog(
          context: context,
          title: "Exit App",
          subTitle: "Are you sure you want to leave the app?",
          cancelTitle: "Stay",
          sumbitTitle: "Exit",
          cancelOnTap: () => Navigator.pop(context),
          sumbitOnTap: () {
            Navigator.pop(context);
            SystemNavigator.pop();
          },
        );
      },
      child: Scaffold(
        backgroundColor: context.primary,
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (v) => setState(() => _currentPage = v),
                itemCount: _onboardingData.length,
                itemBuilder: (context, index) => OnboardingContent(
                  title: _onboardingData[index]['title']!,
                  desc: _onboardingData[index]['desc']!,
                  emoji: _onboardingData[index]['icon']!,
                ),
              ),
            ),
            // Page Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _onboardingData.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(right: 5),
                  height: 6,
                  width: _currentPage == index ? 20 : 6,
                  decoration: BoxDecoration(
                    color: context.onPrimary.withOpacity(
                      _currentPage == index ? 1 : 0.4,
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
        bottomNavigationBar: ColoredBox(
          color: context.primary,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppConsts.pSide),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 12,
                children: [
                  _WelcomeButton(
                    label: "Let's get started",
                    onPressed: () {
                      context.push('/signup');
                    },
                  ),

                  _WelcomeButton(
                    label: "Login to existing store",
                    isOutlined: true,
                    onPressed: () {
                      context.push('/signin');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _WelcomeButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isOutlined;

  const _WelcomeButton({
    required this.label,
    required this.onPressed,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined
              ? Colors.transparent
              : Theme.of(context).colorScheme.onPrimary,
          foregroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: () {
          HapticFeedback.lightImpact();
          onPressed();
        },
        child: Center(
          child: Text(
            label,
            style: context.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: isOutlined ? context.onPrimary : context.primary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String title, desc, emoji;

  const OnboardingContent({
    super.key,
    required this.title,
    required this.desc,
    required this.emoji,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 80)),
          const SizedBox(height: 40),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
