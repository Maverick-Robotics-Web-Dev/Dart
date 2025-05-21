import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedex_app/core/error/failures.dart';
import 'package:pokedex_app/features/data/models/pokemon_model.dart';
import 'package:pokedex_app/features/domain/entities/pokemon/pokemon.dart';

abstract class PokemonLocalDataSource {
  Future<bool> capturePokemon(Pokemon pokemon);
  Future<List<PokemonModel>> getCapturedPokemons();
}

class HivePokemonLocalDataSourceImpl implements PokemonLocalDataSource {
  HivePokemonLocalDataSourceImpl() {
    Hive.initFlutter();
  }

  @override
  Future<bool> capturePokemon(Pokemon pokemon) async {
    try {
      Box<dynamic> box = await Hive.openBox('pokemons');

      box.put(pokemon.id, PokemonModel.fromEntity(pokemon).toJson());

      return true;
    } catch (e) {
      // Handle the error
      debugPrint(e.toString());
      throw LocalFailure();
    }
  }

  @override
  Future<List<PokemonModel>> getCapturedPokemons() async {
    try {
      Box<dynamic> box = await Hive.openBox('pokemons');

      final List<PokemonModel> pokemons =
          box.values.map((p) => PokemonModel.fromJson(p)).toList();

      return pokemons;
    } catch (e) {
      // Handle the error
      debugPrint(e.toString());
      throw LocalFailure();
    }
  }
}
