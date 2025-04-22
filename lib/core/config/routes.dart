final routes = {
  '/login': (context) => LoginPage(controller: LoginController(LoginRepository())),
  '/register': (context) => RegisterPage(controller: RegisterController(RegisterRepository())),
  '/home': (context) => HomePage(controller: HomeController(HomeRepository())),
  '/profile': (context) => ProfilePage(controller: ProfileController(ProfileRepository())),
};