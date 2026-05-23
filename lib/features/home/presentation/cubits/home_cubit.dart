import '../../../../core/constants/app_import.dart';
import '../../data/repositories/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;

  HomeCubit(this.homeRepository) : super(const HomeState());

  Future<void> loadRecipes() async {
    emit(state.copyWith(recipesStatus: RequestState.loading));

    final result = await homeRepository.getRecipes();

    result.fold(
      (error) => emit(state.copyWith(
        recipesStatus: RequestState.error,
        errorMessage: error,
      )),
      (recipes) => emit(state.copyWith(
        recipesStatus: RequestState.success,
        recipes: recipes,
      )),
    );
  }

  void toggleFavorite(String recipeId) {
    final updatedRecipes = state.recipes.map((recipe) {
      if (recipe.id == recipeId) {
        return recipe.copyWith(isFavorite: !recipe.isFavorite);
      }
      return recipe;
    }).toList();

    emit(state.copyWith(recipes: updatedRecipes));
  }
}
