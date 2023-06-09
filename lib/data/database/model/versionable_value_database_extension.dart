import 'package:flutter_pokemon/domain/models/flavor_text.dart';
import 'package:flutter_pokemon/domain/models/version.dart';

extension VersionableValueDatabaseExtension on VersionableValue {
  static VersionableValue<T> fromDatabase<T>(Map<String, dynamic> map) {
    return VersionableValue(
      value: map['value'],
      version: PokemonVersion(map['version']),
    );
  }

  Map<String, dynamic> toDatabase() => {
        'value': value,
        'version': version.id,
      };
}
