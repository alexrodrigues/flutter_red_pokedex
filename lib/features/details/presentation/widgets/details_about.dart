import 'package:flutter/material.dart';
import 'package:pokedex/pokedex.dart';
import 'package:red_pokedex/features/components/poke_label_value.dart';
import 'package:red_pokedex/features/components/poke_moves.dart';
import 'package:red_pokedex/theme/theme.dart';

class DetailsAbout extends StatelessWidget {
  final Pokemon pokemon;
  const DetailsAbout({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final pokemonColor =
        RedPokedexTypeColor.getPokemonColor(pokemon.types.first.type.name)
            .primary;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8.0),
                    child: Text(
                      "PokeDex Data",
                      style: textTheme.titleMedium?.copyWith(
                          color: pokemonColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: PokeLabelValue(
                      label: "Weight",
                      value: "${pokemon.weight} g",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: PokeLabelValue(
                      label: "Height",
                      value: "${pokemon.height * 10} cm",
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8.0),
                    child: Text(
                      "Training",
                      style: textTheme.titleMedium?.copyWith(
                          color: pokemonColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: PokeLabelValue(
                      label: "Base Experience",
                      value: "${pokemon.baseExperience} xp",
                    ),
                  ),
                  ...pokemon.abilities.map(
                    (element) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        element.ability.name,
                        style: textTheme.bodySmall
                            ?.copyWith(color: const Color(0xFF747476)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Text(
              "Moves",
              style: textTheme.titleMedium
                  ?.copyWith(color: pokemonColor, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: PokeMoves(
              moves: pokemon.moves.map((element) => element.move.name).toList(),
            ),
          )
        ],
      ),
    );
  }
}
