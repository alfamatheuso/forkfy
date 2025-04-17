class ApiService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> fetchRecipes(String query) async {
    final response = await _dio.get('${Constants.forkifyBaseUrl}?search=$query');
    return response.data;
  }

  Future<Map<String, dynamic>> fetchRecipeDetails(String id) async {
    final response = await _dio.get('${Constants.forkifyBaseUrl}/$id');
    return response.data;
  }
}