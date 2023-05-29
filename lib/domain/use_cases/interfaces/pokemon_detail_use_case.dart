import 'package:flutter_pokemon/domain/models/pokemon.dart';
import 'package:flutter_pokemon/domain/models/pokemon_species.dart';
import 'use_case.dart';

abstract class PokemonDetailUseCase implements UseCase {
  Future<Pokemon> getPokemon(Object id);

  Future<PokemonSpecies> getPokemonSpecies(Object id);
}
