import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String keyFavorites = 'favorites';

  Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(keyFavorites) ?? [];
  }

  Future<void> saveFavorites(List<String> favorites) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(keyFavorites, favorites);
  }
}