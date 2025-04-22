class LoginRepository {
  final mockService = MockService();

  Future<bool> authenticate(LoginModel login) async {
    List users = await mockService.getMockData('users.json');
    return users.any((user) => user['email'] == login.email && user['password'] == login.password);
  }
}