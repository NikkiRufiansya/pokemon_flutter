import 'package:flutter_pokemon/data/api/model/language.dart';

abstract class LanguageResource<T> {
  ApiLanguage get language;

  T get value;
}
