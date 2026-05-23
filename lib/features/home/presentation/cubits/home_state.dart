import '../../../../core/constants/app_import.dart';
import '../../data/models/recipe_model.dart';

class HomeState extends Equatable {
  final RequestState recipesStatus;
  final List<RecipeModel> recipes;
  final String? errorMessage;

  const HomeState({
    this.recipesStatus = RequestState.idle,
    this.recipes = const [],
    this.errorMessage,
  });

  HomeState copyWith({
    RequestState? recipesStatus,
    List<RecipeModel>? recipes,
    String? errorMessage,
  }) {
    return HomeState(
      recipesStatus: recipesStatus ?? this.recipesStatus,
      recipes: recipes ?? this.recipes,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [recipesStatus, recipes, errorMessage];
}
