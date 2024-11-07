import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokedex.dart';
import 'package:red_pokedex/features/components/poke_card.dart';
import 'package:red_pokedex/features/details/presentation/bloc/details_bloc.dart';
import 'package:red_pokedex/theme/theme.dart';

class DetailsSuccess extends StatefulWidget {
  const DetailsSuccess({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  State<DetailsSuccess> createState() => _DetailsSuccessState();
}

class _DetailsSuccessState extends State<DetailsSuccess>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final pokemonColor = RedPokedexTypeColor.getPokemonColor(
            widget.pokemon.types.first.type.name)
        .primary;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: pokemonColor,
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
          color: pokemonColor,
        ),
        child: Column(
          children: [
            PokeCard(pokemon: widget.pokemon),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                color: Colors.transparent,
                child: Card(
                  elevation: 16.0,
                  child: Column(
                    children: [
                      TabBar(
                        controller: _tabController,
                        labelColor: pokemonColor,
                        unselectedLabelColor: Colors.black,
                        dividerColor: Colors.transparent,
                        labelStyle: textTheme.labelLarge,
                        unselectedLabelStyle: textTheme.labelLarge,
                        indicatorColor: pokemonColor,
                        tabs: const [
                          Tab(text: 'About'),
                          Tab(text: 'Stats'),
                          Tab(text: 'Evolution'),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            Center(child: Text('About Content')),
                            Center(child: Text('Stats Content')),
                            Center(child: Text('Evolution Content')),
                          ],
                        ),
                      ),
                    ],
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