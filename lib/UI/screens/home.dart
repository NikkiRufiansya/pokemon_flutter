import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pokemon/UI/bloc/interface/i_index_bloc.dart';
import 'pokemon_list_screen.dart';
import 'splash_screen.dart';
import '../../application/dependency_injection.dart';
import '../../utils/constants/theme/pokedex_theme.dart';

class PokemonHomePage extends StatefulWidget {
  const PokemonHomePage({Key? key}) : super(key: key);

  @override
  State<PokemonHomePage> createState() => _PokemonHomePageState();
}

class _PokemonHomePageState extends State<PokemonHomePage> {
  late Future<void> dependencies;
  late ApplicationBloc bloc;

  @override
  void initState() {
    dependencies = _initDependencies();
    bloc = DependencyInjector().applicationBloc;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: PokedexTheme.theme,
      title: 'Pokemon',
      home: FutureBuilder(
        future: dependencies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return PokemonListScreen();
          }
          return SplashScreen();
           
        },
      ),
    );
  }

  Future<void> _initDependencies() async {
    final di = DependencyInjector();
    await di.databaseManager.initialize();
    bloc.initialize();
  }
}
