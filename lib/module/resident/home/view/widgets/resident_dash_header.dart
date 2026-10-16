import 'package:flutter/material.dart';
import 'package:naseem/core/constants/assets.dart';

import '../../../../../core/core.dart';
import '../../../../../core/utils/string_utils.dart';
import '../../../../auth/core/controller/service/auth_service.dart';

class ResidentDashHeader extends StatelessWidget {
  const ResidentDashHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Assets.residentDashBg,
          height: 220,
          width: double.infinity,
          fit: BoxFit.cover,
          cacheHeight: 220,
        ),

        // White gradient overlay
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(255, 255, 255, 1.0),
                  Color.fromRGBO(255, 255, 255, 0.2),
                ],
              ),
            ),
          ),
        ),

        // Header content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 2,
            children: [
              const SizedBox(height: 15),
              Text(
                StrHelper.getGreeting(),
                style: context.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                authentication.profile?.name ?? "",
                style: context.titleMedium?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                "Home feels better here",
                style: context.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: context.secondary.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
