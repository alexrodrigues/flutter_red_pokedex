part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class PokemonsRequestEvent extends HomeEvent {
  const PokemonsRequestEvent({
    this.limit = 100,
  });

  final int limit;

  @override
  List<Object?> get props => [limit];
}
