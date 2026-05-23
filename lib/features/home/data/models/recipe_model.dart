import '../../../../core/constants/app_import.dart';

class RecipeModel extends Equatable {
  final String id;
  final String title;
  final String category;
  final double rating;
  final String description;
  final String time;
  final String difficulty;
  final String imageUrl;

  const RecipeModel({
    required this.id,
    required this.title,
    required this.category,
    required this.rating,
    required this.description,
    required this.time,
    required this.difficulty,
    required this.imageUrl,
  });

  RecipeModel copyWith({
    String? id,
    String? title,
    String? category,
    double? rating,
    String? description,
    String? time,
    String? difficulty,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return RecipeModel(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      description: description ?? this.description,
      time: time ?? this.time,
      difficulty: difficulty ?? this.difficulty,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  List<Object?> get props => [id, title, rating];
  static const String _image1 =
      'https://www.figma.com/api/mcp/asset/065fa639-6e12-47d5-bb61-9de4543a0a4c';
  static const String _image2 =
      'https://www.figma.com/api/mcp/asset/539f063d-31de-4136-af4d-37af300a3c77';
  static const String _image3 =
      'https://www.figma.com/api/mcp/asset/8ae04d49-476a-4b8d-8d74-2a6a1b486dd8';
  static List<RecipeModel> recipes = [
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
}
