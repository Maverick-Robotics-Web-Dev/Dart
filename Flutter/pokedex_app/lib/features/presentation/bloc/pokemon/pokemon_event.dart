import 'package:pokedex_app/features/domain/entities/pokemon/pokemon.dart';

sealed class PokemonEvent {}

class OnGetPokemon extends PokemonEvent {}

class OnCapturePokemon extends PokemonEvent {
  final Pokemon pokemon;

  OnCapturePokemon({required this.pokemon});
}

class OnGetCapturedPokemons extends PokemonEvent {
  OnGetCapturedPokemons();
}
