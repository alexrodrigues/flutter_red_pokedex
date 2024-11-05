import 'package:flutter/material.dart';
import 'package:red_pokedex/di/injection.dart';
import 'package:red_pokedex/routes/pokedex_routes.dart';
import 'package:red_pokedex/theme/theme.dart';

void main() async {
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: RedPokedexTheme.pokedexTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: RedPokedexRoutes.router,
    );
  }
}
