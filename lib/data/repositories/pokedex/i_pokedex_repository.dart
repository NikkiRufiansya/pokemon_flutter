import 'package:flutter_pokemon/domain/models/pokedex.dart';

abstract class PokedexRepository {
  Future<Pokedex> fetchPokedex(Object id);
}
