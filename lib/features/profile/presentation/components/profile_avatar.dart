import '../../../../core/constants/app_import.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileAvatar extends StatelessWidget {
  final String avatarUrl;

  const ProfileAvatar({
    super.key,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128,
      height: 128,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFF8F9FF),
            blurRadius: 0,
            spreadRadius: 4,
          ),
          const BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 20),
            blurRadius: 25,
          ),
          const BoxShadow(
            color: Color(0x0D000000),
            offset: Offset(0, 8),
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: avatarUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: AppColors.inputBackground,
            child: const Center(
              child: CircularProgressIndicator(
                color: AppColors.link,
              ),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            color: AppColors.inputBackground,
            child: const Icon(
              Icons.person,
              color: AppColors.bodyText,
              size: 48,
            ),
          ),
        ),
      ),
    );
  }
}
