import 'package:go_router/go_router.dart';
import 'package:red_pokedex/features/details/presentation/details.dart';
import 'package:red_pokedex/features/home/presentation/home.dart';

abstract class RedPokedexRoutes {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (_, __) => const HomePage(),
        routes: [
          GoRoute(
            path: 'detais/:pokemon_id',
            name: 'details',
            builder: (_, state) {
              late int id;
              try {
                id = int.parse(state.pathParameters['pokemon_id'] ?? '1');
              } catch (_) {
                id = 1;
              }
              return DetailsPage(pokemon_id: id);
            },
          ),
        ],
      ),
    ],
  );
}
