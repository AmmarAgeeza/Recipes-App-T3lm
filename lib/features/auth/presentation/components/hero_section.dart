import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/widgets/brand_logo.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.heroHeight,
      child: Stack(
        children: [
          // Hero Image Background
          Positioned.fill(
            child: Image.asset(
              AppImages.hero,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF2C3E50),
                        Color(0xFF34495E),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.overlay.withValues(alpha: 0.3),
                  AppColors.overlay.withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
          // Brand Logo
          const Center(
            child: BrandLogo(),
          ),
        ],
      ),
    );
  }
}
