import '../../../../core/constants/app_import.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback? onTap;

  const LogoutButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFE2BFB8),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(9999),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 34,
          vertical: 18,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.logout,
              size: 18,
              color: AppColors.bodyText,
            ),
            const SizedBox(width: 8),
            const Text(
              AppStrings.logout,
              style: TextStyle(
                fontFamily: 'PublicSans',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 24 / 16,
                color: AppColors.bodyText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
