class FavoritesPage extends StatelessWidget {
  final HomeController controller;

  FavoritesPage({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Receitas Favoritas')),
      body: Observer(
        builder: (_) => ListView(
          children: controller.recipes
              .where((recipe) => controller.favoriteIds.contains(recipe.id))
              .map((recipe) => GestureDetector(
                    onDoubleTap: () => controller.toggleFavorite(recipe),
                    child: ListTile(
                      leading: Image.network(recipe.imageUrl),
                      title: Text(recipe.title),
                      trailing: Icon(Icons.favorite, color: Colors.red),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}