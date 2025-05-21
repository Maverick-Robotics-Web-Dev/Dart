import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pokedex_app/core/error/failures.dart';
import 'package:pokedex_app/features/data/data_sources/pokemon_local_data_source.dart';
import 'package:pokedex_app/features/data/data_sources/pokemon_remote_data_source.dart';
import 'package:pokedex_app/features/domain/entities/pokemon/pokemon.dart';
import 'package:pokedex_app/features/domain/repositories/pokemon/pokemons_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;
  final PokemonLocalDataSource localDataSource;

  PokemonRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, bool>> capturePokemon(Pokemon pokemon) async {
    try {
      final bool response = await localDataSource.capturePokemon(pokemon);

      return Right(response);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<Pokemon>>> getCapturedPokemons() async {
    try {
      final List<Pokemon> response =
          await localDataSource.getCapturedPokemons();

      return Right(response);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, Pokemon>> getPokemon(int id) async {
    try {
      final Pokemon response = await remoteDataSource.getPokemon(id);

      return Right(response);
    } on DioException {
      return Left(ServerFailure());
    }
  }
}
