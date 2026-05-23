import '../../../../core/constants/app_import.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../data/models/recipe_model.dart';

class RecipeCard extends StatelessWidget {
  final RecipeModel recipe;
  final VoidCallback onFavoriteToggle;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            offset: Offset(0, 4),
            blurRadius: 20,
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageSection(),
          _buildContentSection(),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return SizedBox(
      height: 262.5,
      width: double.infinity,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: recipe.imageUrl,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: AppColors.inputBackground,
            ),
            errorWidget: (context, url, error) => Container(
              color: AppColors.inputBackground,
            ),
          ),
          Positioned(
            left: 16,
            top: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xB3BDEDAA),
                borderRadius: BorderRadius.circular(9999),
              ),
              child: Text(
                recipe.category,
                style: const TextStyle(
                  fontFamily: 'PublicSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  letterSpacing: 0.48,
                  color: Color(0xFF436D37),
                ),
              ),
            ),
          ),
          Positioned(
            right: 16,
            top: 16,
            child: GestureDetector(
              onTap: onFavoriteToggle,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    recipe.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: recipe.isFavorite
                        ? const Color(0xFFB12C16)
                        : Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  recipe.title,
                  style: const TextStyle(
                    fontFamily: 'PublicSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    height: 25 / 20,
                    color: AppColors.headingText,
                  ),
                ),
              ),
              _buildRatingBadge(),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            recipe.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'PublicSans',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 24 / 16,
              color: AppColors.bodyText,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFFD9E3F4)),
              ),
            ),
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              children: [
                _buildInfoItem(Icons.access_time_rounded, recipe.time),
                const SizedBox(width: 24),
                _buildInfoItem(Icons.signal_cellular_alt_rounded, recipe.difficulty),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBadge() {
    final badgeColor = recipe.rating >= 5.0
        ? const Color(0xFFFFDAD3)
        : const Color(0xFFD9E3F4);

    final textColor = recipe.rating >= 5.0
        ? const Color(0xFF3F0400)
        : AppColors.headingText;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.star_rounded,
            size: 13.33,
            color: AppColors.headingText,
          ),
          const SizedBox(width: 4),
          Text(
            recipe.rating.toStringAsFixed(1),
            style: TextStyle(
              fontFamily: 'PublicSans',
              fontWeight: FontWeight.w500,
              fontSize: 12,
              letterSpacing: 0.48,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: AppColors.bodyText,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontFamily: 'PublicSans',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: 0.14,
            color: AppColors.bodyText,
          ),
        ),
      ],
    );
  }
}
