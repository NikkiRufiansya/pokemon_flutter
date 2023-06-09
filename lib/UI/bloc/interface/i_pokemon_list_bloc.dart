import 'package:flutter_pokemon/domain/models/pokedex.dart';

import 'bloc.dart';

abstract class IPokemonListBloc implements Bloc {
  Pokedex? get pokedex;

  Stream<Pokedex> get stream;
}
