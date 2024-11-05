import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_pokedex/features/home/presentation/bloc/home_bloc.dart';

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
          child: ListTile(
            title: Text(pokemon.name),
          ),
        );
      },
    );
  }
}
