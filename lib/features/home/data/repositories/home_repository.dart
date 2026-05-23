import '../../../../core/constants/app_import.dart';
import '../models/recipe_model.dart';

abstract class HomeRepository {
  Future<Either<String, List<RecipeModel>>> getRecipes();
}

class HomeRepositoryImpl implements HomeRepository {
  static const String _image1 =
      'https://www.figma.com/api/mcp/asset/065fa639-6e12-47d5-bb61-9de4543a0a4c';
  static const String _image2 =
      'https://www.figma.com/api/mcp/asset/539f063d-31de-4136-af4d-37af300a3c77';
  static const String _image3 =
      'https://www.figma.com/api/mcp/asset/8ae04d49-476a-4b8d-8d74-2a6a1b486dd8';

  @override
  Future<Either<String, List<RecipeModel>>> getRecipes() async {
    await Future.delayed(const Duration(seconds: 1));

    final recipes = [
      RecipeModel(
        id: '1',
        title: 'Creamy Tomato Soup',
        category: 'Italian',
        rating: 4.8,
        description:
            'A silky smooth blend of vine-ripened tomatoes and fresh basil, perfect for a…',
        time: '20 min',
        difficulty: 'Easy',
        imageUrl: _image1,
      ),
      RecipeModel(
        id: '2',
        title: 'Mediterranean Salad',
        category: 'Italian',
        rating: 4.9,
        description:
            'Refresh your palate with this crunchy mix of chickpeas, feta, and garden-fresh…',
        time: '15 min',
        difficulty: 'Easy',
        imageUrl: _image2,
      ),
      RecipeModel(
        id: '3',
        title: 'Classic Pasta',
        category: 'Italian',
        rating: 5.0,
        description:
            'Master the art of the perfect Roman Carbonara with just four ingredients and',
        time: '25 min',
        difficulty: 'Medium',
        imageUrl: _image3,
      ),
    ];

    return Right(recipes);
  }
}
