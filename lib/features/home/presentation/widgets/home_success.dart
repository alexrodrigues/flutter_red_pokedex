import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:red_pokedex/features/components/poke_card.dart';
import 'package:red_pokedex/features/home/presentation/bloc/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:red_pokedex/theme/theme.dart';

class HomeSuccess extends StatelessWidget {
  const HomeSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeBloc>().state;

    return ListView.builder(
      itemCount: state.result.length,
      itemBuilder: (BuildContext context, int index) {
        var pokemon = state.result[index];
        return InkWell(
          onTap: () {
            context.pushNamed(
              'details',
              pathParameters: {'pokemon_id': pokemon.id.toString()},
            );
          },
          child: PokeCard(pokemon: pokemon),
        );
      },
    );
  }
}
