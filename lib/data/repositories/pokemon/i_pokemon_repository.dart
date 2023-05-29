import 'package:flutter_pokemon/domain/models/api_resource.dart';
import 'package:flutter_pokemon/domain/models/pokemon.dart';
import 'package:flutter_pokemon/domain/models/pokemon_species.dart';

abstract class PokemonRepository {
  Future<List<APIResource>> fetchPokemonList({int resultsPerPage, int page});

  Future<Pokemon> fetchPokemonByID(covariant Object id);

  Future<PokemonSpecies> fetchPokemonSpeciesByID(covariant Object id);
}
