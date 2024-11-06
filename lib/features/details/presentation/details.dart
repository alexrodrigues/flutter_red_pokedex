import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:red_pokedex/features/details/presentation/bloc/details_bloc.dart';
import 'package:red_pokedex/features/details/presentation/widgets/details_success.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    super.key,
    required this.pokemon_id,
  });

  final int pokemon_id;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    var pokemon_id = widget.pokemon_id;

    return BlocProvider(
      create: (providerContext) => GetIt.I.get<DetailsBloc>()
        ..add(RequestPokemonDetailsEvent(pokemon_id: pokemon_id)),
      child: BlocBuilder<DetailsBloc, DetailsState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          final status = state.status;
          if (state.result != null) {
            if (status == Status.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (status == Status.failure) {
              return Container(
                child: Text("Error"),
              );
            } else if (status == Status.initial) {
              return const SizedBox.shrink();
            }
          }
          return state.result == null
              ? Container(
                  color: Colors.white,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : DetailsSuccess(
                  pokemon: state.result!,
                );
        },
      ),
    );
  }
}
