import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ApiService apiService;
  final DatabaseService databaseService;

  _HomeControllerBase(this.apiService, this.databaseService);

  @observable
  ObservableList<Recipe> recipes = ObservableList<Recipe>();

  @observable
  ObservableSet<String> favoriteIds = ObservableSet<String>();

  @action
  Future<void> searchRecipes(String query) async {
    final data = await apiService.fetchRecipes(query);
    recipes.clear();
    recipes.addAll((data['data']['recipes'] as List)
        .map((json) => Recipe.fromJson({
              'id': json['id'],
              'title': json['title'],
              'imageUrl': json['image_url']
            }))
        .toList());
  }

  @action
  Future<void> toggleFavorite(Recipe recipe) async {
    if (favoriteIds.contains(recipe.id)) {
      await databaseService.removeFavorite(recipe.id);
      favoriteIds.remove(recipe.id);
    } else {
      await databaseService.addFavorite(recipe.toJson());
      favoriteIds.add(recipe.id);
    }
  }

  @action
  Future<void> loadFavorites() async {
    final favs = await databaseService.getFavorites();
    favoriteIds = ObservableSet.of(favs.map((fav) => fav['id'] as String));
  }
}