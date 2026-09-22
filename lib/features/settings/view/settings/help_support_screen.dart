import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitroot/core/constants/app_constants.dart';
import 'package:habitroot/core/new_components/custom_button.dart';
import 'package:habitroot/core/new_components/habitroot_appbar.dart';

import '../../../../core/extension/common.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  final List<Map<String, String>> faqs = [
    {
      "q": "How do I share my store link?",
      "a":
          "Go to your Dashboard and click the 'Share' button. You can send the link directly to your customers on WhatsApp.",
    },
    {
      "q": "How do I receive orders?",
      "a":
          "When a customer clicks 'Order' on your shop link, you will get a ready-made message in your WhatsApp chat with all their details.",
    },
    {
      "q": "Is there any limit on products?",
      "a": "No, you can add as many products as you like to your store.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HabitRootAppBar(
        leadingOnTap: () => context.pop(),
        title: "Help & Support",
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: faqs.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              backgroundColor: context.primary.withOpacity(0.05),
              collapsedBackgroundColor: context.primary.withOpacity(0.05),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              iconColor: context.primary,
              collapsedIconColor: context.primary,
              tilePadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4,
              ),
              title: Text(faqs[index]['q']!, style: context.bodyLarge),
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: Text(
                    faqs[index]['a']!,
                    style: TextStyle(
                      color: context.secondary.withOpacity(0.7),
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConsts.pSide),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
       
              Text.rich(
                TextSpan(
                  text: "Still have questions? ",
                  style: context.bodyMedium?.copyWith(color: Colors.black54),
                  children: [
                    TextSpan(
                      text: "We are here to help!",
                      style: context.bodyMedium?.copyWith(
                        color: context.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // High-action button
              CustomButton(
                label: "Message us on WhatsApp",
                // Add an icon if your CustomButton supports it
                onPressed: () {
                  // Your WhatsApp Logic
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
