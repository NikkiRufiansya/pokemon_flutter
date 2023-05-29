import 'package:flutter_pokemon/data/database/index/index_database.dart';
import 'package:flutter_pokemon/data/repositories/pokedex/i_pokedex_repository.dart';
import 'package:flutter_pokemon/domain/models/pokedex.dart';
import 'package:flutter_pokemon/domain/models/pokemon_entry.dart';
import 'package:flutter_pokemon/domain/use_cases/interfaces/pokemon_index_use_case.dart';

const NATIONAL_POKEDEX = 1;

class IndexUseCaseImpl implements PokemonIndexUseCase {
  final PokedexRepository pokedexRepository;

  final IndexDatabase indexRepository;

  IndexUseCaseImpl({
    required this.pokedexRepository,
    required this.indexRepository,
  });

  @override
  Future<void> createIndex(List<PokemonEntry> entries) {
    return indexRepository.createIndex(entries);
  }

  @override
  Future<Pokedex> fetchIndex() {
    return pokedexRepository.fetchPokedex(NATIONAL_POKEDEX);
  }

  @override
  Future<int> countCurrentIndex() {
    return indexRepository.readIndex();
  }
}
