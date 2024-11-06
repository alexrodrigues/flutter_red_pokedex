// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pokedex/pokedex.dart' as _i706;
import 'package:red_pokedex/api/pokedex_api.dart' as _i642;
import 'package:red_pokedex/features/details/domain/get_pokemon_details_usecase.dart'
    as _i27;
import 'package:red_pokedex/features/details/presentation/bloc/details_bloc.dart'
    as _i658;
import 'package:red_pokedex/features/home/domain/get_pokedex_home_usecase.dart'
    as _i107;
import 'package:red_pokedex/features/home/presentation/bloc/home_bloc.dart'
    as _i473;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final pokedexApi = _$PokedexApi();
  gh.singleton<_i706.Pokedex>(() => pokedexApi.pokedex);
  gh.factory<_i107.GetPokedexHomeUsecase>(
      () => _i107.GetPokedexHomeUsecaseImpl(gh<_i706.Pokedex>()));
  gh.factory<_i473.HomeBloc>(
      () => _i473.HomeBloc(gh<_i107.GetPokedexHomeUsecase>()));
  gh.factory<_i27.GetPokemonDetailsUsecase>(
      () => _i27.GetPokemonDetailsUsecaseImpl(gh<_i706.Pokedex>()));
  gh.factory<_i658.DetailsBloc>(
      () => _i658.DetailsBloc(gh<_i27.GetPokemonDetailsUsecase>()));
  return getIt;
}

class _$PokedexApi extends _i642.PokedexApi {}
