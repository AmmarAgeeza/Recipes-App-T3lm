import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String fontFamily = 'PublicSans';

  // Brand Title
  static const TextStyle brandTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 34 / 28,
    letterSpacing: -0.7,
    color: Colors.white,
   
  );

  // Brand Subtitle
  static const TextStyle brandSubtitle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 16 / 12,
    letterSpacing: 1.2,
    color: Color(0xE6FFFFFF), // rgba(255,255,255,0.9)
   
  );

  // Heading
  static const TextStyle heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 32 / 24,
    color: AppColors.headingText,
   
  );

  // Body
  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    color: AppColors.bodyText,
   
  );

  // Input Label
  static const TextStyle inputLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
    letterSpacing: 0.14,
    color: AppColors.bodyText,
   
  );

  // Input Text
  static const TextStyle inputText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.0,
    color: AppColors.bodyText,
   
  );

  // Input Hint
  static const TextStyle inputHint = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.0,
    color: AppColors.inputHint,
   
  );

  // Button Text
  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    color: AppColors.primaryText,
   
  );

  // Link Text
  static const TextStyle linkText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
    letterSpacing: 0.14,
    color: AppColors.link,
   
  );

  // Sign Up Link Text
  static const TextStyle signUpLinkText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
    letterSpacing: 0.14,
    color: AppColors.signUpLink,
   
  );

  // Section Heading (Profile)
  static const TextStyle sectionHeading = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
    letterSpacing: 0.7,
    color: AppColors.link,
   
  );
}
