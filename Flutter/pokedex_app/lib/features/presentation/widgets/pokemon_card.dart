import 'package:flutter/material.dart';
import 'package:pokedex_app/features/domain/entities/pokemon/pokemon.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [Image.network(pokemon.img), Text(pokemon.name)]),
    );
  }
}
