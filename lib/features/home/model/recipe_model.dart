class RecipeModel {
  final String id;
  final String title;
  final String imageUrl;

  RecipeModel({required this.id, required this.title, required this.imageUrl});

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['image_url'],
    );
  }
}