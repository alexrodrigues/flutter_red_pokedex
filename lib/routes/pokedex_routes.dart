import 'package:go_router/go_router.dart';
import 'package:red_pokedex/features/home/presentation/home.dart';

abstract class RedPokedexRoutes {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (_, __) => const HomePage(),
        routes: [
        ],
      ),
    ],
  );
}
