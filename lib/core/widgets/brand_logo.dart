import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_strings.dart';

class BrandLogo extends StatelessWidget {
  const BrandLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppStrings.appName,
          style: AppTextStyles.brandTitle,
        ),
        const SizedBox(height: 8),
        Text(
          AppStrings.appTagline,
          style: AppTextStyles.brandSubtitle,
        ),
      ],
    );
  }
}
