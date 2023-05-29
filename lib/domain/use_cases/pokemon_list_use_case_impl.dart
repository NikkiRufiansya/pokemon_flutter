import 'package:flutter_pokemon/data/repositories/pokedex/i_pokedex_repository.dart';
import 'package:flutter_pokemon/domain/models/pokedex.dart';
import 'package:flutter_pokemon/domain/use_cases/interfaces/pokemon_list_use_case.dart';

class PokemonListUseCaseImpl implements PokemonListUseCase {
  PokemonListUseCaseImpl({
    required this.repository,
  });

  final PokedexRepository repository;

  @override
  Future<Pokedex> getPokedex(Object id) {
    return repository.fetchPokedex(id);
  }
}
