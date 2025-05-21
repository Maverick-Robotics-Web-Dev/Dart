import 'package:get_it/get_it.dart';
import 'package:pokedex_app/features/data/data_sources/pokemon_local_data_source.dart';
import 'package:pokedex_app/features/data/data_sources/pokemon_remote_data_source.dart';
import 'package:pokedex_app/features/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_app/features/domain/repositories/pokemon/pokemons_repository.dart';
import 'package:pokedex_app/features/domain/use_cases/pokemon/capture_pokemon_use_case.dart';
import 'package:pokedex_app/features/domain/use_cases/pokemon/get_captured_pokemons_use_case.dart';
import 'package:pokedex_app/features/domain/use_cases/pokemon/get_pokemon_use_case.dart';
import 'package:pokedex_app/features/presentation/bloc/pokemon/pokemon_bloc.dart';

final di = GetIt.instance;

Future<void> init() async {
  //Bloc
  di.registerFactory(
    () => PokemonBloc(
      getPokemonUseCase: di(),
      capturePokemonUseCase: di(),
      getCapturedPokemonsUseCase: di(),
    ),
  );

  // Use cases
  di.registerLazySingleton(() => GetCapturedPokemonsUseCase(repository: di()));
  di.registerLazySingleton(() => GetPokemonUseCase(repository: di()));
  di.registerLazySingleton(() => CapturePokemonUseCase(repository: di()));

  // Repository
  di.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(localDataSource: di(), remoteDataSource: di()),
  );

  // Data sources
  di.registerLazySingleton<PokemonLocalDataSource>(
    () => HivePokemonLocalDataSourceImpl(),
  );
  di.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonsRemoteDataSourceImpl(),
  );
}
