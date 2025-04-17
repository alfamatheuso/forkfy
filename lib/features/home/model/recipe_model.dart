import 'package:json_annotation/json_annotation.dart';

part 'recipe_model.g.dart';

@JsonSerializable()
class Recipe {
  final String id;
  final String title;
  final String imageUrl;

  Recipe({required this.id, required this.title, required this.imageUrl});

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}