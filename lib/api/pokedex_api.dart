import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';

@module
abstract class PokedexApi {
  @singleton
  Pokedex get pokedex => Pokedex();
}
