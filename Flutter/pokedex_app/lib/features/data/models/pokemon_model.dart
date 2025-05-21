import 'package:pokedex_app/features/domain/entities/pokemon/pokemon.dart';

class PokemonModel extends Pokemon {
  PokemonModel({required super.id, required super.name, required super.img});

  factory PokemonModel.fromJson(json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      img: json['sprites']['front_default'],
    );
  }

  factory PokemonModel.fromEntity(Pokemon pokemon) {
    return PokemonModel(id: pokemon.id, name: pokemon.name, img: pokemon.img);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'sprites': {'front_default': img},
    };
  }
}
