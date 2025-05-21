import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/core/utils/random_number.dart';
import 'package:pokedex_app/features/domain/use_cases/pokemon/capture_pokemon_use_case.dart';
import 'package:pokedex_app/features/domain/use_cases/pokemon/get_captured_pokemons_use_case.dart';
import 'package:pokedex_app/features/domain/use_cases/pokemon/get_pokemon_use_case.dart';
import 'package:pokedex_app/features/presentation/bloc/pokemon/pokemon_event.dart';
import 'package:pokedex_app/features/presentation/bloc/pokemon/pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final GetCapturedPokemonsUseCase getCapturedPokemonsUseCase;
  final GetPokemonUseCase getPokemonUseCase;
  final CapturePokemonUseCase capturePokemonUseCase;

  PokemonBloc({
    required this.getCapturedPokemonsUseCase,
    required this.getPokemonUseCase,
    required this.capturePokemonUseCase,
  }) : super(PokemonInitialState()) {
    on<OnGetPokemon>((event, emit) async {
      emit(PokemonLoadingState());

      final response = await getPokemonUseCase(randomNumber);

      response.fold(
        (failure) => emit(PokemonFailureState(failure: failure)),
        (pokemon) => emit(GetPokemonState(pokemon: pokemon)),
      );
    });

    on<OnCapturePokemon>((event, emit) async {
      final response = await capturePokemonUseCase(event.pokemon);

      response.fold(
        (failure) => emit(PokemonFailureState(failure: failure)),
        (pokemon) => {},
      );
    });

    on<OnGetCapturedPokemons>((event, emit) async {
      final response = await getCapturedPokemonsUseCase();

      response.fold(
        (failure) => emit(PokemonFailureState(failure: failure)),
        (pokemons) => emit(GetCapturedPokemonsState(pokemons: pokemons)),
      );
    });
  }
}
