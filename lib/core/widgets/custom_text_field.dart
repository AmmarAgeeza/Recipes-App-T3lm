import '../constants/app_import.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.icon,
    this.obscureText = false,
    this.onVisibilityToggle,
    this.controller,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.showVisibilityToggle = false,
  });

  final String label;
  final String hint;
  final IconData? icon;
  final bool obscureText;
  final VoidCallback? onVisibilityToggle;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool showVisibilityToggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, top: AppSizes.inputLabelTop),
          child: Text(label, style: AppTextStyles.inputLabel),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: AppSizes.inputHeight,
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTextStyles.inputHint,
              contentPadding: EdgeInsets.symmetric(
                horizontal: icon != null ? 16 : 17,
                vertical: 19,
              ),
              filled: true,
              fillColor: AppColors.inputBackground,
              prefixIcon: icon != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 18, right: 8),
                      child: Icon(
                        icon,
                        size: AppSizes.iconSizeMedium,
                        color: AppColors.bodyText,
                      ),
                    )
                  : null,
              prefixIconConstraints: icon != null
                  ? BoxConstraints(
                      minWidth: 44,
                      maxHeight: AppSizes.iconSizeMedium,
                    )
                  : null,
              suffixIcon: showVisibilityToggle && onVisibilityToggle != null
                  ? GestureDetector(
                      onTap: onVisibilityToggle,
                      child: Icon(
                        obscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: AppSizes.iconSizeMedium,
                        color: AppColors.bodyText,
                      ),
                    )
                  : null,
              suffixIconConstraints: const BoxConstraints(
                minWidth: 40,
                maxWidth: 40,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusInput),
                borderSide: const BorderSide(
                  color: AppColors.inputBorder,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusInput),
                borderSide: const BorderSide(
                  color: AppColors.inputBorder,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusInput),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
