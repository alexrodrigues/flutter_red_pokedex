import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:red_pokedex/features/details/domain/get_pokemon_details_usecase.dart';
import 'package:red_pokedex/util/event_transformations.dart';

part 'details_event.dart';
part 'details_state.dart';

@injectable
class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc(this._useCase) : super(const DetailsState()) {
    on<RequestPokemonDetailsEvent>(_onrequestPokemonDetails,
        transformer: throttleDroppable(
          const Duration(milliseconds: 100),
        ));
  }
  final GetPokemonDetailsUsecase _useCase;

  Future<void> _onrequestPokemonDetails(
    RequestPokemonDetailsEvent event,
    Emitter<DetailsState> emit,
  ) async {
    if (state.status == Status.finished &&
        state.status != Status.failure &&
        state.status != Status.loading) {
      return;
    }

    emit(state.copyWith(status: Status.loading));

    try {
      final pokemon =
          await _useCase.getDetails(event.pokemon_id);
      emit(
        state.copyWith(
          status: pokemon.id == event.pokemon_id ? Status.success : Status.finished,
          result: pokemon,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
