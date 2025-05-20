import 'package:dartz/dartz.dart';
import 'package:pokedex_app/core/error/failures.dart';
import 'package:pokedex_app/features/domain/entities/pokemon/pokemon.dart';
import 'package:pokedex_app/features/domain/repositories/pokemon/pokemons_repository.dart';

class GetPokemonUseCase {
  final PokemonRepository repository;

  GetPokemonUseCase({required this.repository});

  Future<Either<Failure, Pokemon>> call(int id) {
    return repository.getPokemon(id);
  }
}
