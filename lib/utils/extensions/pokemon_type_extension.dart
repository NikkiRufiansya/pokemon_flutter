import 'package:flutter/material.dart';
import 'package:flutter_pokemon/UI/utils/type_colors.dart';
import 'package:flutter_pokemon/domain/models/models.dart';

extension PokemonTypeExtension on PokemonType {
  Color get color => pokemonTypeColors[id] ?? Colors.grey;
}
