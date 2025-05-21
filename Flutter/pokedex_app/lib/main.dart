import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_app/di/app_injection.dart';
import 'package:pokedex_app/features/presentation/bloc/pokemon/pokemon_bloc.dart';
import 'package:pokedex_app/features/presentation/screens/pokemons_screen.dart';

void main() async {
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetIt.instance.get<PokemonBloc>()),
      ],
      child: const MaterialApp(home: Scaffold(body: PokemonsScreen())),
    );
  }
}
