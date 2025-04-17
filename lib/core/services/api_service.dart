import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://forkify-api.herokuapp.com/api/v2/recipes';

  Future<List<dynamic>> fetchRecipes(String query) async {
    final response = await http.get(Uri.parse('$baseUrl?search=$query'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data']['recipes'];
    } else {
      throw Exception('Falha ao carregar receitas');
    }
  }
}