import '../../../../core/constants/app_import.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        color: const Color(0xFFEEF4FF),
        borderRadius: BorderRadius.circular(9999),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 18),
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          AppStrings.searchRecipes,
          style: TextStyle(
            fontFamily: 'PublicSans',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0x998E706B),
          ),
        ),
      ),
    );
  }
}

class SearchBarWithIcon extends StatelessWidget {
  const SearchBarWithIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SearchBar(),
        Positioned(
          left: 16,
          top: 0,
          bottom: 0,
          child: Center(
            child: Icon(
              Icons.search_rounded,
              size: 18,
              color: AppColors.bodyText.withValues(alpha: 0.6),
            ),
          ),
        ),
      ],
    );
  }
}
