import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  HomePage({required this.controller});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.loadFavorites();
    return Scaffold(
      appBar: AppBar(
        title: Text('Forkify Receitas'),
        actions: [
          IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoritesPage(controller: controller)));
              })
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Pesquisar receitas'),
            ),
          ),
          ElevatedButton(
              onPressed: () => controller.searchRecipes(_searchController.text),
              child: Text('Buscar')),
          Expanded(
            child: Observer(
              builder: (_) => ListView.builder(
                itemCount: controller.recipes.length,
                itemBuilder: (_, index) {
                  final recipe = controller.recipes[index];
                  return GestureDetector(
                    onDoubleTap: () => controller.toggleFavorite(recipe),
                    child: ListTile(
                      leading: Image.network(recipe.imageUrl),
                      title: Text(recipe.title),
                      trailing: Observer(
                          builder: (_) => Icon(
                              controller.favoriteIds.contains(recipe.id)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red)),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}