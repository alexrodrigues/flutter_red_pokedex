import 'package:cached_network_image/cached_network_image.dart';
import 'package:coordinator_layout/coordinator_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokedex.dart';
import 'package:red_pokedex/features/components/poke_card.dart';
import 'package:red_pokedex/features/details/presentation/bloc/details_bloc.dart';
import 'package:red_pokedex/features/details/presentation/widgets/details_about.dart';
import 'package:red_pokedex/theme/theme.dart';
import 'package:string_capitalize/string_capitalize.dart';

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
        title: Text(
          widget.pokemon.name.capitalize(),
          style: const TextStyle(color: Colors.white),
        ),
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
          child: CoordinatorLayout(
            headerMinHeight:
                0,
            headerMaxHeight: 220.0,
            headers: [
              SliverCollapsingHeader(
                builder: (context, offset, diff) {
                  return SizedBox(
                    width: 220,
                    height: 220,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Image.asset(
                          'assets/pokeball.png',
                          color: Colors.white38,
                        ),
                        CachedNetworkImage(
                          width: 200,
                          height: 200,
                          imageUrl: _thumbnailUrl(widget.pokemon.id),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
            body: Container(
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
                          DetailsAbout(pokemon: widget.pokemon),
                          Center(child: Text('Stats Content')),
                          Center(child: Text('Evolution Content')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
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
