import 'package:flutter_pokemon/domain/models/pokemon.dart';
import 'package:flutter_pokemon/domain/models/pokemon_species.dart';

abstract class PokemonDatabase {
  Future<Pokemon?> fetchPokemonByID(covariant Object id);

  Future<PokemonSpecies?> fetchPokemonSpeciesByID(covariant Object id);

  Future<void> savePokemonDetail(Pokemon pokemon);

  Future<void> savePokemonSpecies(PokemonSpecies species);
}
