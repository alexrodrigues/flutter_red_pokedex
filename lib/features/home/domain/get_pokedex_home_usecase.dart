import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';

abstract class GetPokedexHomeUsecase {
  Future<List<Pokemon>> fetchHomePokemons(int limit, int offset);
}

@Injectable(as: GetPokedexHomeUsecase)
class GetPokedexHomeUsecaseImpl implements GetPokedexHomeUsecase {
  GetPokedexHomeUsecaseImpl(this._pokedex);

  final Pokedex _pokedex;

  @override
  Future<List<Pokemon>> fetchHomePokemons(int limit, int offset) async {
    final homePokemons = await _pokedex.pokemon.getPage(
      limit: limit,
      offset: offset,
    );

    final pokemons = await Future.wait(
      homePokemons.results.map((e) => _pokedex.pokemon.getByUrl(e.url)),
    );

    return pokemons;
  }
}
