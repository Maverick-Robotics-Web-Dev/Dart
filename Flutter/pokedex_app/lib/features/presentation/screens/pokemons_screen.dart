import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/features/presentation/bloc/pokemon/pokemon_bloc.dart';
import 'package:pokedex_app/features/presentation/bloc/pokemon/pokemon_event.dart';
import 'package:pokedex_app/features/presentation/bloc/pokemon/pokemon_state.dart';
import 'package:pokedex_app/features/presentation/widgets/pokemon_card.dart';

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          switch (state) {
            case PokemonLoadingState():
              return const Center(child: CircularProgressIndicator());
            case PokemonInitialState():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed:
                          () => BlocProvider.of<PokemonBloc>(
                            context,
                          ).add(OnGetPokemon()),
                      child: const Text('Generar pokemon aleatorio'),
                    ),
                    TextButton(
                      onPressed:
                          () => BlocProvider.of<PokemonBloc>(
                            context,
                          ).add(OnGetCapturedPokemons()),
                      child: const Text('Ver mis pokemones capturados'),
                    ),
                  ],
                ),
              );
            case GetPokemonState():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PokemonCard(pokemon: state.pokemon),
                    TextButton(
                      onPressed:
                          () => BlocProvider.of<PokemonBloc>(
                            context,
                          ).add(OnGetPokemon()),
                      child: const Text('Generar otro pokemon aleatorio'),
                    ),
                    TextButton(
                      onPressed:
                          () => BlocProvider.of<PokemonBloc>(
                            context,
                          ).add(OnGetCapturedPokemons()),
                      child: const Text('Ver mis pokemones capturados'),
                    ),
                    TextButton(
                      onPressed:
                          () => BlocProvider.of<PokemonBloc>(
                            context,
                          ).add(OnCapturePokemon(pokemon: state.pokemon)),
                      child: Text('Capturar a ${state.pokemon.name}'),
                    ),
                  ],
                ),
              );
            case GetCapturedPokemonsState():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children:
                            state.pokemons
                                .map((p) => PokemonCard(pokemon: p))
                                .toList(),
                      ),
                    ),
                    TextButton(
                      onPressed:
                          () => BlocProvider.of<PokemonBloc>(
                            context,
                          ).add(OnGetPokemon()),
                      child: const Text('Volver y generar pokemon'),
                    ),
                  ],
                ),
              );
            case PokemonFailureState():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Ah ocurrido un error, que te parece si lo intentamos de nuevo?',
                    ),
                    TextButton(
                      onPressed:
                          () => BlocProvider.of<PokemonBloc>(
                            context,
                          ).add(OnGetPokemon()),
                      child: const Text('Volver y generar pokemon'),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
