import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return Card(
          elevation: 8.0,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: RedPokedexTypeColor.getPokemonColor(
                      pokemon.types.first.type.name)
                  .primary,
            ),
            height: 140.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/pokeball.png',
                        color: Colors.white38,
                      ),
                      CachedNetworkImage(
                        width: 120,
                        height: 120,
                        imageUrl: _thumbnailUrl(pokemon.id),
                      )
                    ],
                  ),
                ),
                Text(pokemon.name.toUpperCase())
              ],
            ),
          ),
        );
      },
    );
  }

  String _thumbnailUrl(int identifier) {
    final stringNumber = identifier.toString();
    if (identifier < 905) {
      return 'https://raw.githubusercontent.com/HybridShivam/Pokemon/master/assets/thumbnails/${stringNumber.padLeft(3, '0')}.png';
    }
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$stringNumber.png';
  }
}
