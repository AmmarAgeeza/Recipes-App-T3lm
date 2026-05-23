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
  final bool isFavorite;

  const RecipeModel({
    required this.id,
    required this.title,
    required this.category,
    required this.rating,
    required this.description,
    required this.time,
    required this.difficulty,
    required this.imageUrl,
    this.isFavorite = false,
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
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [id, title, rating, isFavorite];
}
