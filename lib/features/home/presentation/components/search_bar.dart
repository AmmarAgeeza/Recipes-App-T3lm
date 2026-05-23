import '../../../../core/constants/app_import.dart';

class SearchBarWithIcon extends StatelessWidget {
  const SearchBarWithIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: AppStrings.searchRecipes,
      icon: Icons.search_rounded,
    );
  }
}
