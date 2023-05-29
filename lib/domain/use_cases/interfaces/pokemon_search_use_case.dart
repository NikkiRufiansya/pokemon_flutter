import 'package:flutter_pokemon/domain/models/pokedex.dart';

abstract class IPokemonSearchUseCase {
  Future<Pokedex> getPokedex(Object id);

}