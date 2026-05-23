import '../../../../core/constants/app_import.dart';
import '../cubits/home_cubit.dart';
import '../cubits/home_state.dart';
import 'recipe_card.dart';

class RecipesList extends StatelessWidget {
  final HomeState state;

  const RecipesList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.recipes.isEmpty && state.recipesStatus != RequestState.loading) {
      return Center(
        child: Text('No recipes found', style: AppTextStyles.body),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: state.recipes.length,
      itemBuilder: (context, index) {
        final recipe = state.recipes[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: RecipeCard(
            recipe: recipe,
            onFavoriteToggle: () {
              context.read<HomeCubit>().toggleFavorite(recipe.id);
            },
          ),
        );
      },
    );
  }
}
