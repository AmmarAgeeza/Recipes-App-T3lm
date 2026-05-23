import '../../../../core/constants/app_import.dart';
import '../../data/models/recipe_model.dart';
import 'recipe_card.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({super.key});

  @override
  Widget build(BuildContext context) {
    if (RecipeModel.recipes.isEmpty) {
      return Center(child: Text('No recipes found', style: AppTextStyles.body));
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: RecipeModel.recipes.length,
      itemBuilder: (context, index) {
        final recipe = RecipeModel.recipes[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: RecipeCard(recipe: recipe),
        );
      },
    );
  }
}
