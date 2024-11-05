import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:red_pokedex/features/home/domain/get_pokedex_home_usecase.dart';
import 'package:red_pokedex/util/event_transformations.dart';


part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._useCase) : super(const HomeState()) {
    on<PokemonsRequestEvent>(_onRequestPokemons,
        transformer: throttleDroppable(
          const Duration(milliseconds: 100),
        ));
  }
  final GetPokedexHomeUsecase _useCase;

  Future<void> _onRequestPokemons(
    PokemonsRequestEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (state.status == Status.finished &&
        state.status != Status.failure &&
        state.status != Status.loading) {
      return;
    }

    emit(state.copyWith(status: Status.loading));

    try {
      final pokemons =
          await _useCase.fetchHomePokemons(event.limit, state.result.length);
      emit(
        state.copyWith(
          status: pokemons.isNotEmpty ? Status.success : Status.finished,
          result: pokemons,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
