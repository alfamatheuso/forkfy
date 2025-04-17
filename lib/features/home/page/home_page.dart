import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../controller/home_controller.dart';
import '../../../core/config/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  StateMVC<HomePage> createState() => _HomePageState();
}

class _HomePageState extends StateMVC<HomePage> {
  late HomeController controller;
  final searchController = TextEditingController();

  _HomePageState() : super(HomeController()) {
    controller = controllerMVC as HomeController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas Forkify'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.favorites);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Pesquisar receitas',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    controller.searchRecipes(searchController.text);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.recipes.length,
              itemBuilder: (context, index) {
                final recipe = controller.recipes[index];
                return GestureDetector(
                  onDoubleTap: () {
                    controller.toggleFavorite(recipe.id);
                  },
                  child: Card(
                    child: ListTile(
                      leading: Image.network(recipe.imageUrl),
                      title: Text(recipe.title),
                      trailing: Icon(
                        controller.isFavorite(recipe.id)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: controller.isFavorite(recipe.id)
                            ? Colors.red
                            : null,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}