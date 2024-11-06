import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokedex.dart';
import 'package:red_pokedex/features/components/poke_card.dart';
import 'package:red_pokedex/features/details/presentation/bloc/details_bloc.dart';
import 'package:red_pokedex/theme/theme.dart';

class DetailsSuccess extends StatelessWidget {
  const DetailsSuccess({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            RedPokedexTypeColor.getPokemonColor(pokemon.types.first.type.name)
                .primary,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color:
              RedPokedexTypeColor.getPokemonColor(pokemon.types.first.type.name)
                  .primary,
        ),
        child: Column(
          children: [
            PokeCard(pokemon: pokemon),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0
                ),
                color: Colors.transparent,
                child: Card(
                  elevation: 16.0,
                  child: Center(
                    child: Text(
                      "This is a card with content",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
