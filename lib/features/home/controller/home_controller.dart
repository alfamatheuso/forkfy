import 'package:mvc_pattern/mvc_pattern.dart';
import '../../model/recipe_model.dart';
import '../../../core/services/api_service.dart';
import '../../../core/services/storage_service.dart';

class HomeController extends ControllerMVC {
  final ApiService apiService = ApiService();
  final StorageService storageService = StorageService();

  List<RecipeModel> recipes = [];
  List<String> favoriteIds = [];

  HomeController() {
    loadFavorites();
  }

  void searchRecipes(String query) async {
    final data = await apiService.fetchRecipes(query);
    setState(() {
      recipes = data.map((json) => RecipeModel.fromJson(json)).toList();
    });
  }

  void loadFavorites() async {
    favoriteIds = await storageService.getFavorites();
    setState(() {});
  }

  void toggleFavorite(String id) {
    if (favoriteIds.contains(id)) {
      favoriteIds.remove(id);
    } else {
      favoriteIds.add(id);
    }
    storageService.saveFavorites(favoriteIds);
    setState(() {});
  }

  bool isFavorite(String id) => favoriteIds.contains(id);
}