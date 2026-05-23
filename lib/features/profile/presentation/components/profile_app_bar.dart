import '../../../../core/constants/app_import.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:ui';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xCCF8F9FF),
            ),
          ),
        ),
      ),
      title: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFFDFE9FA),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0x1A8E706B),
                width: 1,
              ),
            ),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: 'https://www.figma.com/api/mcp/asset/bb5c8c5d-c2b1-40e8-9b3d-1652ee219a78',
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: AppColors.inputBackground,
                  child: const Icon(
                    Icons.person,
                    color: AppColors.bodyText,
                    size: 16,
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: AppColors.inputBackground,
                  child: const Icon(
                    Icons.person,
                    color: AppColors.bodyText,
                    size: 16,
                  ),
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
              fontSize: 20,
              height: 28 / 20,
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
