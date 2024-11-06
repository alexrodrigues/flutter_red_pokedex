part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object?> get props => [];
}

class RequestPokemonDetailsEvent extends DetailsEvent {
  const RequestPokemonDetailsEvent({
    this.pokemon_id = -1,
  });

  final int pokemon_id;

  @override
  List<Object?> get props => [pokemon_id];
}
