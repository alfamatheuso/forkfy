import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../controller/home_controller.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  StateMVC<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends StateMVC<FavoritesPage> {
  late HomeController controller;

  _FavoritesPageState() : super(HomeController()) {
    controller = controllerMVC as HomeController;
    controller.loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    final favorites = controller.recipes
        .where((recipe) => controller.favoriteIds.contains(recipe.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final recipe = favorites[index];
          return GestureDetector(
            onDoubleTap: () {
              controller.toggleFavorite(recipe.id);
            },
            child: Card(
              child: ListTile(
                leading: Image.network(recipe.imageUrl),
                title: Text(recipe.title),
                trailing: const Icon(Icons.favorite, color: Colors.red),
              ),
            ),
          );
        },
      ),
    );
  }
}