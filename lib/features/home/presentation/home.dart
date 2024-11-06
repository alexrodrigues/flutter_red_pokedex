import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:red_pokedex/features/home/presentation/bloc/home_bloc.dart';
import 'package:red_pokedex/features/home/presentation/widgets/home_success.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (providerContext) =>
          GetIt.I.get<HomeBloc>()..add(const PokemonsRequestEvent()),
      child: Scaffold(
        body: SafeArea(
            child: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            final status = state.status;
            if (state.firstPage) {
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
            return const HomeSuccess();
          },
        )),
      ),
    );
  }
}