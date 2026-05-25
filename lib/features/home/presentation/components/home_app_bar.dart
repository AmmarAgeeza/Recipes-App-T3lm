import '../../../../core/constants/app_import.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xCCF8F9FF),
      elevation: 0,
      title: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, AppRoutes.profile),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0x1AB12C16), width: 2),
              ),
              child: ClipOval(
                child: Image.network(
                  'https://www.figma.com/api/mcp/asset/b3a147e0-851f-4f47-a664-d5badbeea25e',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.inputBackground,
                      child: const Icon(
                        Icons.person,
                        color: AppColors.bodyText,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            AppStrings.appName,
            style: TextStyle(
              fontFamily: 'PublicSans',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              height: 24 / 16,
              color: Color(0xFFB12C16),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
