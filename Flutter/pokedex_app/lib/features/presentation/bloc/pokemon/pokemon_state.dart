import 'package:pokedex_app/core/error/failures.dart';
import 'package:pokedex_app/features/domain/entities/pokemon/pokemon.dart';

sealed class PokemonState {}

final class PokemonInitialState extends PokemonState {}

final class PokemonLoadingState extends PokemonState {}

final class GetPokemonState extends PokemonState {
  final Pokemon pokemon;

  GetPokemonState({required this.pokemon});
}

final class GetCapturedPokemonsState extends PokemonState {
  final List<Pokemon> pokemons;

  GetCapturedPokemonsState({required this.pokemons});
}

final class PokemonFailureState extends PokemonState {
  final Failure failure;

  PokemonFailureState({required this.failure});
}
