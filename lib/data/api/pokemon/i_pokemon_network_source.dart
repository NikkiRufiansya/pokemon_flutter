import 'package:flutter_pokemon/domain/models/api_resource.dart';
import 'package:flutter_pokemon/domain/models/models.dart';
import 'package:flutter_pokemon/domain/models/pokedex.dart';
import 'package:flutter_pokemon/domain/models/pokemon_species.dart';

abstract class PokemonNetworkSource {
  Future<Pokemon> fetchPokemonByID(covariant Object id);

  Future<PokemonSpecies> fetchPokemonSpeciesByID(covariant Object id);

  Future<List<APIResource>> fetchPokemonList({
    required int resultsPerPage,
    required int page,
  });

  Future<Pokedex> fetchPokedex(Object id);
}
