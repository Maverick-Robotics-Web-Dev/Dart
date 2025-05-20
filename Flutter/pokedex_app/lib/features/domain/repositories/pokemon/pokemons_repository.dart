import 'package:dartz/dartz.dart';
import 'package:pokedex_app/core/error/failures.dart';
import 'package:pokedex_app/features/domain/entities/pokemon/pokemon.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> getCapturedPokemons();
  Future<Either<Failure, Pokemon>> getPokemon(int id);
  Future<Either<Failure, bool>> capturePokemon(Pokemon pokemon);
}
