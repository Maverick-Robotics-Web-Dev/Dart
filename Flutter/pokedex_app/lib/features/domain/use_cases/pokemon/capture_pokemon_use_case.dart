import 'package:dartz/dartz.dart';
import 'package:pokedex_app/core/error/failures.dart';
import 'package:pokedex_app/features/domain/entities/pokemon/pokemon.dart';
import 'package:pokedex_app/features/domain/repositories/pokemon/pokemons_repository.dart';

class CapturePokemonUseCase {
  final PokemonRepository repository;

  CapturePokemonUseCase({required this.repository});

  Future<Either<Failure, bool>> call(Pokemon pokemon) {
    return repository.capturePokemon(pokemon);
  }
}
