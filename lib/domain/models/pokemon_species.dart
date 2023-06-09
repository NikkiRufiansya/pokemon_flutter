// ignore_for_file: unused_import

import 'package:flutter_pokemon/data/api/model/genera.dart';
import 'package:flutter_pokemon/data/api/model/pokemon_name.dart';
import 'package:flutter_pokemon/domain/models/flavor_text.dart';

class PokemonSpecies {
  final int? baseHappiness;
  final int? captureRate;
  final String name;
  final List<VersionableValue<String>>? flavorTexts;
  final String? genera;
  final String id;

  PokemonSpecies({
    this.baseHappiness,
    this.captureRate,
    required this.id,
    required this.name,
    required this.flavorTexts,
    required this.genera,
  });
}
