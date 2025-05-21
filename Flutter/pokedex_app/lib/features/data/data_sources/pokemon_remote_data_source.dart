import 'package:dio/dio.dart';
import 'package:pokedex_app/features/data/models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonModel> getPokemon(int id);
}

class PokemonsRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<PokemonModel> getPokemon(int id) async {
    final response = await dio.get('https://pokeapi.co/api/v2/pokemon/$id/');

    return PokemonModel.fromJson(response.data);
  }
}
