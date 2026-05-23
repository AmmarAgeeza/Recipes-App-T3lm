import '../constants/app_import.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,

    this.width,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: AppSizes.buttonHeight,
      child: ElevatedButton(
        onPressed: !isLoading ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.primaryText,
          disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.6),
          disabledForegroundColor: AppColors.primaryText.withValues(alpha: 0.6),
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            vertical: AppSizes.buttonPaddingVertical,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusButton),
          ),
          textStyle: AppTextStyles.buttonText,
        ),
        child: isLoading
            ? const SizedBox(
                width: AppSizes.iconSizeMedium,
                height: AppSizes.iconSizeMedium,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.primaryText,
                  ),
                ),
              )
            : Text(text),
      ),
    );
  }
}
