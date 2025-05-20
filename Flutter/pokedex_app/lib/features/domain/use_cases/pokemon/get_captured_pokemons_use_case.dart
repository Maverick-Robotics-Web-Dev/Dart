import 'package:dartz/dartz.dart';
import 'package:pokedex_app/core/error/failures.dart';
import 'package:pokedex_app/features/domain/entities/pokemon/pokemon.dart';
import 'package:pokedex_app/features/domain/repositories/pokemon/pokemons_repository.dart';

class GetCapturedPokemons {
  final PokemonRepository repository;

  GetCapturedPokemons({required this.repository});

  Future<Either<Failure, List<Pokemon>>> call() {
    return repository.getCapturedPokemons();
  }
}
