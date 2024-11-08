import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:red_pokedex/features/components/poke_card.dart';
import 'package:red_pokedex/features/components/poke_home_header.dart';
import 'package:red_pokedex/features/home/presentation/bloc/home_bloc.dart';

class HomeSuccess extends StatelessWidget {
  const HomeSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeBloc>().state;

    return Container(
      color: Colors.red,
      child: Column(
        children: [
          SizedBox(height: 60.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: PokeHomeHeader(),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
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
            ),
          ),
        ],
      ),
    );
  }
}