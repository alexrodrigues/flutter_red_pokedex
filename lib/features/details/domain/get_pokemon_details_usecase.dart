import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';

abstract class GetPokemonDetailsUsecase {
  Future<Pokemon> getDetails(int id);
}

@Injectable(as: GetPokemonDetailsUsecase)
class GetPokemonDetailsUsecaseImpl implements GetPokemonDetailsUsecase {
  GetPokemonDetailsUsecaseImpl(this._client);

  final Pokedex _client;

  @override
  Future<Pokemon> getDetails(int id) => _client.pokemon.get(id: id);
}
