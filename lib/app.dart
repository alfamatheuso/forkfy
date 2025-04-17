import 'package:flutter/material.dart';
import 'core/config/app_routes.dart';
import 'features/home/page/home_page.dart';
import 'features/home/page/components/favorites_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forkify App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.favorites: (context) => const FavoritesPage(),
      },
    );
  }
}