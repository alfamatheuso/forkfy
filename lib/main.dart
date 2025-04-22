import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

//lib/app.dart
class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rede Social',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: routes,
    );
  }
}